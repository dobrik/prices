<?php
/**
 * Created by PhpStorm.
 * User: Dobrik
 * Date: 24.07.2016
 * Time: 19:21
 */
session_start();
$mysql = ['host' => 'localhost', 'user' => 'root', 'password' => '', 'db' => 'companies',];//mysql connection config
$link = new mysqli($mysql['host'],$mysql['user'],$mysql['password'],$mysql['db']);
if($link->connect_error){
    printf("Не удалось подключиться: %s\n", mysqli_connect_error());
    exit();
}