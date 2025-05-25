const archivoInput   = document.getElementById('archivo');
const carpetaInput   = document.getElementById('carpeta');
const areaArchivo    = document.getElementById('areaArchivo');
const areaCarpeta    = document.getElementById('areaArchivoCarpeta');
const infoArchivo    = document.getElementById('infoArchivo');
const nombreArchivo  = document.getElementById('nombresArchiv');
const cancelBtn      = document.getElementById('cancelBtn');
const circleViewsLeft    = document.getElementById('circleLeftFloating');
const circleViewsRight    = document.getElementById('circleRightFloating');
const rectangleViewsLeft    = document.getElementById('rectagleLeftFloating');
const rectangleViewsRight    = document.getElementById('rectagleRightFloating');
const textSelected   = document.getElementById('textSeleted');
const textSelectedConfirm   = document.getElementById('textSeletedConfirm');
function mostrarArchivos(files) {
  if (files.length > 0) {
    const lista = [...files].map(f => `<li>${f.name}</li>`).join('');
    if (files.length === 1) {
      // Solo se selecciono un archivo
      textSelected.innerHTML = `<p class="text-success">Archivo seleccionado:</p>`;
      textSelectedConfirm.innerHTML = `<p class="fw-bold">¿Estás seguro que quieres subir este archivo?</p>`;
    } else {
      // Selecciono multiples Archivos
      textSelected.innerHTML = `<p class="text-success">Archivos seleccionados:</p>`;
      textSelectedConfirm.innerHTML = `<p class="fw-bold">¿Estás seguro que quieres subir estos archivos?</p>`;
    }
    nombreArchivo.innerHTML = lista;
    circleViewsLeft.classList.add('d-none');
    circleViewsRight.classList.add('d-none');
    rectangleViewsLeft.classList.add('d-none');
    rectangleViewsRight.classList.add('d-none');
    areaArchivo.classList.add('d-none');
    infoArchivo.classList.remove('d-none');
  }
}

archivoInput.addEventListener('change', () => {
  mostrarArchivos(archivoInput.files);
});
carpetaInput.addEventListener('change', () => {
  mostrarArchivos(carpetaInput.files);
});
cancelBtn.addEventListener('click', () => {
  archivoInput.value = '';
  nombreArchivo.innerHTML = '';
  infoArchivo.classList.add('d-none');
  areaArchivo.classList.remove('d-none');
  circleViewsLeft.classList.remove('d-none');
    circleViewsRight.classList.remove('d-none');
    rectangleViewsLeft.classList.remove('d-none');
    rectangleViewsRight.classList.remove('d-none');
});

// Drag & Drop opcional
['dragenter','dragover'].forEach(evt => {
  areaArchivo.addEventListener(evt, e => {
    e.preventDefault(); e.stopPropagation();
    areaArchivo.classList.add('dragover');
  });
});
['dragleave','drop'].forEach(evt => {
  areaArchivo.addEventListener(evt, e => {
    e.preventDefault(); e.stopPropagation();
    areaArchivo.classList.remove('dragover');
  });
});

areaArchivo.addEventListener('drop', e => {
  const files = e.dataTransfer.files;
  archivoInput.files = files;
  mostrarArchivos(files);
});
