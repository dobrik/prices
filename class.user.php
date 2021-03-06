<?php
include_once 'config.php';


class user
{
    private $username, $password, $remember;

    public function __construct($username, $password, $remember = false)
    {
        global $link;
        $this->link = $link;
        $this->username = $username;
        $this->password = $password;
        $this->remember = $remember;
    }

    protected function checkLogin($login)
    {
        if ($login) {
            $query = $this->link->query("SELECT id FROM users WHERE `username`='{$login}'");
            if ($query->num_rows === 0) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function signIn()
    {
        if ($this->password && $this->username) {
            $md5pass = md5($this->password);
            $login = $this->link->real_escape_string($this->username);
            $logQuery = $this->link->query("SELECT username FROM users WHERE `username`='{$login}' AND `password`='{$md5pass}'");
            if ($this->link->error) {
                echo "Mysql error: " . $this->link->error;
                exit;
            }
            if ($logQuery->num_rows === 1) {
                $_SESSION['logged'] = 'true';
                $_SESSION['username'] = $this->username;
                $_SESSION['ssid'] = $_COOKIE['PHPSESSID'];
                if ($this->remember) {
                    setcookie('remember', true, time() + 60 * 60 * 24 * 7);
                }
                return true;
            } else {
                return 'Wrong password or username!';
            }
        }
    }

    public function signUp()
    {
        if (strlen($this->password) > 5 && $this->checkLogin($this->username)) {
            echo 'yes!';
        } else {
            return 'Check input data!';
        }
    }
}