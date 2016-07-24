<?php
include_once 'config.php';


class names
{
    private $name;

    public function __construct($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        echo $this->name;
    }
}

class user
{
    private $username, $password, $remember, $forgot;

    public function __construct($username, $password, $remember = false, $forgot = false)
    {
        global $link;
        $this->link = $link;
        $this->username = $username;
        $this->password = $password;
        $this->forgot = $forgot;
        $this->remember = $remember;
    }

    public function signIn()
    {
        if ($this->password && $this->username) {
            $md5pass = md5($this->password);
            $logQuery = $this->link->query("SELECT username FROM users WHERE `username`='{$this->username}' AND `password`='{$md5pass}'");
            if ($this->link->error) {
                echo "Mysql error: " . $this->link->error;
                exit;
            }
            if ($logQuery->num_rows === 1) {
                $_SESSION['logged'] = 'true';
                $_SESSION['username'] = $this->username;
            } else {
                return 'Wrong password or username!';
            }

            return var_dump($logQuery->num_rows);
        }
    }
}