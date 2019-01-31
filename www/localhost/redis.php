<?php
$redis = new Redis();
//$redis->connect('172.18.0.5', 6379);
$redis->connect('172.16.0.6', 6379);
$redis->auth('7shangzuo');
$redis->set('bigticket',123);
echo "Connection to server sucessfully";
         //查看服务是否运行
echo "Server is running: " . $redis->ping();
