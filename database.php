<?php

/**
* Custom {@link \mysqli} class with additional functions.
*/
class DataBase extends \mysqli
{
    public function __construct(array $db)
    {
        parent::__construct($db['host'], $db['user'], $db['pass'], $db['data']);
    }
        
    /**
     * Creates a prepared query, binds the given parameters and returns the result of the executed
     * {@link \mysqli_stmt}.
     * @param string $query
     * @param array $args
     * @return bool|\mysqli_result
     */
    public function queryPrepared($query, array $args = null, &$stmt = null, &$out = null, $bind = false)
    {
        if(!$stmt || strlen($query) > 0) {
            $stmt = $this->prepare($query);

            if(!$stmt) {
                echo $query."<br />".$this->error;
                return false;
            }
        }
            
        if($args && count($args) > 0) {
            $params = [];
            
            $types = array_reduce($args, function ($string, &$arg) use (&$params) {
                $params[] = &$arg[1];

                $string   .=  $arg[0];
                
                return $string;
            }, '');
            array_unshift($params, $types);
            
            call_user_func_array([$stmt, 'bind_param'], $params);
        }

        if(!$stmt->execute())
            return false;
        
        if($bind) {
            $data = $stmt->result_metadata();
            $fields = [];
            $out = [];

            while($field = $data->fetch_field()) {
                $fields[] = &$out[$field->name];
            }

            $stmt->store_result();
            call_user_func_array([$stmt, 'bind_result'], $fields);

            return $fields;
        }
        else {
            $result = $stmt->get_result();
            $stmt->close();
        
            return $result;
        }
    }
}

?>