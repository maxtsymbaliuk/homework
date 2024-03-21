<?php
declare(strict_types=1);

//phpinfo();
//echo "hello world";
$connection = mysqli_connect('mysql','root','root');


//$connection -> query('CREATE DATABASE `lemp-docker`');
$connection -> query('USE `lemp-docker`');

$sql = 'SELECT * FROM cadets';

$result = $connection->query($sql);

while ($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"] . " - Name: " . $row["name"] . " - Surname: " . $row["surname"] . " - Email: " . $row["email"] . "<br>";
}

