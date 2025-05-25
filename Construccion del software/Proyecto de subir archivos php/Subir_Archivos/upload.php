<?php
include 'conexionDB.php';

if (empty($_FILES['archivos'])) {
    die("No se subió ningún archivo.");
}
// Archivos en arreglo
$archivos = $_FILES['archivos'];
// Numero de archivos dependiendo del nombre
$total    = count($archivos['name']);
// Detectamos si vienen con sub-rutas (carpeta completa)
$isFolderUpload = false;
foreach ($archivos['name'] as $name) {
    if (strpos($name, '/') !== false) {
        $isFolderUpload = true;
        break;
    }
}
if ($total === 1 && !$isFolderUpload) {
    // Caso 1: un solo archivo suelto
    $nombre   = basename($archivos['name'][0]);
    $tmpPath  = $archivos['tmp_name'][0];
    $ext      = pathinfo($nombre, PATHINFO_EXTENSION);
    $base     = pathinfo($nombre, PATHINFO_FILENAME);
    $unico    = uniqid('-', true);
    $nuevoNombre = "{$base}{$unico}.{$ext}";
    $destino  = "uploads/$nuevoNombre";

    if (!is_dir('uploads')) mkdir('uploads', 0755, true);
    move_uploaded_file($tmpPath, $destino);

    $stmt = $conexion->prepare("INSERT INTO upload (name, date) VALUES (?, NOW())");
    $stmt->bind_param("s", $nuevoNombre);
    $stmt->execute();
    $stmt->close();

} elseif ($isFolderUpload) {
    // Caso 3: carpeta completa
    foreach ($archivos['name'] as $i => $fullPath) {
        $tmpPath = $archivos['tmp_name'][$i];
        $ext     = pathinfo($fullPath, PATHINFO_EXTENSION);
        $base    = pathinfo($fullPath, PATHINFO_FILENAME);
        $dir     = dirname($fullPath);
        $unico   = uniqid('-', true);
        $nuevoNombre = "{$base}{$unico}.{$ext}";
        $rutaRel = ($dir !== '.') ? "$dir/$nuevoNombre" : $nuevoNombre;
        $destino = "uploads/$rutaRel";

        $carpeta = dirname($destino);
        if (!is_dir($carpeta)) mkdir($carpeta, 0755, true);
        move_uploaded_file($tmpPath, $destino);

        $stmt = $conexion->prepare("INSERT INTO upload (name, date) VALUES (?, NOW())");
        $stmt->bind_param("s", $rutaRel);
        $stmt->execute();
        $stmt->close();
    }

} else {
    // Caso 2: múltiples archivos sueltos
    $primerNombre = $archivos['name'][0];
    $folderName   = pathinfo($primerNombre, PATHINFO_FILENAME);
    $baseFolder   = "uploads/$folderName";
    if (!is_dir($baseFolder)) mkdir($baseFolder, 0755, true);

    foreach ($archivos['name'] as $i => $nombre) {
        $tmpPath = $archivos['tmp_name'][$i];
        $ext     = pathinfo($nombre, PATHINFO_EXTENSION);
        $base    = pathinfo($nombre, PATHINFO_FILENAME);
        $unico   = uniqid('-', true);
        $nuevoNombre = "{$base}{$unico}.{$ext}";
        $destino = "$baseFolder/$nuevoNombre";

        move_uploaded_file($tmpPath, $destino);

        $dbPath = "$folderName/$nuevoNombre";
        $stmt = $conexion->prepare("INSERT INTO upload (name, date) VALUES (?, NOW())");
        $stmt->bind_param("s", $dbPath);
        $stmt->execute();
        $stmt->close();
    }
}

header("Location: index.php");
exit();
