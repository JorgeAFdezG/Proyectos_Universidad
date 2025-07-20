CREATE TABLE ACTIVIDAD_12.usuarios (
usuario_id NUMBER PRIMARY KEY,
nombre VARCHAR2(100),
correo VARCHAR2(150)
);

CREATE TABLE ACTIVIDAD_12.incidentes (
incidente_id NUMBER PRIMARY KEY,
descripcion VARCHAR2(200),
criticidad VARCHAR2(20)
);

CREATE TABLE ACTIVIDAD_12.tickets (
ticket_id NUMBER PRIMARY KEY,
usuario_id NUMBER,
incidente_id NUMBER,
fecha_apertura TIMESTAMP DEFAULT SYSTIMESTAMP,
estado VARCHAR2(20),
FOREIGN KEY (usuario_id) REFERENCES ACTIVIDAD_12.usuarios(usuario_id),
FOREIGN KEY (incidente_id) REFERENCES ACTIVIDAD_12.incidentes(incidente_id)
);

CREATE TABLE ACTIVIDAD_12.chat_ia (
chat_id NUMBER PRIMARY KEY,
ticket_id NUMBER,
mensaje VARCHAR2(300),
quien VARCHAR2(20),
fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
FOREIGN KEY (ticket_id) REFERENCES ACTIVIDAD_12.tickets(ticket_id)
);

CREATE TABLE ACTIVIDAD_12.soluciones (
solucion_id NUMBER PRIMARY KEY,
ticket_id NUMBER,
solucion_texto VARCHAR2(300),
aplicada_por VARCHAR2(20),
fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
FOREIGN KEY (ticket_id) REFERENCES ACTIVIDAD_12.tickets(ticket_id)
);

/*Inserts*/
INSERT INTO ACTIVIDAD_12.usuarios VALUES (1, 'Ana López', 'ana@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (2, 'Carlos Ruiz', 'carlos@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (3, 'Diana Gómez', 'diana@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (4, 'Fernando Pérez', 'fernando@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (5, 'Lucía Torres', 'lucia@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (6, 'Marcos Salas', 'marcos@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (7, 'Patricia Vega', 'patricia@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (8, 'Raúl Mendoza', 'raul@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (9, 'Silvia Castro', 'silvia@correo.com');
INSERT INTO ACTIVIDAD_12.usuarios VALUES (10, 'Tomás Fuentes', 'tomas@correo.com');

INSERT INTO ACTIVIDAD_12.incidentes VALUES (1, 'No enciende el equipo', 'Alta');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (2, 'No hay internet', 'Media');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (3, 'Pantalla azul', 'Alta');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (4, 'No imprime', 'Baja');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (5, 'Virus detectado', 'Alta');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (6, 'Lentitud en sistema', 'Media');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (7, 'Error al abrir app', 'Media');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (8, 'Mouse no responde', 'Baja');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (9, 'Teclado da doble letra', 'Baja');
INSERT INTO ACTIVIDAD_12.incidentes VALUES (10, 'Desbloqueo de cuenta', 'Media');

INSERT INTO ACTIVIDAD_12.tickets VALUES (1, 1, 1, SYSTIMESTAMP, 'Abierto');
INSERT INTO ACTIVIDAD_12.tickets VALUES (2, 2, 2, SYSTIMESTAMP, 'Cerrado');
INSERT INTO ACTIVIDAD_12.tickets VALUES (3, 3, 3, SYSTIMESTAMP, 'Abierto');
INSERT INTO ACTIVIDAD_12.tickets VALUES (4, 4, 4, SYSTIMESTAMP, 'Abierto');
INSERT INTO ACTIVIDAD_12.tickets VALUES (5, 5, 5, SYSTIMESTAMP, 'Cerrado');
INSERT INTO ACTIVIDAD_12.tickets VALUES (6, 6, 6, SYSTIMESTAMP, 'Abierto');
INSERT INTO ACTIVIDAD_12.tickets VALUES (7, 7, 7, SYSTIMESTAMP, 'Cerrado');
INSERT INTO ACTIVIDAD_12.tickets VALUES (8, 8, 8, SYSTIMESTAMP, 'Abierto');
INSERT INTO ACTIVIDAD_12.tickets VALUES (9, 9, 9, SYSTIMESTAMP, 'Cerrado');
INSERT INTO ACTIVIDAD_12.tickets VALUES (10, 10, 10, SYSTIMESTAMP, 'Abierto');

INSERT INTO ACTIVIDAD_12.chat_ia VALUES (1, 1, 'Hola, ¿puedes describir el problema?', 'IA',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (2, 1, 'No enciende mi computadora', 'usuario',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (3, 2, '¿Tienes el router conectado?', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (4, 2, 'Sí, pero no hay señal', 'usuario', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (5, 3, '¿Te sale algún código de error?', 'IA',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (6, 4, '¿Ya revisaste el papel en la impresora?', 'IA',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (7, 5, 'Se detectó un virus, actualizando antivirus.', 'IA',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (8, 6, '¿Qué aplicación va lenta?', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (9, 7, 'Reinstala la app y reinicia.', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.chat_ia VALUES (10, 8, 'Prueba otro puerto USB.', 'IA', SYSTIMESTAMP);

INSERT INTO ACTIVIDAD_12.soluciones VALUES (1, 1, 'Se cambió la fuente de poder.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (2, 2, 'Se reinició el módem.', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (3, 3, 'Actualización de drivers.', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (4, 4, 'Colocación de nuevo cartucho.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (5, 5, 'Limpieza de archivos infectados.', 'IA',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (6, 6, 'Optimización del sistema.', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (7, 7, 'Actualización del software.', 'Técnico',
SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (8, 8, 'Cambio de puerto USB.', 'IA', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (9, 9, 'Revisión del teclado.', 'Técnico', SYSTIMESTAMP);
INSERT INTO ACTIVIDAD_12.soluciones VALUES (10, 10, 'Reset de credenciales.', 'IA', SYSTIMESTAMP);

/*Actividad*/

--- NOTA: LAS VISTAS NO SE PUEDEN ACTUALIZAR Y LA VISTAS MATERIALIZADAS SI

/*
VISTAS NORMALES
• Crea una vista que muestre 

- el nombre del usuario
- la descripción del incidente
- el estado del ticket, solo para tickets que están abiertos.*/

/* Vista uno*/
CREATE OR REPLACE VIEW ACTIVIDAD_12.VISTA_TICKETS AS
SELECT 
    u.nombre AS nombre_usuario,
    i.descripcion AS descripcion_incidente,
    t.estado AS estado_ticket
FROM 
    ACTIVIDAD_12.usuarios u
JOIN 
    ACTIVIDAD_12.tickets t ON u.usuario_id = t.usuario_id
JOIN 
    ACTIVIDAD_12.incidentes i ON t.incidente_id = i.incidente_id
WHERE 
    t.estado = 'Abierto';

SELECT * FROM ACTIVIDAD_12.VISTA_TICKETS;

/*
• Crea una vista que liste el historial del chat, mostrando 

- el nombre del usuario
- el mensaje
- quién lo dijo
- la fecha.*/

CREATE OR REPLACE VIEW ACTIVIDAD_12.VISTA_HISTORIAL_CHAT AS
SELECT 
    usuario.nombre AS nombre_usuario,
    chats.mensaje AS mensaje,
    chats.quien AS quien_dijo,
    chats.fecha AS fecha 
FROM 
    ACTIVIDAD_12.usuarios usuario
JOIN 
    ACTIVIDAD_12.tickets ticket ON usuario.usuario_id = ticket.usuario_id
JOIN 
    ACTIVIDAD_12.chat_ia chats ON ticket.ticket_id = chats.ticket_id;

SELECT * FROM ACTIVIDAD_12.VISTA_HISTORIAL_CHAT;

/*• Crea una vista que muestre las soluciones aplicadas por IA, 
- con el ticket
- la descripción del incidente 
- el texto de la solución.
*/
CREATE OR REPLACE VIEW ACTIVIDAD_12.VISTA_SOLUCIONES AS
SELECT 
    ticket.ticket_id AS ticket,
    incidencia.descripcion AS descripcion,
    solucion.solucion_texto AS solucion_texto
FROM 
    ACTIVIDAD_12.tickets ticket
JOIN 
    ACTIVIDAD_12.incidentes incidencia ON incidencia.incidente_id = ticket.incidente_id
JOIN 
    ACTIVIDAD_12.soluciones solucion ON solucion.ticket_id = ticket.ticket_id;

SELECT * FROM ACTIVIDAD_12.tickets;
SELECT * FROM ACTIVIDAD_12.soluciones;
SELECT * FROM ACTIVIDAD_12.incidentes;

SELECT * FROM ACTIVIDAD_12.VISTA_SOLUCIONES;

/*
VISTAS MATERIALIZADAS
• Crea una vista materializada que guarde los tickets cerrados con el nombre del
usuario y criticidad del incidente.
*/

/*notas: 
- BUILD IMMEDIATE: crea y llena la vista de inmediato.
- REFRESH COMPLETE: actualiza todos los datos desde cero en cada refresh.
- ON DEMAND: se refresca solo cuando tú lo mandas a ejecutar.
*/

CREATE MATERIALIZED VIEW ACTIVIDAD_12.TICKTES_CERRADOS_MV
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
SELECT 
    usuarios.nombre AS nombre_usuario,
    incidencia.criticidad AS criticidad_incidente
FROM 
    ACTIVIDAD_12.usuarios usuarios
JOIN 
    ACTIVIDAD_12.tickets ticket ON usuarios.usuario_id = ticket.usuario_id
JOIN 
    ACTIVIDAD_12.incidentes incidencia ON ticket.incidente_id = incidencia.incidente_id
WHERE 
    ticket.estado = 'Cerrado';

/*POR SI SE QUIERE ACTUALIZAR*/
BEGIN
    DBMS_MVIEW.REFRESH('TICKTES_CERRADOS_MV');
END;

SELECT * FROM ACTIVIDAD_12.TICKTES_CERRADOS_MV;
SELECT * FROM ACTIVIDAD_12.tickets;
SELECT * FROM ACTIVIDAD_12.usuarios;
SELECT * FROM ACTIVIDAD_12.incidentes;

/*
• Crea una vista materializada que muestre todas las soluciones aplicadas por técnicos,
con su fecha y ticket asociado.
*/

CREATE MATERIALIZED VIEW ACTIVIDAD_12.SOLUCIONES_APLICADAS_MV
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT
    aplicada_por,
    fecha,
    ticket_id,
    solucion_texto
FROM
    ACTIVIDAD_12.soluciones
WHERE ACTIVIDAD_12.soluciones.aplicada_por = 'Técnico';

/*POR SI SE QUIERE ACTUALIZAR*/
BEGIN
    DBMS_MVIEW.REFRESH('SOLUCIONES_APLICADAS_MV');
END;


SELECT * FROM ACTIVIDAD_12.SOLUCIONES_APLICADAS_MV;

/*
• Crea una vista materializada que muestre el total de tickets abiertos y cerrados
agrupado por criticidad del incidente.
*/
CREATE MATERIALIZED VIEW ACTIVIDAD_12.TOTAL_TICKETS_MV
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT
    i.criticidad,
    t.estado,
    COUNT(*) AS total
FROM
    ACTIVIDAD_12.tickets t
JOIN
    ACTIVIDAD_12.incidentes i ON t.incidente_id = i.incidente_id
GROUP BY
    i.criticidad,
    t.estado;

/*POR SI SE QUIERE ACTUALIZAR*/
BEGIN
    DBMS_MVIEW.REFRESH('TOTAL_TICKETS_MV');
END;

SELECT * FROM ACTIVIDAD_12.TOTAL_TICKETS_MV;
SELECT * FROM ACTIVIDAD_12.incidentes;
SELECT * FROM ACTIVIDAD_12.tickets;

/*TRIGGERS
• Crea un trigger que al insertar una nueva solución, inserte automáticamente un
mensaje en chat_ia diciendo “Solución aplicada: texto_solución”.*/

CREATE OR REPLACE TRIGGER ACTIVIDAD_12.TRG_INSERT_SOLUCINES
AFTER INSERT ON ACTIVIDAD_12.soluciones
FOR EACH ROW
DECLARE
    nuevo_id NUMBER;
BEGIN
    SELECT NVL(MAX(chat_id), 0) + 1 INTO nuevo_id FROM ACTIVIDAD_12.chat_ia;
    -- Insertar el mensaje en la tabla chat_ia
    INSERT INTO ACTIVIDAD_12.chat_ia (
        chat_id,
        ticket_id,
        mensaje,
        quien,
        fecha
    ) VALUES (
        nuevo_id,
        :NEW.ticket_id,
        'Solución aplicada: ' || :NEW.solucion_texto,
        :NEW.aplicada_por,
        SYSTIMESTAMP
    );
END;

-- ejemplo de prueba 
INSERT INTO ACTIVIDAD_12.soluciones (
    solucion_id, ticket_id, solucion_texto, aplicada_por
) VALUES (
    11, 10, 'Actualizar drivers del sistema', 'Técnico'
);

SELECT * FROM ACTIVIDAD_12.chat_ia;
SELECT * FROM ACTIVIDAD_12.soluciones;
SELECT * FROM ACTIVIDAD_12.tickets;

/*
• Crea un trigger que al cambiar el estado del ticket a “Cerrado”, inserte en chat_ia un
mensaje automático diciendo “Ticket cerrado”.*/
CREATE OR REPLACE TRIGGER ACTIVIDAD_12.TRG_TICKET_CERRADO
AFTER UPDATE OF estado ON ACTIVIDAD_12.tickets
FOR EACH ROW
WHEN (NEW.estado = 'Cerrado' AND OLD.estado != 'Cerrado')
BEGIN
  DECLARE
    nuevo_chat_id NUMBER;
  BEGIN
    SELECT NVL(MAX(chat_id), 0) + 1 INTO nuevo_chat_id FROM ACTIVIDAD_12.chat_ia;

    INSERT INTO ACTIVIDAD_12.chat_ia (
      chat_id,
      ticket_id,
      mensaje,
      quien,
      fecha
    ) VALUES (
      nuevo_chat_id,
      :NEW.ticket_id,
      'Ticket cerrado',
      'Sistema',
      SYSTIMESTAMP
    );
  END;
END;

UPDATE ACTIVIDAD_12.tickets SET ACTIVIDAD_12.tickets.estado = 'Cerrado' WHERE ACTIVIDAD_12.tickets.ticket_id = 10;

SELECT * FROM ACTIVIDAD_12.tickets;
SELECT * FROM ACTIVIDAD_12.chat_ia;

/*
• Crea un trigger que prohíba (usando RAISE_APPLICATION_ERROR) insertar tickets
con estado diferente a “Abierto” o “Cerrado”.*/
CREATE OR REPLACE TRIGGER ACTIVIDAD_12.TRG_VALIDAR_ESTADO_TICKET
BEFORE INSERT OR UPDATE ON ACTIVIDAD_12.tickets
FOR EACH ROW
BEGIN
  IF :NEW.estado NOT IN ('Abierto', 'Cerrado') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Estado inválido. Solo se permite "Abierto" o "Cerrado".');
  END IF;
END;

SELECT * FROM ACTIVIDAD_12.tickets;
INSERT INTO ACTIVIDAD_12.tickets (ticket_id, usuario_id, incidente_id, fecha_apertura, estado) VALUES (11, 1, 1, SYSTIMESTAMP, 'No reconocido');

/*FUNCIONES
• Crea una función que reciba un ticket_id y devuelva el estado actual del ticket.
*/
CREATE OR REPLACE FUNCTION ACTIVIDAD_12.FUNC_ESTADO_TICKET(p_ticket_id NUMBER) RETURN VARCHAR2 IS
  v_estado VARCHAR2(20);
BEGIN
  SELECT estado INTO v_estado FROM ACTIVIDAD_12.tickets WHERE ticket_id = p_ticket_id;
  RETURN v_estado;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Ticket no encontrado';
END;

SELECT ACTIVIDAD_12.FUNC_ESTADO_TICKET(10) AS estado_ticket FROM DUAL;


/*
• Crea una función que reciba un usuario_id y devuelva el total de tickets que ha
reportado ese usuario.
*/

CREATE OR REPLACE FUNCTION ACTIVIDAD_12.FUNC_TOTAL_TICKETS_USUARIO(p_usuario_id NUMBER) RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM ACTIVIDAD_12.tickets WHERE usuario_id = p_usuario_id;
  RETURN v_total;
END;

SELECT ACTIVIDAD_12.FUNC_TOTAL_TICKETS_USUARIO(1) AS TOTAL_TICKETS_DEL_USUARIO FROM DUAL;
SELECT * FROM ACTIVIDAD_12.tickets;

/*
• Crea una función que reciba un ticket_id y regrese un texto concatenado que diga:
"Usuario: nombre - Incidente: descripción - Estado: estado"*/

CREATE OR REPLACE FUNCTION ACTIVIDAD_12.FUNC_INFO_TICKET(p_ticket_id NUMBER) RETURN VARCHAR2 IS
  v_nombre VARCHAR2(100);
  v_descripcion VARCHAR2(200);
  v_estado VARCHAR2(20);
  v_resultado VARCHAR2(500);
BEGIN
  SELECT u.nombre, i.descripcion, t.estado
  INTO v_nombre, v_descripcion, v_estado
  FROM ACTIVIDAD_12.tickets t
  JOIN ACTIVIDAD_12.usuarios u ON t.usuario_id = u.usuario_id
  JOIN ACTIVIDAD_12.incidentes i ON t.incidente_id = i.incidente_id
  WHERE t.ticket_id = p_ticket_id;

  v_resultado := 'Usuario: ' || v_nombre || ' - Incidente: ' || v_descripcion || ' - Estado: ' || v_estado;
  RETURN v_resultado;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Ticket no encontrado o datos incompletos';
END;

SELECT ACTIVIDAD_12.FUNC_INFO_TICKET(1) AS INFORMACION_CONCATENADA FROM DUAL;

/*PROCEDIMIENTOS
• Crea un procedimiento que reciba el usuario_id, incidente_id y estado, e inserte un
nuevo ticket en la tabla tickets.*/
CREATE OR REPLACE PROCEDURE ACTIVIDAD_12.PROCEDIMIENTO_INSERTAR_TICKET(
  p_usuario_id IN NUMBER,
  p_incidente_id IN NUMBER,
  p_estado IN VARCHAR2
) IS
  v_nuevo_id NUMBER;
BEGIN
  SELECT NVL(MAX(ticket_id), 0) + 1 INTO v_nuevo_id FROM ACTIVIDAD_12.tickets;

  INSERT INTO ACTIVIDAD_12.tickets(ticket_id, usuario_id, incidente_id, estado)
  VALUES (v_nuevo_id, p_usuario_id, p_incidente_id, p_estado);
END;

CALL ACTIVIDAD_12.PROCEDIMIENTO_INSERTAR_TICKET(1, 2, 'Abierto');
SELECT * FROM ACTIVIDAD_12.tickets;

/*
• Crea un procedimiento que reciba un ticket_id y cambie su estado a “Cerrado”.*/
CREATE OR REPLACE PROCEDURE ACTIVIDAD_12.PROCEDIMIENTO_CERRAR_TICKET(p_ticket_id IN NUMBER) IS
BEGIN
  UPDATE ACTIVIDAD_12.tickets
  SET estado = 'Cerrado'
  WHERE ticket_id = p_ticket_id;
END;

CALL ACTIVIDAD_12.PROCEDIMIENTO_CERRAR_TICKET(12);

/*
• Crea un procedimiento que inserte una nueva solución recibiendo: ticket_id,
solucion_texto y aplicada_por.*/
CREATE OR REPLACE PROCEDURE ACTIVIDAD_12.PROCEDIMIENTO_INSERTAR_SOLUCION(
  p_ticket_id IN NUMBER,
  p_solucion_texto IN VARCHAR2,
  p_aplicada_por IN VARCHAR2
) IS
  v_nuevo_id NUMBER;
BEGIN
  SELECT NVL(MAX(solucion_id), 0) + 1 INTO v_nuevo_id FROM ACTIVIDAD_12.soluciones;
  INSERT INTO ACTIVIDAD_12.soluciones(
    solucion_id,
    ticket_id,
    solucion_texto,
    aplicada_por
  ) VALUES (
    v_nuevo_id,
    p_ticket_id,
    p_solucion_texto,
    p_aplicada_por
  );
END;

CALL ACTIVIDAD_12.PROCEDIMIENTO_INSERTAR_SOLUCION(9, 'Actualizacion de bios.', 'Técnico');
SELECT * FROM ACTIVIDAD_12.soluciones;

/* 
 INNER JOIN
• Muestra el nombre del usuario y el estado del ticket, solo para los tickets que tienen
usuario asignado.*/
SELECT u.nombre, t.estado
FROM ACTIVIDAD_12.tickets t
JOIN ACTIVIDAD_12.usuarios u ON t.usuario_id = u.usuario_id;

/*
• Muestra el ticket_id, la criticidad del incidente y el nombre del usuario de todos los
tickets que tienen incidente y usuario registrado.*/
SELECT t.ticket_id, i.criticidad, u.nombre
FROM ACTIVIDAD_12.tickets t
JOIN ACTIVIDAD_12.incidentes i ON t.incidente_id = i.incidente_id
JOIN ACTIVIDAD_12.usuarios u ON t.usuario_id = u.usuario_id;

/*
• Muestra el mensaje del chat, quién lo dijo y la solución aplicada solo si existe una
solución para ese ticket.*/
SELECT c.mensaje, c.quien, s.solucion_texto
FROM ACTIVIDAD_12.chat_ia c
JOIN ACTIVIDAD_12.soluciones s ON c.ticket_id = s.ticket_id;


/*LEFT JOIN
• Lista todos los usuarios con su estado del ticket, aunque no tengan tickets abiertos o
cerrados.*/
SELECT u.usuario_id, u.nombre, t.estado
FROM ACTIVIDAD_12.usuarios u
LEFT JOIN ACTIVIDAD_12.tickets t ON u.usuario_id = t.usuario_id;

/* 
• Muestra la descripción del incidente junto con el estado del ticket, asegurándote que
se muestren todos los incidentes, tengan o no ticket asociado.*/
SELECT i.descripcion, t.estado
FROM ACTIVIDAD_12.incidentes i
LEFT JOIN ACTIVIDAD_12.tickets t ON i.incidente_id = t.incidente_id;

/*
• Muestra todos los tickets con la posible solución aplicada, aunque algunos tickets aún
no tengan solución.
*/
SELECT t.ticket_id, s.solucion_texto
FROM ACTIVIDAD_12.tickets t
LEFT JOIN ACTIVIDAD_12.soluciones s ON t.ticket_id = s.ticket_id;

/*
RIGHT JOIN
• Muestra todos los tickets con el nombre del usuario, incluyendo aquellos tickets que
pueden existir sin tener usuario asignado (simulado).*/

SELECT t.ticket_id, u.nombre
FROM ACTIVIDAD_12.tickets t
LEFT JOIN ACTIVIDAD_12.usuarios u ON t.usuario_id = u.usuario_id;

--Nota: Oracle no soporta RIGHT JOIN directo, se simula con LEFT JOIN invirtiendo tablas

/*
• Lista todos los chats y muestra el mensaje junto con el estado del ticket, asegurando
que aparezcan todos los chats, incluso si algún ticket estuviera eliminado.*/

SELECT c.mensaje, t.estado
FROM ACTIVIDAD_12.chat_ia c
LEFT JOIN ACTIVIDAD_12.tickets t ON c.ticket_id = t.ticket_id;

/*
• Muestra las soluciones junto con el nombre del usuario, asegurando que aparezcan
todas las soluciones, aunque el usuario no exista (caso teórico).*/

SELECT s.solucion_texto, u.nombre
FROM ACTIVIDAD_12.soluciones s
LEFT JOIN ACTIVIDAD_12.usuarios u ON s.aplicada_por = u.nombre;

-- checar este ya que si es aplicada por esta bien si no se debe de revisar

/*FULL OUTER JOIN
• Muestra todos los usuarios y tickets, aunque no existan registros relacionados entre
ellos.*/

SELECT u.usuario_id, t.ticket_id
FROM ACTIVIDAD_12.usuarios u
FULL OUTER JOIN ACTIVIDAD_12.tickets t ON u.usuario_id = t.usuario_id;

/*
• Muestra todos los incidentes y tickets, para ver qué incidentes tienen tickets y cuáles
no, o qué tickets están asociados a incidentes que podrían no existir.*/

SELECT i.incidente_id, t.ticket_id
FROM ACTIVIDAD_12.incidentes i
FULL OUTER JOIN ACTIVIDAD_12.tickets t ON i.incidente_id = t.incidente_id;

/*
• Muestra todas las soluciones y chats, aunque no tengan relación directa, para
revisar integridad.
*/

SELECT s.solucion_id, c.chat_id
FROM ACTIVIDAD_12.soluciones s
FULL OUTER JOIN ACTIVIDAD_12.chat_ia c ON s.ticket_id = c.ticket_id;

-- No le entendi a este ya que solo hice que aparecieran los ids  de la solucion y del chat
