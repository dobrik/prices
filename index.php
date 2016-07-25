<?php
include_once 'config.php';
include_once 'class.user.php';

$users = new user('user2', 'test66', true);
$users->signUp();

//var_dump($_SESSION);




