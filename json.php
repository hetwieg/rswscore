<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require("config.php");
require("database.php");
require("global.php");

header("Content-type: application/json; charset=UTF-8");

if (!array_key_exists('data', $_REQUEST)) {
    $json = file_get_contents("php://input");
    $data = json_decode($json, true);
    //echo(json_encode(['error' => 'No action set inside request']));
    //die();
}
else {
    $data = json_decode($_REQUEST['data'], true);
}

// Check if we have all the info
if($data == null) {
    echo(json_encode(['error' => 'No data inside request']));
    die();
}

// Connect to MySQL
$mysqli = new mysqli($mysql['host'], $mysql['user'], $mysql['pass'], $mysql['data']);

if ($mysqli->connect_error) {
    echo(json_encode(['error' => 'Connect Error ('.$mysqli->connect_errno.') '.$mysqli->connect_error]));
    die();
}
$return = [];

// --------------------------------------------------------------------------------
// Verwerk alle acties (Check login status)

foreach($data['data'] as $args) {
    $command = key($args);
    $args = $args[$command];
    
    if(!in_array($command, $user['auth'])) {
        $return[] = ['update.rights_error' => [$command => $args]];
        continue;
    }
    
    switch($command) {
    case 'team.update': {
        $stmt_setTeam = $mysqli->prepare("UPDATE `team` SET `naam` = ?, `nummer` = ?, `tag` = ? WHERE `id` = ?;");
        $stmt_setTeam->bind_param('sssi', $args['naam'], $args['nummer'], $args['tag'], $args['team']);
        $stmt_setTeam->execute();
        $stmt_setTeam->close();

        $return[] = ['update' => [$command => $args]];
        
        break;
    }
        
    case 'team.checkout.route': {
        if($args['post'] != $user['post'] && !in_array('team.update.route', $user['auth'])) {
            $return[] = ['update.rights_error' => [$command => $args]];
            break;
        }
        
        $time = time();
        $stmt_setTeamRoute = $mysqli->prepare("INSERT INTO `tocht_log` (`post`, `user`, `team`, `time`, `state`) VALUES (?, ?, ?, ?, 'vertrokke');");
        $stmt_setTeamRoute->bind_param('iiii', $args['post'], $user['id'], $args['team'], $time);
        $stmt_setTeamRoute->execute();
        $stmt_setTeamRoute->close();

        //TODO: Score
        
        $return[] = ['update' => [$command => $args]];
        break;
    }

    case 'team.checkin.route': {
        if($args['post'] != $user['post'] && !in_array('team.update.route', $user['auth'])) {
            $return[] = ['update.rights_error' => [$command => $args]];
            break;
        }
        
        $time = time();
        $stmt_setTeamRoute = $mysqli->prepare("INSERT INTO `tocht_log` (`post`, `user`, `team`, `time`, `state`) VALUES (?, ?, ?, ?, 'aangekome');");
        $stmt_setTeamRoute->bind_param('iiii', $args['post'], $user['id'], $args['team'], $time);
        $stmt_setTeamRoute->execute();
        $stmt_setTeamRoute->close();

        //TODO: Score
        
        $return[] = ['update' => [$command => $args]];
        break;
    }
        
    case 'team.update.route': {
        if($args['aangekome']) {
            $stmt_setTeamRoute = $mysqli->prepare("INSERT INTO `tocht_log` (`post`, `user`, `team`, `time`, `state`) VALUES (?, ?, ?, ?, 'aangekome');");
            $stmt_setTeamRoute->bind_param('iiii', $args['post'], $user['id'], $args['team'], $args['aangekome']);
            $stmt_setTeamRoute->execute();
            $stmt_setTeamRoute->close();
        }

        if($args['vertrokke']) {
            $stmt_setTeamRoute = $mysqli->prepare("INSERT INTO `tocht_log` (`post`, `user`, `team`, `time`, `state`) VALUES (?, ?, ?, ?, 'vertrokke');");
            $stmt_setTeamRoute->bind_param('iiii', $args['post'], $user['id'], $args['team'], $args['vertrokke']);
            $stmt_setTeamRoute->execute();
            $stmt_setTeamRoute->close();
        }

        //TODO: Score
        
        $return[] = ['update' => [$command => $args]];
        
        break;
    }
    }
}

// --------------------------------------------------------------------------------
// Geef huidige DB inhout terug

/**
   team
   - id
   - nummer
   - naam
   - subkamp
   - tag
   - score
   - route
   - - id
   - - in
   - - uit
   - - score
   - punten
   - - onderdeel
   - - - id
   - - - punten
   - - - - id
   - - - - score
**/

// TODO: Get overide
$sql_teams = "SELECT t.*,
  (select coalesce(sum(l.`score`), 0) from `log` l where l.`team` = t.`id` )  AS `score`
FROM `team` t
ORDER BY t.`nummer` ASC";

//TODO: wat te doen met 2 keer op 1 post (hier zullen de tijden uit elkaar gaan lopen
$sql_post = "SELECT ? AS `t`, p.`id`, p.`type_post`,
  (select i.`naam` from `route_info` i where i.`id` = r.`route`) as `route`,
  (select l.`time` from `tocht_log` l where l.`state` ='aangekome' and l.`team` = `t` and l.`post` = p.`id` ORDER BY l.`id` DESC LIMIT 1) AS `aangekome`,
  (select l.`time` from `tocht_log` l where l.`state` = 'vertrokke' and l.`team` = `t` and l.`post` = p.`id` ORDER BY l.`id` DESC LIMIT 1) AS `vertrokke`
FROM `tocht_post` p, `tocht_route` r 
WHERE r.`post` = p.`id`
AND r.`route` = ?
ORDER BY r.`place`";

$stmt_teams = $mysqli->prepare($sql_teams);
$stmt_post = $mysqli->prepare($sql_post);

$stmt_teams->execute();
$rs_teams = $stmt_teams->get_result();
while($team = $rs_teams->fetch_assoc()) {
    $route = $team['route'];
    $team['route'] = [];

    $stmt_post->reset();
    $stmt_post->bind_param('ii', $team['id'], $route);
    $stmt_post->execute();
    $rs_post = $stmt_post->get_result();
    
    $nr = 1;
    while($post = $rs_post->fetch_assoc()) {
        if($post['type_post'] == 'post') {
            $post['nummer'] = $nr++;
        }
        elseif($post['type_post'] == 'start') {
            $post['nummer'] = 0;
            
            if(!$post['vertrokke']) {
                $post['aangekome'] = time();
            }
        }
        elseif($post['type_post'] == 'stop') {
            $post['nummer'] = 1001;
        }

        unset($post['t']);
        unset($post['type_post']);
        
        $team['route'][] = $post;
    }
        
    $team['type'] = 'team';
    $return[] = $team;
}
$stmt_post->close();
$stmt_teams->close();

/**   
   kamp
   - id
   - naam
**/

$sql = "SELECT * 
FROM `subkamp`
ORDER BY `id`";

$stmt_kamp = $mysqli->prepare($sql);
$stmt_kamp->execute();
$rs_kamp = $stmt_kamp->get_result();
while($kamp = $rs_kamp->fetch_assoc()) {
    $kamp['type'] = 'kamp';
    $return[] = $kamp;
}
$stmt_kamp->close();

/**   
   post
   - id
   - type_post
   - naam
   - nummer
**/

$sql = "SELECT
    p.*,
    IFNULL(
        (
        SELECT
            v.`max`
        FROM
            `score_veld` v
        WHERE
            v.naam = CONCAT('post[', p.`id`, '].score')
    ),
    0
    ) AS `max_score`
FROM
    `tocht_post` AS p`";

$stmt_tocht_post = $mysqli->prepare($sql);
$stmt_tocht_post->execute();
$rs_tocht_post = $stmt_tocht_post->get_result();
while($tocht_post = $rs_tocht_post->fetch_assoc()) {
    $tocht_post['type'] = 'tocht_post';
    $return[] = $tocht_post;
}
$stmt_tocht_post->close();

// Cleanup DB
$mysqli->close();
unset($mysqli);

// Return responce
$return[] = ['type'=>'time','lastTime'=>time()];
echo json_encode($return);

/**   
   route
   - id
   - naam

   onderdeel
   - id
   - naam
   
   punten
   - id
   - onderdee
   - naam
   - omschrijving
   - max
 **/

?>