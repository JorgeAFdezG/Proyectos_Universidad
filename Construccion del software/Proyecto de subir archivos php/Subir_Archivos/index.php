<!--Se inicializa con la conexion a la base de datos de mySQL-->
<?php include 'conexionDB.php'; ?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Gestor de Archivos JAFG</title>
    <!--Style Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <!--Style-->
    <link href="css/index.css" rel="stylesheet" />
    <!--Style table-->
    <!-- jQuery (requerido por DataTables) -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <!--Se terminan los Style table-->
</head>

<body class="bg-light">
    <!--Nav Bar-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <!--el href de la siguiente linea se puede susituir por: https://ucalmecac.edu.mx/ en caso de ser necesario-->
            <a class="navbar-brand" href="#">UNIVERSIDAD CALMECAC - Gestor De Archivos</a>
        </div>
    </nav>
    <!--Termina la Nav Bar-->
    <!--Seleccionar Archivo-->
    <div class="containaerSeendArchive">
        <!-- BOTÓN FLOTANTE O ELEMENTO SUPERPUESTO -->
        <div id="rectagleRightFloating" class='rectagleRightFloating'>
            <div class='contentCircleImage'>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path
                        d="M21 19V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2ZM8.5 13.5 11 17l3.5-4.5 4.5 6H5l3.5-5Zm6.5-6a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z" />
                </svg>
            </div>
            <div class='contentRetangleImage'></div>
        </div>
        <div id="circleLeftFloating"class='circleLeftFloating'>
            <div class='contentCircleDocuments'>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                    <path
                        d="M6 2a2 2 0 0 0-2 2v16.01A2 2 0 0 0 6 22h12a2 2 0 0 0 2-2V8l-6-6H6Zm7 1.5L18.5 9H13a1 1 0 0 1-1-1V3.5ZM8 13.5h8v1H8v-1Zm0 3h8v1H8v-1Z" />
                </svg>
            </div>
        </div>
        <div id="rectagleLeftFloating" class='rectagleLeftFloating'>
            <div class='contentCircle'>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                    <path
                        d="M17 10.5V6a2 2 0 0 0-2-2H5.5A1.5 1.5 0 0 0 4 5.5v13A1.5 1.5 0 0 0 5.5 20H15a2 2 0 0 0 2-2v-4.5l4 4v-11l-4 4Z" />
                </svg>
            </div>
            <div class='contentRetangle'></div>
        </div>
        <div id="circleRightFloating" class='circleRightFloating'>
            <div class='contentCircleArchivos'>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                    <path
                        d="M10 4H4a2 2 0 0 0-2 2v3h20V8a2 2 0 0 0-2-2h-8l-2-2Zm12 5H2v9a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V9Z" />
                </svg>
            </div>
        </div>
        <div class='divContentAreaSelected'>
            <form id="formularioSubida" action="upload.php" method="POST" enctype="multipart/form-data">
                <!-- Área azul punteada -->
                <div id="areaArchivo" class="upload-area mb-3">
                    <label for="archivo">
                        <strong> 📄 Sube tu archivo o archivos aquí</strong>
                        <p class="text-muted">Haz clic para seleccionar un archivo</p>
                        <input type="file" name="archivos[]" id="archivo" class="d-none" multiple>
                    </label>
                </div>
                <!-- Confirmación -->
                <div id="infoArchivo" class="text-center d-none">
                    <div id='textSeleted'></div>
                    <div id="nombresArchiv"></div>
                     <div id='textSeletedConfirm'></div>
                    <div class="d-flex justify-content-center gap-2">
                        <button type="submit" class="btn btn-success">Subir</button>
                        <button type="button" class="btn btn-secondary" id="cancelBtn">Cancelar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--Se inporta el archivo js-->
    <script src='js/uploadFile.js'></script>
    <!--se termina la importacion del js-->
    <!--Termina seccion subir archivos-->
    <!--Mis Archivos subidos-->
    <div class="container py-5">
        <hr>
        <h3>Mis Archivos Subidos</h3>
        <div class="controles-tabla mb-3 d-flex justify-content-between align-items-center">
            <div>
                Mostrar
                <select id="selectFilas" class="form-select d-inline-block" style="width: auto;">
                    <option value="5" selected>5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                </select>
                elementos
            </div>
            <div>
                Buscar: <input type="text" id="inputBuscar" class="form-control d-inline-block" style="width: 250px;"
                    placeholder="Buscar archivo...">
            </div>
        </div>
        <table id="tablaArchivos" class="table-profesional">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre del Archivo</th>
                    <th>Fecha</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="tbodyArchivos">
                <?php
            $consulta = $conexion->query("SELECT * FROM upload ORDER BY date DESC");
            if (!$consulta) {
                die("Error en la consulta: " . $conexion->error);
            }
            while ($fila = $consulta->fetch_assoc()) {
                $id   = $fila['id'];
                $name = htmlspecialchars($fila['name'], ENT_QUOTES, 'UTF-8');
                $date = $fila['date'];
                echo "<tr>
                        <td>{$id}</td>
                        <td>{$name}</td>
                        <td>{$date}</td>
                        <td>
                          <a href='descargar.php?id={$id}' class='btn-accion btn-descargar'>Descargar</a>
                          <a href='eliminar.php?id={$id}&file={$name}' class='btn-accion btn-eliminar'>Eliminar</a>
                        </td>
                      </tr>";
            }
            ?>
            </tbody>
        </table>

        <div class="paginacion" id="paginacion"></div>
    </div>
    <!--Se hace el import js de la tabla-->
    <script src='js/getFilesTable.js'></script>
    <!--Se hace el import js de la paginador-->
    <script src='js/paginator.js'></script>
    <!--Se termina de hacer el import de js-->
    <!-- TerminaMis Archivos subidos-->
</body>

</html>