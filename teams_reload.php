<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require("config.php");
require("database.php");
require("global.php");

function randomPassword() {
    $alphabet = 'ABCDEFGHKLNOPRSTUWXYZ';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 4; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

// Connect to MySQL
$db = new DataBase($mysql);
    
if ($db->connect_error) {
    echo(json_encode(['error' => 'Connect Error ('.$db->connect_errno.') '.$db->connect_error]));
    die();
}

if(in_array('teams.reload', $user['auth']) && array_key_exists('teams', $_FILES)) {
    if($_FILES["teams"]["error"] > 0) {
        echo "Upload return Code: " . $_FILES["teams"]["error"] . "<br />";
    }
    else {
        move_uploaded_file($_FILES["teams"]["tmp_name"], "./tmp/teams.csv");
        
        $row = 0;
        $route_max = 2;

        $kampen = [
            [0, 1],
            [20, 2],
            [40, 3],
            [60, 4],
            [80, 5]
        ];
        
        if (($handle = fopen("./tmp/teams.csv", "r")) !== FALSE) {
            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
                $num = count($data);
                
                if($num < 4) continue;
                if($data[2] == '') continue;

                for($i=0;$i<$num;$i++)
                    $data[$i] = htmlentities($data[$i], ENT_COMPAT | ENT_HTML401, "ISO-8859-1");
                
                // Check if exist, then read
                $sql = "SELECT * FROM `team` WHERE `nummer` = ?";
                $db->queryPrepared($sql, [
                    ['i', $data[0]]
                ], $stmt_team, $team, true);
                $stmt_team->fetch();
                $stmt_team->close();

                $team['naam'] = $data[1];
                $team['speltak'] = $data[2];
                $team['groep'] = $data[3];
                
                if(!$team['nummer'])
                    $team['nummer'] = $data[0];
                
                if(!$team['tag'] || strlen($team['tag']) < 2)
                    $team['tag'] = $team['nummer'].randomPassword();
                    
                // Update Routes
                if($team['route'] == 0)
                    $team['route'] = ($row % $route_max) + 1;

                // Update kamp
                foreach($kampen as $k) {
                    if($team['nummer'] > $k[0]) {
                        $team['kamp'] = $k[1];
                    }
                }
                
                echo "<p>".$data[1]."<pre>";
                var_dump($team);
                echo "</pre></p>";

                // Update / insert
                if($team['id']) {
                    $sql = "UPDATE `team` SET `naam`=?, `kamp`=?, `nummer`=?, `tag`=?, `route`=?, `speltak`=?, `groep`=? WHERE `id` = ?;";

                    $db->queryPrepared($sql, [
                        ['s', $team['naam']],
                        ['i', $team['kamp']],
                        ['i', $team['nummer']],
                        ['s', $team['tag']],
                        ['i', $team['route']],
                        ['s', $team['speltak']],
                        ['s', $team['groep']],
                        ['i', $team['id']]
                    ]);
                }
                else {
                    $sql = "INSERT INTO `team` (`naam`, `kamp`, `nummer`, `tag`, `route`, `speltak`, `groep`) VALUES (?,?,?,?,?,?,?);";
                    $db->queryPrepared($sql, [
                        ['s', $team['naam']],
                        ['i', $team['kamp']],
                        ['i', $team['nummer']],
                        ['s', $team['tag']],
                        ['i', $team['route']],
                        ['s', $team['speltak']],
                        ['s', $team['groep']]
                    ]);

                }
                
                $row++;
            }
            fclose($handle);
        }
    }
}

?>
<table width="600">
<form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post" enctype="multipart/form-data">

<tr>
<td width="20%">SOL CSV met Teams</td>
<td width="80%"><input type="file" name="teams" id="teams" /></td>
</tr>

<tr>
<td>Submit</td>
<td><input type="submit" name="submit" /></td>
</tr>

</form>
</table>