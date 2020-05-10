<?php

require_once 'connect.php';

$id = (int)$_POST['id'];

$query = "SELECT * FROM catalog INNER JOIN catalog_price ON catalog.id_catalog = '$id' AND catalog_price.id_catalog = '$id'";

if (!$request = $mysqli->query($query)) {
    echo "Error: Our query failed to execute and here is why: \n";
    echo "Query: " . $query . "\n";
    echo "Errno: " . $mysqli->errno . "\n";
    echo "Error: " . $mysqli->error . "\n";
    exit;
}

$results = $request->fetch_all(MYSQLI_ASSOC);
echo json_encode($results);