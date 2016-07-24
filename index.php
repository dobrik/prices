<?php
include_once 'config.php';
include_once 'class.user.php';


$users = new user('user','te2st');

echo $_SESSION['username'];
$users->test;
