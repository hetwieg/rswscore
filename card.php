<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

require('config.php');
require('database.php');
require('global.php');

if($user['id'] == -1) {
    header("location: /");
    die('Go back');
}

echo '<style>.lf { float: left; border: 1px solid #000; padding: 5px; margin: 5px;} </style>';

include('./lib/qrlib.php'); 

// SVG file format support
$tempDir = './tmp/';

if(!file_exists($tempDir))
    mkdir($tempDir);

if(array_key_exists('posten', $_REQUEST)) {
    $sql = "SELECT * FROM `user` WHERE post > 0";
    
    $db->queryPrepared($sql, [], $stmt_user, $user, true);
    
    while($stmt_user->fetch()) {
        // we building raw data 
        $codeContents = 'rsw.gm2.nl/?tag='.$user['tag']; 
        
        // generating 
        QRcode::png($codeContents, $tempDir.'post_'.$user['id'].'.png', QR_ECLEVEL_L, 10, 2);
        
        // displaying
        echo '<div class="lf">'.$user['post'].': '.$user['user'].'<br />rsw.gm2.nl/?tag='.$user['tag'].'<br /><img src="tmp/post_'.$user['id'].'.png" /></div>';
    }

    $stmt_user->close();
    unset($user);
}
else {
    $sql = "SELECT * FROM `team`";
    
    $db->queryPrepared($sql, [], $stmt_team, $team, true);
    
    while($stmt_team->fetch()) {
        // we building raw data 
        $codeContents = 'rsw.gm2.nl/'.$team['tag']; 
        
        // generating 
        QRcode::png($codeContents, $tempDir.'team_'.$team['id'].'.png', QR_ECLEVEL_L, 10, 2);
        
        // displaying
        echo '<div class="lf">'.$team['naam'].'<br /><a href="http://rsw.gm2.nl/'.$team['tag'].'">rsw.gm2.nl/'.$team['tag'].'</a><br /><img src="tmp/team_'.$team['id'].'.png" /></div>';
    }

    $stmt_team->close();
    unset($team);
}
?>