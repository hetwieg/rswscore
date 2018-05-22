var server = "/json.php";

var selfView = null;
var autoUpdate = true;
var sortRouteAtNumber = !true; // false voor sorteren op volgorde

ko.options.deferUpdates = true;


function Team(id) {
  var self = this;
  
  self.id = id;
  self.nummer = ko.observable(-1);
  self.tag = ko.observable('');
  self.naam = ko.observable('');
  self.score = ko.observable(0);
  
  self.kamp = ko.observable();
  self.route = ko.observableArray([]);
  
  self.lastAction = ko.computed(function() {
    var lastTime = 0;
    var lastAction = "";

    ko.unwrap(self.route).forEach(function(i){
      if(ko.unwrap(i.aangekome) && lastTime < ko.unwrap(i.aangekome)) {
        lastTime = ko.unwrap(i.aangekome);
        lastAction = ko.unwrap(i.nummer_naam) + " (Aangekome)";
      }

      if(ko.unwrap(i.vertrokke) && lastTime < ko.unwrap(i.vertrokke)) {
        lastTime = ko.unwrap(i.vertrokke);
        lastAction = ko.unwrap(i.nummer_naam) + " (Vertrokke)";
      }
    });


    return lastAction;
  });
  
  self.gelope = ko.computed(function() {
    var sum = 0;

    ko.unwrap(self.route).forEach(function(i){
      if(ko.unwrap(i.gelope))
        sum += ko.unwrap(i.gelope)
    });
    
    return sum;
  });
  
  self.post = ko.computed(function() {
    var sum = 0;

    ko.unwrap(self.route).forEach(function(i){
      if(ko.unwrap(i.post))
        sum += ko.unwrap(i.post)
    });
    
    return sum;
  });

  self.postScore = ko.computed(function() {
    var sum = 0;

    ko.unwrap(self.route).forEach(function(i){
      if(ko.unwrap(i.aangekome) && ko.unwrap(i.type_post) == 'post')
        sum += ko.unwrap(i.maxScore);
    });
    
    return sum;
  });
  
  self.tijdScore = ko.computed(function() {
    var now = new Date();
    var start = new Date(now.getFullYear(), now.getMonth(), now.getDate()) / 1000;
    
    var tijd = ko.unwrap(self.gelope);
    var min = ko.unwrap(selfView.minTijd) - start;
    var max = ko.unwrap(selfView.maxTijd) - start;
    var punten = ko.unwrap(selfView.maxPunten);
    
    if(tijd <= min)
      return punten/1;
    
    if(max - tijd < 0)
      return 0;
    
    return Math.round((punten / (max - min)) * (max - tijd));
  });
  
  self.selectLog = function() {
    selfView.selectLogTeam(self);
    selfView.tijdenVisible(true);
  }
  
  self.checkIn = function() {
    selfView.selectTeamCheckIn(self);
    selfView.checkInVisible(true);
  }

  self.checkInOk = function() {
    var params = {
      team: self.id,
      post: ko.unwrap(selfView.selectPost).id,
    };
    
    var data = [
      {'team.checkin.route': params}
    ];
    ServerPush(data);
    
    selfView.checkInVisible(false);
  }

  // Update connection back to server
  self.update_in_progress = true;
  ko.computed(function() {
    var params = {
      team: self.id,
      nummer: ko.unwrap(self.nummer),
      tag: ko.unwrap(self.tag),
      naam: ko.unwrap(self.naam),
      //kamp: ko.unwrap(self.kamp)
    };

    if(self.update_in_progress) return;

    var data = [
      {'team.update': params}
    ];
    ServerPush(data);    
  }).extend({throttle: 500});
  
  self.update = function(data) {
    if(self.id == data.id) {
      self.update_in_progress = true;
      
      self.nummer(data.nummer);
      self.tag(data.tag);
      self.naam(data.naam);
      self.score(parseInt(data.score));
      
      // kamp
      var kamp = null;
      ko.unwrap(selfView.kampen).forEach(function(k) {
        if(k.id == data.kamp) {
          kamp = k;
          if(k.teams.indexOf(self) == -1) {
            k.teams.push(self);
          }
        }
        else {
          k.teams.remove(self);
        }

        if(kamp)
          kamp.teams.sort(function (left, right) {
            return ko.unwrap(left.nummer) == ko.unwrap(right.nummer) ? 0 :
              (ko.unwrap(left.nummer) < ko.unwrap(right.nummer) ? -1 : 1)
          });
      });
      self.kamp(kamp);
      
      // route add
      data.route.forEach(function(post) {
        ko.unwrap(selfView.posten).forEach(function(postInfo) {
          if(postInfo.id == post.id) {
            var found = false;
            
            ko.unwrap(self.route).forEach(function(route) {
              if(route.id == post.id) {
                route.update(post);
                found = true;
              }
            });

            if(!found) {
              var route = new Post(postInfo, self);
              route.update(post);
              self.route.push(route);
              postInfo.teams.push(self);
            }
          }
        });
      });
      
      // route cleanup
      ko.unwrap(self.route).forEach(function(route) {
        var remove = true;

        data.route.forEach(function(post) {
          if(route.id == post.id) {
            remove = false;
          }
        });

        if(remove) {
          ko.unwrap(selfView.posten).forEach(function(postInfo) {
            if(postInfo.id == route.id) {
              postInfo.teams.remove(self);
            }
          });
          
          self.route.remove(route);
        }
      });

      if(sortRouteAtNumber) {
        self.route.sort(function (left, right) {
          return left.id == right.id ? 0 :
            (left.id < right.id ? -1 : 1)
        });
      }
      else {
        self.route.sort(function (left, right) {
          return ko.unwrap(left.nummer) == ko.unwrap(right.nummer) ? 0 :
            (ko.unwrap(left.nummer) < ko.unwrap(right.nummer) ? -1 : 1)
        });
      }
      
      // Now we ready for saving changes
      setTimeout(function(){
        self.update_in_progress = false;
      }, 501);
    }
  }
}

function Post(postInfo, team) {
  var self = this;
  
  // Link to info
  self.id = postInfo.id;
  self.type_post = postInfo.type_post;
  self.naam = postInfo.naam;
  self.maxScore = postInfo.maxScore;
  self.team = team;
  
  // For each team unic
  self.aangekome = ko.observable(0);
  self.vertrokke = ko.observable(0);
  self.score = ko.observable(0);
  self.nummer = ko.observable();
  self.route = ko.observable("");
  
  self.state = ko.computed(function() {
    var aan = ko.unwrap(self.aangekome);
    var ver = ko.unwrap(self.vertrokke);

    if(ver && ko.unwrap(self.type_post) == 'start')
      return "success";
    
    if(aan && ko.unwrap(self.type_post) == 'stop')
      return "success";
    
    if(aan && !ver)
      return 'warning';
    
    if(!ver||!aan)
      return 'default';
    
    if(ver > aan)
      return 'success';
    
    return 'danger';
  }, self);
  
  self.nummer_naam = ko.computed(function() {
    return ko.unwrap(self.naam).replace("{$nr}", ko.unwrap(self.nummer));
  }, self);

  self.gelope = ko.computed(function() {
    var end = ko.unwrap(self.aangekome);
    var start = 0;

    if(!self.team)
      return null;
    
    ko.unwrap(self.team.route).forEach(function(route) {
      var t = ko.unwrap(route.vertrokke);
      
      if(t < end)
        start = Math.max(start, t);
    });

    if(start == 0) return null;
    if(end - start < 0) return null;
    return end - start;
  });

  self.post = ko.computed(function() {
    var start = ko.unwrap(self.aangekome);
    var end = ko.unwrap(self.vertrokke);

    if(start && end) {
      if(end - start < 0) return null;
      return end - start;
    }
    return null;
  });

  self.vertrek = function() {
    selfView.selectVertrek(self);
    selfView.vertrekVisible(true);
  }
  
  self.scoreT = ko.observable();
  self.checkOut = function() {
    var params = {
      team: self.team.id,
      post: self.id,
      score: ko.unwrap(self.scoreT)
    };
    
    var data = [
      {'team.checkout.route': params}
    ];
    ServerPush(data);

    selfView.vertrekVisible(false);
  }
  
  // Update connection back to server
  self.update_in_progress = true;
  ko.computed(function() {
    var params = {
      team: self.team.id,
      post: self.id,
      
      aangekome: ko.unwrap(self.aangekome),
      vertrokke: ko.unwrap(self.vertrokke),
      score: ko.unwrap(self.score)
    };

    if(self.update_in_progress) return;

    var data = [
      {'team.update.route': params}
    ];
    ServerPush(data);    
  }).extend({throttle: 500});
  
  self.update = function(data) {
    if(self.id == data.id) {
      self.update_in_progress = true;

      self.aangekome(data.aangekome);
      self.vertrokke(data.vertrokke);
      self.score(data.score);
      self.nummer(data.nummer);
      self.route(data.route);
    
      // Now we ready for saving changes
      setTimeout(function(){
        self.update_in_progress = false;
      }, 501);
    }
  }
}

function PostInfo(id) {
  var self = this;
  
  self.id = id;
  self.type_post = ko.observable();
  self.naam = ko.observable();
  self.maxScore = ko.observable(0);
  
  self.teams = ko.observableArray([]);
  
  self.aanwezig = ko.computed(function(){
    var arr = [];
    
    ko.unwrap(self.teams).forEach(function(team) {
      var set = null;
      ko.unwrap(team.route).forEach(function(route) {
        if(route.id == self.id) {
          if(!ko.unwrap(route.vertrokke) && ko.unwrap(route.aangekome)) {
            set = route;
            arr.push(route);
          }
        }
      });
    });

    arr.sort(function (left, right) {
      return ko.unwrap(left.aangekome) == ko.unwrap(right.aangekome) ? 0 :
        (ko.unwrap(left.aangekome) < ko.unwrap(right.aangekome) ? -1 : 1)
    });
    
    return arr;
  });
  
  self.verwacht = ko.computed(function(){
    var arr = [];
    
    ko.unwrap(self.teams).forEach(function(team) {
      var last = null;
      var set = null;
      ko.unwrap(team.route).sort(function (left, right) { // Altijd op loopvolgorde sorteren
        return ko.unwrap(left.nummer) == ko.unwrap(right.nummer) ? 0 :
          (ko.unwrap(left.nummer) < ko.unwrap(right.nummer) ? -1 : 1)
      }).forEach(function(route) {
        if(route.id == self.id) {
          if(last && ko.unwrap(last.vertrokke) && !ko.unwrap(route.aangekome)) {
            set = last;
            arr.push(set);
          }
        }
        if(set && ko.unwrap(route.type_post) == 'stop' && ko.unwrap(route.aangekome)) {
          var t = arr.indexOf(set);
          if(t > -1)
            arr.splice(t, 1);
          set = null;
        }
        last = route;
      });
    });

    arr.sort(function (left, right) {
      return ko.unwrap(left.vertrokke) == ko.unwrap(right.vertrokke) ? 0 :
        (ko.unwrap(left.vertrokke) < ko.unwrap(right.vertrokke) ? -1 : 1)
    });
    
    return arr;
  });
  
  self.vertrokke = ko.computed(function(){
    var arr = [];

    ko.unwrap(self.teams).forEach(function(team) {
      ko.unwrap(team.route).forEach(function(route) {
        if(route.id == self.id) {
          if(ko.unwrap(route.vertrokke) && (ko.unwrap(route.aangekome) || ko.unwrap(route.type_post) == 'start')) {
            arr.push(route);
          }
        }
      });
    });

    arr.sort(function (left, right) {
      return ko.unwrap(left.vertrokke) == ko.unwrap(right.vertrokke) ? 0 :
        (ko.unwrap(left.vertrokke) > ko.unwrap(right.vertrokke) ? -1 : 1)
    });
    
    return arr;
  });

  self.selectPost = function() {
    selfView.selectPost(self);
  }

  self.toonVertrokke = function() {
    selfView.vertrokkeVisible(true);
  }
  
  // Update connection back to server
  self.update_in_progress = true;
  ko.computed(function() {
    var params = {
      post: self.id,

      type_post: ko.unwrap(self.type_post),
      naam: ko.unwrap(self.naam),
    };

    if(self.update_in_progress) return;

    var data = [
      {'post.update': params}
    ];
    ServerPush(data);    
  }).extend({throttle: 500});
  
  self.update = function(data) {
    if(self.id == data.id) {
      self.update_in_progress = true;
      
      self.type_post(data.type_post);
      self.naam(data.naam);
      self.maxScore(data.max_score);
      
      // Now we ready for saving changes
      setTimeout(function(){
        self.update_in_progress = false;
      }, 501);
    }
  }
}

function Kamp(id) {
  var self = this;
  
  self.id = id;
  self.naam = ko.observable('');
  self.teams = ko.observableArray([]);
  self.score = ko.computed(function() {
    var sum = 0;
    
    ko.unwrap(self.teams).forEach(function(t){
      sum += ko.unwrap(t.score);
    });
    
    return sum;
  }, self);

  // Update connection back to server
  self.update_in_progress = true;
  ko.computed(function() {
    var params = {
      kamp: self.id,
      
      naam: ko.unwrap(self.naam),
    };

    if(self.update_in_progress) return;

    var data = [
      {'kamp.update': params}
    ];
    ServerPush(data);    
  }).extend({throttle: 500});
  
  self.update = function(data) {
    if(self.id == data.id) {
      self.update_in_progress = true;
      
      self.naam(data.naam);
      
      // Now we ready for saving changes
      setTimeout(function(){
        self.update_in_progress = false;
      }, 501);
    }
  }
}

function updateArray(data, type, list, created) {
  if(data.type == type) {
    var found = 0;
    ko.unwrap(list).forEach(function(i) {
      if(i.id == data.id) {
        found = i;
        i.update(data);
      }
    });
    
    if(found === 0) {
      var i = new created(data.id);
      i.update(data);
      list.push(i);
    }
  }
}

function AppViewModel() {
  var self = this;
  selfView = self;

  self.selectLogTeam = ko.observable();
  self.tijdenVisible = ko.observable(false);

  self.selectPost = ko.observable();
  self.vertrokkeVisible = ko.observable(false);
  
  self.selectTeamCheckIn = ko.observable();
  self.checkInVisible = ko.observable(false);
  
  self.selectVertrek = ko.observable();
  self.vertrekVisible = ko.observable(false);
  
  self.teams = ko.observableArray([]);
  self.selectTeam = ko.observable();

  // Voor tocht tijd punten
  self.minTijd = ko.observable(0);
  self.maxTijd = ko.observable(0);
  self.maxPunten = ko.observable(80);
  
  self.teamsGelope = ko.computed(function(){
    var arr = [];
    
    ko.unwrap(self.teams).forEach(function(team) {
      arr.push(team);
    });
    
    arr.sort(function (left, right) {
      return ko.unwrap(left.gelope) == ko.unwrap(right.gelope) ? 0 :
        (ko.unwrap(left.gelope) < ko.unwrap(right.gelope) ? -1 : 1)
    });
    
    return arr;
  });
  
  self.posten = ko.observableArray([]);
  self.kampen = ko.observableArray([]);
  self.lastTime = ko.observable();

  self.selectActive = ko.computed(function() {
    return (ko.unwrap(self.selectPost) || ko.unwrap(self.selectTeam));
  });
  
  // Update function
  self.update = function(jdata) {
    jdata.forEach(function(data) {
      updateArray(data, 'team', self.teams, Team);
      updateArray(data, 'tocht_post', self.posten, PostInfo);
      updateArray(data, 'kamp', self.kampen, Kamp);
            
      if(data.type == 'time') {
        self.lastTime(data.lastTime);
      }
    });
  }
}

// Server communicatie
var serverRequestReddy = false;
function serverSuccess(data) {
  if(!selfView)
    return;
  
  selfView.update(data);

  if(!serverRequestReddy) {
    selfView.update(data);
  }
  
  if(!serverRequestReddy && typeof firstUpdateDone !== "undefined")
    firstUpdateDone();
  
  serverRequestReddy = true;
}

var serverToDo = [];
function ServerPush(data) {
  if(!Object.prototype.toString.call(data) === '[object Array]') {
	  data = [data];
  }

  if(serverToDo === undefined)
	  serverToDo = [];
  
  data.forEach(function(i) {
	  serverToDo.push(i);
  });
}

function ServerUpdate() {
  if(serverToDo.length == 0) return;
  
  var data = ko.toJSON({data: serverToDo});
  serverToDo = [];
  
  return $.ajax({
    type: 'POST',
    url: server,
	  data: data,
    dataType: 'json',
	  success: serverSuccess
  });
}

// Update data on page's
var intervalRequest = function(){
  if(!autoUpdate) return;
  
  var poll = [
    {poll: 'global'}
  ];
  ServerPush(poll);
};

setInterval(ServerUpdate, 500);
setInterval(intervalRequest, 30000);

// Activates knockout.js
$( document ).ready(function() {
  ko.applyBindings(new AppViewModel());

  intervalRequest();
  ServerUpdate();
});
