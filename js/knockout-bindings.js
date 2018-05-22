ko.bindingHandlers.modal = {
	init: function(element, optionsAccessor, allBindingsAccessor, viewModel, bindingContext) {
		var $element = $(element);
    
		if ($element.attr("tabindex") === undefined) {
			$element.attr("tabindex", -1);
		}
    
		$element.modal(ko.toJS(optionsAccessor()));
    
		$element.on("hidden.bs.modal", function() {
			var options = ko.utils.unwrapObservable(optionsAccessor());
			options.show(false);
		});
    
		$(document).on("keyup", function(e) {
			if (e.which === 27) {
				$element.modal("hide");
			}
		});
    
		//hide elements inside modal unless we are showing it
		var _showAccessor = showAccessor.bind(optionsAccessor, optionsAccessor);
		ko.bindingHandlers["if"].init(element, _showAccessor, allBindingsAccessor, viewModel, bindingContext);
	},
	update: function(element, optionsAccessor, allBindingsAccessor, viewModel, bindingContext) {
		var _showAccessor = showAccessor.bind(optionsAccessor, optionsAccessor);
    
		$(element).modal(_showAccessor() ? "show" : "hide");
	}
};

function showAccessor(accessor) {
	var options = ko.utils.unwrapObservable(accessor());
	return ko.utils.unwrapObservable(options.show);
}


function getDateFormat(type, defaultDateFormat){
  var dateFormat = defaultDateFormat;
  if (type == 'date') {
    dateFormat = 'YYYY-MM-DD';
  }
  else if (type == 'datetime-local' || type == 'datetime') {
    dateFormat = 'YYYY-MM-DDTHH:mm';
  }
  else if (type == 'month') {
    dateFormat = 'YYYY-MM';
  }
  else if (type == 'time') {
    dateFormat = 'HH:mm';
  }
  else if(type == 'week'){
    dateFormat = 'GGGG-[W]WW';
  }
  return dateFormat;
}

ko.bindingHandlers.date = {
  init: function(element, valueAccessor, allBindingsAccessor) {
    element.onchange = function() {
      var value = valueAccessor();

      var dateFormat = allBindingsAccessor().dateFormat
          ? ko.utils.unwrapObservable(allBindingsAccessor().dateFormat) : 'L';

      var d;
      if (element.tagName == 'INPUT') {
        var type = element.type;
        dateFormat = getDateFormat(type, dateFormat);
        d = moment(element.value, dateFormat);

        if(type =='date' || type == 'month' || type == 'week'){
          var newD = moment();
          d.hour(newD.hour());
          d.minute(newD.minute());
          d.second(newD.second());
          if(type == 'month' || type == 'week'){
            d.date(newD.date());
          }
        }
      }
      else {
        d = moment(element.textContent, dateFormat);
      }
      
      if (d) {
        if(typeof value === "function"){
          value(d.toDate().getTime() / 1000);
        }
        else if(value instanceof Date){
          value.setTime(d.toDate().getTime());
        }
        else {
          value = d.toDate();
        }
      }
      else {
        if(typeof value === "function"){
          value(null);
        }
        else if(value instanceof Date){
          value.setTime(0);
        }
        else {
          value = null;
        }
      }
    };
  },
  update: function(element, valueAccessor, allBindingsAccessor, viewModel) {
    var value = valueAccessor();
    var valueUnwrapped = ko.utils.unwrapObservable(value);
    
    if(!isNaN(valueUnwrapped)) {
      valueUnwrapped = new Date(valueUnwrapped * 1000);
    }
    
    var dateFormat = allBindingsAccessor().dateFormat
        ? ko.utils.unwrapObservable(allBindingsAccessor().dateFormat) : 'L';
    
    if (element.tagName == 'INPUT' && element != document.activeElement) {
      if(valueUnwrapped instanceof Date && valueUnwrapped.getTime() === 0) {
        element.value = '';
      }
      else {
        dateFormat = getDateFormat(element.type, dateFormat);
        element.value = moment(valueUnwrapped).format(dateFormat);
      }
    }
    else {
      if(valueUnwrapped instanceof Date && valueUnwrapped.getTime() === 0) {
        $(element).text('');
      }
      else {
        $(element).text(moment(valueUnwrapped).format(dateFormat));
      }
    }
  }
};

ko.bindingHandlers.time = {
  update: function(element, valueAccessor) {
    var t = ko.utils.unwrapObservable(valueAccessor());
    
    if(isNaN(t)) {
      $(element).text('');
    }
    else {
      var sec_num = t;
      var hours   = Math.floor(sec_num / 3600);
      var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
      var seconds = sec_num - (hours * 3600) - (minutes * 60);
      
      if (minutes < 10) {minutes = "0"+minutes;}
      if (seconds < 10) {seconds = "0"+seconds;}
      $(element).text(hours+':'+minutes+':'+seconds);
    }
  }
};

ko.bindingHandlers.timer = {
  update: function(element, valueAccessor) {
    var timer = setInterval(function(){
      var end = ko.utils.unwrapObservable(valueAccessor())*1000;
      var now = new Date().getTime();
      var toGo = end - now;
      var text = "";
      var tail = "";
      
      if(toGo < 0) {
        toGo *= -1;
        tail = " geleden";
      }
        
		  var days = Math.floor(toGo/1000/60/60/24);
		  toGo -= days*1000*60*60*24
		  if(days != 0) text += days + " dagen ";
		  
		  var hours = Math.floor(toGo/1000/60/60);
		  toGo -= hours*1000*60*60
		  if(hours > 0) {
        text += hours + " uur en ";
		  }
      
		  var minutes = Math.floor(toGo/1000/60);
		  toGo -= minutes*1000*60
      if(minutes > 0 || hours > 0) {
        text += minutes + " minuten";
		  }
      else {
		    var seconds = Math.floor(toGo/1000);
        if(seconds > 0) {
		      text += seconds + " seconde";
        }
      }
      
      $(element).text(text+tail);
    }, 1000);
  }
}

