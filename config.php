<?php
/**
 * Created by PhpStorm.
 * User: Dobrik
 * Date: 24.07.2016
 * Time: 19:21
 */
session_start();
$mysql = ['host' => 'localhost', 'user' => 'root', 'password' => '', 'db' => 'companies',];
$link = new mysqli($mysql['host'],$mysql['user'],$mysql['password'],$mysql['db']);