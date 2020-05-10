<?php

require_once 'connect.php';

$query = "SELECT * FROM data_shop";

if (!$request = $mysqli->query($query)) {
    echo "Error: Our query failed to execute and here is why: \n";
    echo "Query: " . $query . "\n";
    echo "Errno: " . $mysqli->errno . "\n";
    echo "Error: " . $mysqli->error . "\n";
    exit;
}

$results = $request->fetch_all(MYSQLI_ASSOC);
echo json_encode($results);