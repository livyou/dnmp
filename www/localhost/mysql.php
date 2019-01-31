<?php

//$dbh = new PDO('mysql:host=127.0.0.1;dbname=mysql', 'root' , '123456');
//$dbh = new PDO('mysql:host=193.112.103.175;dbname=mysql', 'root' , '123456');
$dbh = new PDO('mysql:host=172.16.0.6;dbname=mysql', 'root' , '123456');

var_dump($dbh);
// 创建连接
echo "Connected successfully";

