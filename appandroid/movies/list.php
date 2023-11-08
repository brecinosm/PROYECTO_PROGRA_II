<?php

// Datos de conexión a la base de datos
$host = "localhost";  // Cambia esto si tu servidor de MySQL está en otro host
$port = "3306";
$database = "db_empresa2";
$username = "root";
$password = "Collect1";

try {
    // Conexión a la base de datos
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$database", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para obtener los datos de la tabla "productos"
    $sql = "SELECT * FROM productos";

    $stmt = $pdo->query($sql);
    $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Cerrar la conexión a la base de datos
    $pdo = null;

    header('Content-Type: application/json');
    echo json_encode($productos, JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
    // Manejo de errores en caso de problemas con la base de datos
    echo "Error: " . $e->getMessage();
}
