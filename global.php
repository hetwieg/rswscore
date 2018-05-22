<?php

// Connect to database
$db = new DataBase($mysql);

if ($db->connect_error) {
    echo(json_encode(['error' => 'Connect Error ('.$db->connect_errno.') '.$db->connect_error]));
    die();
}

$user = ['id'=>-1];
$team = ['id'=>-1];

if(array_key_exists('user', $_REQUEST) && array_key_exists('password', $_REQUEST)) {
    $sql = "SELECT * FROM `user` WHERE `user` = ? AND `password` = md5(?)";
    
    $db->queryPrepared($sql, [
        ['s', $_REQUEST['user']],
        ['s', $_REQUEST['password']]
    ], $stmt_user, $user, true);
    
    while($stmt_user->fetch()) {
        setcookie($cookie_name, $user['tag'], time() + (86400 * 30), "/"); // 86400 = 1 day
    }
    $stmt_user->close();
}

if(array_key_exists('tag', $_REQUEST)) {
    $tag = $_REQUEST['tag'];
    if(array_key_exists('tag', $_GET)) $tag = $_GET['tag'];

    $tag2 = '-1';
    if(array_key_exists($cookie_name, $_COOKIE)) $tag2 = $_COOKIE[$cookie_name]; 
    
    if($tag == 'LOGOUT') {
        setcookie($cookie_name, '', time() + (86400 * 30), "/"); // 86400 = 1 day
        $tag = '';
        $tag2 = '';
    }
    
    $sql = "SELECT * FROM `user` WHERE `tag` = ? OR `tag` = ?";
    $db->queryPrepared($sql, [
        ['s', $tag],
        ['s', $tag2]
    ], $stmt_user, $user, true);
    
    while($stmt_user->fetch()) {
        setcookie($cookie_name, $user['tag'], time() + (86400 * 30), "/"); // 86400 = 1 day
    }
    $stmt_user->close();

    // ----------------------------------------
    $sql = "SELECT * FROM `team` WHERE `tag` = ?";
    $db->queryPrepared($sql, [
        ['s', $tag]
    ], $stmt_team, $team, true);    
    
    while($stmt_team->fetch()) {
        if(!$user['id']) {
            setcookie($cookie_name, $team['tag'], time() + (86400 * 30), "/"); // 86400 = 1 day
        }
    }
    $stmt_team->close();
}

if($user['id']) {
    $sql = "SELECT v.`naam`
FROM `auth` a, `score_veld` v 
WHERE a.`user` = ? 
AND a.`score_veld` = v.`id`";
    
    $db->queryPrepared($sql, [
        ['i', $user['id']]
    ], $stmt_auth, $auth, true);
    
    $user['auth'] = [];
    while($stmt_auth->fetch()) {
        $user['auth'][] = $auth['naam'];
        setcookie($cookie_name, $user['tag'], time() + (86400 * 30), "/"); // 86400 = 1 day
    }
    $stmt_auth->close();
}
else {
    $user['id'] = -1;
    $user['auth'] = []; 
}

if(!$team['id']) {
    $team['id'] = -1;
}
?>