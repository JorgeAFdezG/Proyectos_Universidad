<?php
include 'conexionDB.php';

if (!isset($_GET['id'])) {
    die("ID no especificado.");
}

$id = intval($_GET['id']);

// 1) Recuperar la ruta relativa (con subcarpeta y sufijo si aplica)
$res = $conexion->prepare("SELECT name FROM upload WHERE id = ?");
$res->bind_param("i", $id);
$res->execute();
$res->bind_result($rutaRel);  // p.ej. "facturas/2025-05-25-5f2a1b2c3d4e5.pdf" o "documento-5f2a1b2c3d4e5.txt"

if (!$res->fetch()) {
    die("Registro no encontrado.");
}
$res->close();

// 2) Construir la ruta en disco
$rutaEnDisco = __DIR__ . '/uploads/' . $rutaRel;

// 3) Verificar existencia
if (!file_exists($rutaEnDisco)) {
    die("Archivo no encontrado en el servidor.");
}

// 4) Preparar headers para forzar descarga
$nombreDescarga = basename($rutaRel);  // solo "2025-05-25-5f2a1b2c3d4e5.pdf"
// Si quisieras el nombre original sin sufijo, tendrías que guardarlo en otra columna

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="' . $nombreDescarga . '"');
header('Expires: 0');
header('Cache-Control: must-revalidate');
header('Pragma: public');
header('Content-Length: ' . filesize($rutaEnDisco));

// 5) Leer el archivo
readfile($rutaEnDisco);
exit;
