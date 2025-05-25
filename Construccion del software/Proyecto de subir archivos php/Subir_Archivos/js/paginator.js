const filasPorPagina = 5;
const tabla = document.getElementById("tablaArchivos");
const cuerpoTabla = document.getElementById("tbodyArchivos");
const paginacion = document.getElementById("paginacion");
const filas = Array.from(cuerpoTabla.querySelectorAll("tr"));
const totalPaginas = Math.ceil(filas.length / filasPorPagina);
let paginaActual = 1;
function mostrarPagina(pagina) {
  paginaActual = pagina;
  // Oculta todas las filas
  filas.forEach((fila, index) => {
    fila.style.display = "none";
    const inicio = (pagina - 1) * filasPorPagina;
    const fin = pagina * filasPorPagina;
    if (index >= inicio && index < fin) {
      fila.style.display = "";
    }
  });
  renderizarPaginacion();
}
function renderizarPaginacion() {
  paginacion.innerHTML = "";
  // Botón Anterior
  const btnAnterior = document.createElement("button");
  btnAnterior.textContent = "Anterior";
  btnAnterior.disabled = paginaActual === 1;
  btnAnterior.onclick = () => mostrarPagina(paginaActual - 1);
  paginacion.appendChild(btnAnterior);
  // Botones de páginas
  for (let i = 1; i <= totalPaginas; i++) {
    const btn = document.createElement("button");
    btn.textContent = i;
    btn.disabled = i === paginaActual;
    btn.onclick = () => mostrarPagina(i);
    paginacion.appendChild(btn);
  }
  // Botón Siguiente
  const btnSiguiente = document.createElement("button");
  btnSiguiente.textContent = "Siguiente";
  if (totalPaginas === 0) { 
     btnSiguiente.disabled = true;
  } else {
    btnSiguiente.disabled = paginaActual === totalPaginas;
  }

  btnSiguiente.onclick = () => mostrarPagina(paginaActual + 1);
  paginacion.appendChild(btnSiguiente);
}
// Inicializa
mostrarPagina(1);
