document.getElementById('archivo').addEventListener('change', function() {
    if (this.files.length > 0) {
        document.getElementById('areaArchivo').classList.add('d-none');
        document.getElementById('infoArchivo').classList.remove('d-none');
    }
});