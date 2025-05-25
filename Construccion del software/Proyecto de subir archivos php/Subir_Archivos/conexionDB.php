<?php
// Ejemplo de nombre de mi base de datos: subir_docs
// Aqui se cambia el localhost, usuario, contraseña y nombre de la base de datos
$conexion = new mysqli("localhost", "root", "", "subir_docs");
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
?>