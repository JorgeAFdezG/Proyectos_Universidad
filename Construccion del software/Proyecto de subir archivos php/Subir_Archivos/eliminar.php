<?php
// Se incluye la coneccion a la base de datos
include 'conexionDB.php';
// Nota: Cuando sean varios archivos se creara una carpeta por lo tanto cuando se elimine se eliminaran los archivos pero no la carpetas 
if (isset($_GET['id']) && isset($_GET['file'])) {
    $id      = intval($_GET['id']);
    $rutaRel = $_GET['file'];                    // ej. "lapiz-5f2a1b2c3d4e5.pdf"
    $ruta    = "uploads/" . ltrim($rutaRel, '/');
    // Eliminar el archivo del sistema
    if (file_exists($ruta)) {
        unlink($ruta);
    }
    // Eliminar registro de la base de datos
    $stmt = $conexion->prepare("DELETE FROM upload WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
}
header("Location: index.php");
exit();
