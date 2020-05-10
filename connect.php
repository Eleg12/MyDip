<?php

header("Content-type: application/json; charset=utf-8");

$mysqli = new mysqli('h911252449.mysql', 'h911252449_db', 'Rostov2020', 'h911252449_rostov');
if ($mysqli->connect_errno) {
    echo "Error: Failed to make a MySQL connection, here is why: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";
    exit;
}

if (!$mysqli->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $mysqli->error);
    exit;
}