<?php
include_once 'config.php';
include_once 'class.user.php';

$users = new user('user', 'test', true);
$users->signIn();

var_dump($_SESSION);




