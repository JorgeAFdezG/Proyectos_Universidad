/*Create table Libros*/
CREATE TABLE LIBROS (
	ID_Libro NUMBER PRIMARY KEY,
	Titulo VARCHAR2(100) NOT NULL,
	Autor VARCHAR2(100) NOT NULL,
	Fecha_Publicacion DATE NOT NULL,
	Disponible NUMBER(1) NOT NULL
);

/*Inserts*/
INSERT INTO LIBROS (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE) VALUES (1, 'Cien años de soledad', 'Gabriel García Márquez', TO_DATE('05/06/1967', 'DD/MM/YYYY'), 1);
/**/
INSERT INTO LIBROS (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE) VALUES (2, '1984', 'George Orwell', TO_DATE('08/06/1949', 'DD/MM/YYYY'), 1);

INSERT INTO LIBROS (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE) VALUES (3, 'El principito', 'Antoine de Saint-Exupéry', TO_DATE('06/04/1943', 'DD/MM/YYYY'), 0);

INSERT INTO LIBROS (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE) VALUES (4, 'Don Quijote de la Mancha', 'Miguel de Cervantes', TO_DATE('16/01/1605', 'DD/MM/YYYY'), 1);

INSERT INTO LIBROS (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE) VALUES (5, 'Orgullo y prejuicio', 'Jane Austen', TO_DATE('28/01/1813', 'DD/MM/YYYY'), 0);

/*Seleccionar todos los registros*/
SELECT * FROM LIBROS;

/*Mostrar todos los libros disponibles*/
SELECT * FROM LIBROS WHERE DISPONIBLE = 1;

/*Mostrar todos los registros solo con la columna titulo y autor alfabeticamente*/
/* EXPLICACION: -> SELECT TITULO, AUTOR FROM LIBROS ORDER BY TITULO  ASC, AUTOR ASC; 
 * Este select solo va a traer las columnas TITULO y AUTOR ya que son los atributos que se pusieron a seleccionar de la tabla libros 
 * una vez que trae todos los datos de la tabla libros ponemos order by (Nombre del atributo) ASC y es por que el ASC es para ordenar alfabeticamente
 * En este caso como son dos atributos se ordenaran los dos*/
SELECT TITULO, AUTOR FROM LIBROS ORDER BY TITULO  ASC, AUTOR ASC; 

/*Actualizacion de un registro*/
UPDATE LIBROS SET DISPONIBLE = 0 WHERE ID_LIBRO = 1;

/*Eliminacion de un registro*/
DELETE FROM LIBROS WHERE ID_LIBRO = 2;
