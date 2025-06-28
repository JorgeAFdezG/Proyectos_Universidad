# Actividad 2 DOCUMENTACION DE ARCHIVOS

Creacion de tablas 

*CREAMOS LA TABLA PROVEEDORES YA QUE ESTA SOLO TENDRA PK Y PRODUCTOS TENDRA PK Y FK*

TABLA PROVEEDORES SE ELIGIO:

Se eligió el nombre PROVEEDORES porque representa la entidad encargada de almacenar la información de las empresas o personas que abastecen productos o servicios a la organización. Esta tabla facilita el control y seguimiento de los proveedores, permitiendo saber quiénes están activos y sus datos de contacto. Es clave para procesos de compras, inventario y relaciones comerciales.
   
  - ID_PROVEDOR: Se eligió NUMBER porque cada proveedor necesita un identificador único. Esta columna es la clave primaria, lo cual permite identificar cada proveedor sin ambigüedad.
   
  - NOMBRE: Se usa VARCHAR2(150) porque el nombre del proveedor es una cadena de texto de longitud variable. Se estimó que 150 caracteres son suficientes para cubrir nombres de razón social o comerciales.
   
  - TELEFONO: Se eligió NUMBER(10) porque los números telefónicos en México tienen 10 dígitos. Aunque existen otros formatos, para fines de práctica se limita a un solo número y a 10 dígitos.
   
   - ESTATUS: Se utiliza NUMBER(1) para representar un estado binario: 1 = Activo, 0 = Inactivo. Esto permite un borrado lógico, manteniendo el historial sin eliminar físicamente el proveedor.

CREATE TABLE ACTIVIDAD2.PROVEEDOR (
	ID_PROVEEDOR NUMBER PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR2(150) NOT NULL,
	TELEFONO NUMBER(10) NOT NULL,
	ESTATUS NUMBER(1) NOT NULL
);

TABLA PRODUCTOS SE ELIGIO:

Se eligió el nombre PRODUCTOS para representar a la entidad que contiene la información de los productos que la empresa ofrece, vende o administra. Esta tabla permite almacenar datos esenciales como el nombre, descripción, precio, existencia, fecha de creación y estado de cada producto. Es una entidad clave en cualquier sistema de inventario, ventas o catálogo de productos.
   
   - ID_PRODUCTO: Se eligió NUMBER porque se necesita un identificador único para cada producto. Es la clave primaria de la tabla y permite la identificación rápida de cada registro.
   
  - NOMBRE: Se eligió VARCHAR2(150) porque el nombre de un producto es una cadena de texto de longitud variable, y se estimó que 150 caracteres son suficientes para nombrar cualquier producto.
   
   - DESCRIPCION: Se usa VARCHAR2(300) para permitir una descripción más detallada del producto. Es texto de longitud variable y 300 caracteres proporcionan espacio suficiente.
   
   - FECHA_CREACION: Se eligió DATE porque se requiere registrar la fecha exacta en que se creó o dio de alta el producto en el sistema.
   
   - PRECIO: Se utiliza FLOAT para representar el precio, ya que este puede tener valores decimales. Aunque se esperen dos decimales, el tipo FLOAT permite flexibilidad en el manejo de precios.
   
   - ESTATUS: Se usa NUMBER(1) porque solo se necesita un valor binario para indicar si el producto está activo (1) o inactivo (0).
   
   - STOCK: Se eligió NUMBER ya que se requiere almacenar valores enteros positivos que representen la cantidad disponible (existencias) del producto en inventario.
  

CREATE TABLE ACTIVIDAD2.PRODUCTOS (
	ID_PRODUCTO NUMBER PRIMARY KEY,
	NOMBRE VARCHAR2(150) NOT NULL,
	DESCRIPCION VARCHAR2(300) NOT NULL,
	FECHA_CREACION DATE NOT NULL,
	PRECIO FLOAT NOT NULL,
	ESTATUS NUMBER(1) NOT NULL,
	STOCK NUMBER NOT NULL
);

DESCRIPCION DE POR QUE RELACIONAMOS LA TABLAS DE ESTA FORMA: 

Se relaciona de esta forma ya que cada producto va a tener un proveedor que lo va a surtir por esa razon se eligio que fuera relacionado desde la tabla productos hacia la tabla proveedor para tener un catalogo independiente de proveedor y sera de FK_ID_PROVEEDOR en nuestra tabla productos a ID_Proveedor de nuestra tabla PROVEEDOR
   
COMO YA SE TIENE LA TABLA CREADA SE OCUPARA EL SIGUIENTE QUERY PARA AGREGAR UNA COLUMNA

  - ALTER TABLE ACTIVIDAD2.PRODUCTOS ADD FK_ID_PROVEEDOR NUMBER;

PARA AGREGAR LA RELACION ENTRE LAS TABLAS SE NECESITA ESTE QUERY DONDE VAMOS A ALTERAR LA TABLA PRODUCTOS, AGREGANDO UN CONSTRAINT FK_PRODUCTO_PROVEEDOR PARA LA LLAVE FORANEA FK_ID_PROVEEDOR REFERENCIADA A PROVEEDOR CON EL ID_PROVEEDOR*
   
  - ALTER TABLE ACTIVIDAD2.PRODUCTOS ADD CONSTRAINT FK_PRODUCTO_PROVEEDOR FOREIGN KEY (FK_ID_PROVEEDOR) REFERENCES ACTIVIDAD2.PROVEEDOR(ID_PROVEEDOR);

SELECTS DE TODOS LOS PRODUCTOS
  - PROVEEDOR
    
    SELECT * FROM ACTIVIDAD2.PROVEEDOR;

  - PRODUCTOS
    
    SELECT * FROM ACTIVIDAD2.PRODUCTOS;

HASTA ESTE PUNTO YA NOS DEBERIAN DE SALIR TODAS NUESTRAS COLUMNAS EN CADA TABLA INCLUYENDO LA RELACION PROCEDEMOS A HACER LOS INSERTS

INSETS

  - PROVEEDOR
    
  1.- INSERT INTO ACTIVIDAD2.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (1, 'Distribuidora Central S.A.', 5551234567, 1);
  
  2.- INSERT INTO ACTIVIDAD2.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (2, 'Comercializadora del Norte', 5589876543, 1);
  
  3.- INSERT INTO ACTIVIDAD2.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (3, 'Suministros y Servicios MX', 5567891234, 1);
  
  4.- INSERT INTO ACTIVIDAD2.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (4, 'Grupo Alimentos del Sur', 5543216789, 0);
  
  5.- INSERT INTO ACTIVIDAD2.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (5, 'Papelería Empresarial Elite', 5576543210, 1);

  - PRODUCTOS

  1.- INSERT INTO ACTIVIDAD2.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, FECHA_CREACION, PRECIO, ESTATUS, STOCK) VALUES (1, 'Laptop HP 14"', 'Laptop HP con procesador AMD Ryzen 5, 8GB RAM y 512GB SSD', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 12499.99, 1, 100);

  2.- INSERT INTO ACTIVIDAD2.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, FECHA_CREACION, PRECIO, ESTATUS, STOCK) VALUES (2, 'Smartphone Samsung A54', 'Teléfono inteligente con 128GB de almacenamiento y cámara triple', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 7999.50, 1, 50);

  3.- INSERT INTO ACTIVIDAD2.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, FECHA_CREACION, PRECIO, ESTATUS, STOCK) VALUES (3, 'Monitor LG 24"', 'Monitor LED Full HD de 24 pulgadas con HDMI y VGA', TO_DATE('2023-12-20', 'YYYY-MM-DD'), 3499.00, 1, 100);

  4.- INSERT INTO ACTIVIDAD2.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, FECHA_CREACION, PRECIO, ESTATUS, STOCK) VALUES (4, 'Teclado Mecánico Redragon', 'Teclado con switches rojos, retroiluminado RGB y reposamuñecas', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 899.90, 1, 20);

  5.- INSERT INTO ACTIVIDAD2.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, FECHA_CREACION, PRECIO, ESTATUS, STOCK) VALUES (5, 'Mouse Logitech M510', 'Mouse inalámbrico ergonómico con botones programables', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 599.00, 0, 300);

COMO YA TENEMOS LA RELACION DE PRODUCTOS Y PROVEEDOR NOS FALTARIA DE ACTUALIZAR UNA COLUMNA PARA ESO PONEMOS LOS UPDATES DE LA TABLA PRODUCTOS CON RESPECTO A NUESTRA FK DE PROVEEDORES

UPDATE

PRODUCTOS UPDATE DE LLAVES FORANEAS

  1.- UPDATE ACTIVIDAD2.PRODUCTOS SET FK_ID_PROVEEDOR = 1 WHERE ID_PRODUCTO = 1;
  
  2.- UPDATE ACTIVIDAD2.PRODUCTOS SET FK_ID_PROVEEDOR = 2 WHERE ID_PRODUCTO = 2;
  
  3.- UPDATE ACTIVIDAD2.PRODUCTOS SET FK_ID_PROVEEDOR = 3 WHERE ID_PRODUCTO = 3;
  
  4.- UPDATE ACTIVIDAD2.PRODUCTOS SET FK_ID_PROVEEDOR = 4 WHERE ID_PRODUCTO = 4;
  
  5.- UPDATE ACTIVIDAD2.PRODUCTOS SET FK_ID_PROVEEDOR = 5 WHERE ID_PRODUCTO = 5;

UNA VEZ YA TENIENDO LOS DATOS YA PODREMOS HACER CONSULTAS A CONTINUACION HACEMOS UNAS CONSULTAS

SELECT CON WHERE

DESCRIPCION DE LO QUE HACE ESTE QUERY:  ESTE QUERY MUESTRA SOLO EL NOMBRE Y DESCRIPCION DEL PRODUCTO CUANDO EL ESTATUS SEA 1 OSEA ESTE EN ESTATUS ACTIVO

* SELECT NOMBRE, DESCRIPCION FROM ACTIVIDAD2.PRODUCTOS WHERE ESTATUS = 1;

DESCRIPCION DE LO QUE HACE ESTE QUERY: ESTE QUERY NOS MUESTRA EL NOMBRE, ESTATUS, STOCK Y PRECIO  DE LA TABLA PRODUCTOS CUANDO EL EL PRECIO SEA MAYOR A 3000

* SELECT NOMBRE, ESTATUS, STOCK, PRECIO FROM ACTIVIDAD2.PRODUCTOS WHERE PRECIO > 3000;

DESCRIPCION DE LO QUE HACE ESTE QUERY: ESTE QUERY NOS MUESTRA NOMBRE, DESCRIPCION, STOCK DE LA TABLA PRODUCTOS CUANDO EL STOCK SEA 100 Y EL ESTATUS ESTE EN 1 PARA ESTE QUERY LLEVA EL OPERADOR AND POR LO TANTO SOLO MOSTRARA LOS RESULTADOS QUE CUMPLAN LAS DOS CONDICIONES

* SELECT NOMBRE, DESCRIPCION, STOCK FROM ACTIVIDAD2.PRODUCTOS WHERE STOCK = 100 AND ESTATUS = 1;

DESCRIPCION DE LO QUE HACE ESTE QUERY: ESTE QUERY MUESTRA EL NOMBRE, DESCRIPCION Y STOCK DE LA TABLA PRODUCTOS CUANDO EL STOCK SEA 0 O EL ESTATUS ESTE EN 0, A DIFERENCIA DEL OPERADOR AND, EL OR NOS MOSTRARA LOS RESULTADOS QUE TENGAN STOCK = 0 O LOS RESULTADOS QUE TENGAN ESTATUS = 0 YA QUE PARA EL OR SOLO SE DEBE DE CUMPLIR UNA CONDICION PARA QUE SE AÑADA AL RESULTADO

* SELECT NOMBRE, DESCRIPCION, STOCK FROM ACTIVIDAD2.PRODUCTOS WHERE STOCK = 0 OR ESTATUS = 0;

COMENTARIOS NIVEL TABLA

PRODUCTOS

- COMMENT ON TABLE ACTIVIDAD2.PRODUCTOS IS 'Se eligió el nombre PRODUCTOS para representar a la entidad que contiene la información de los productos que la empresa ofrece, vende o administra. Esta tabla permite almacenar datos esenciales como el nombre, descripción, precio, existencia, fecha de creación y estado de cada producto. Es una entidad clave en cualquier sistema de inventario, ventas o catálogo de productos.';

PROVEEDOR

- COMMENT ON TABLE ACTIVIDAD2.PROVEEDOR IS 'Se eligió el nombre PROVEEDORES porque representa la entidad encargada de almacenar la información de las empresas o personas que abastecen productos o servicios a la organización. Esta tabla facilita el control y seguimiento de los proveedores, permitiendo saber quiénes están activos y sus datos de contacto. Es clave para procesos de compras, inventario y relaciones comerciales.';

COMENTARIOS NIVEL ATRIBUTO

PRODUCTOS

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.ID_PRODUCTO IS 'Se eligió NUMBER porque se necesita un identificador único para cada producto. Es la clave primaria de la tabla y permite la identificación rápida de cada registro.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.NOMBRE IS 'Se eligió VARCHAR2(150) porque el nombre de un producto es una cadena de texto de longitud variable, y se estimó que 150 caracteres son suficientes para nombrar cualquier producto.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.DESCRIPCION IS 'Se usa VARCHAR2(300) para permitir una descripción más detallada del producto. Es texto de longitud variable y 300 caracteres proporcionan espacio suficiente.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.FECHA_CREACION IS 'Se eligió DATE porque se requiere registrar la fecha exacta en que se creó o dio de alta el producto en el sistema.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.PRECIO IS 'Se utiliza FLOAT para representar el precio, ya que este puede tener valores decimales. Aunque se esperen dos decimales, el tipo FLOAT permite flexibilidad en el manejo de precios.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.ESTATUS IS 'Se usa NUMBER(1) porque solo se necesita un valor binario para indicar si el producto está activo (1) o inactivo (0).';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.STOCK IS 'Se eligió NUMBER ya que se requiere almacenar valores enteros positivos que representen la cantidad disponible (existencias) del producto en inventario.';

- COMMENT ON COLUMN ACTIVIDAD2.PRODUCTOS.FK_ID_PROVEEDOR IS 'Esta es nuestra llave foranea por eso FK y va relacionada con nuestro productos con relacion al proveedor que nos surte este mismo';

PROVEEDOR

- COMMENT ON COLUMN ACTIVIDAD2.PROVEEDOR.ID_PROVEEDOR IS ' Se eligió NUMBER porque cada proveedor necesita un identificador único. Esta columna es la clave primaria, lo cual permite identificar cada proveedor sin ambigüedad.';

- COMMENT ON COLUMN ACTIVIDAD2.PROVEEDOR.NOMBRE IS 'Se usa VARCHAR2(150) porque el nombre del proveedor es una cadena de texto de longitud variable. Se estimó que 150 caracteres son suficientes para cubrir nombres de razón social o comerciales.';

- COMMENT ON COLUMN ACTIVIDAD2.PROVEEDOR.TELEFONO IS 'Se eligió NUMBER(10) porque los números telefónicos en México tienen 10 dígitos. Aunque existen otros formatos, para fines de práctica se limita a un solo número y a 10 dígitos.';

- COMMENT ON COLUMN ACTIVIDAD2.PROVEEDOR.ESTATUS IS 'Se utiliza NUMBER(1) para representar un estado binario: 1 = Activo, 0 = Inactivo. Esto permite un borrado lógico, manteniendo el historial sin eliminar físicamente el proveedor.';

RESULTADOS DE LOS COMENTARIOS YA VISTOS EN UN ESQUEMA 

- TABLA PRODUCTOS
<img width="1425" alt="Captura de pantalla 2025-06-26 a la(s) 12 36 49 a m" src="https://github.com/user-attachments/assets/fd5e9455-d7ca-4de8-b392-5372ae927df6" />

- TABLA PROVEEDOR
<img width="1419" alt="Captura de pantalla 2025-06-26 a la(s) 12 37 16 a m" src="https://github.com/user-attachments/assets/c282df82-6256-4121-b316-1bebc037597f" />



CREADO POR: JORGE A. FERNANDEZ G.


