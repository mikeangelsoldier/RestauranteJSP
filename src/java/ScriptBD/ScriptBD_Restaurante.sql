
DROP SCHEMA IF EXISTS restaurante;
CREATE DATABASE restaurante;

use restaurante;

CREATE TABLE cocina(
	claveAcceso varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE categoriaPlatillo(
	id int PRIMARY KEY AUTO_INCREMENT not null,
	categoria varchar(50) not null,
	status int not null
)ENGINE=InnoDB;

/********************************************************************/


CREATE TABLE administrador(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	pass varchar(50) not null,
	status int not null
)ENGINE=InnoDB;

CREATE TABLE mesero(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
    apellidos varchar(100) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	pass varchar(50) not null,
    puntuacionTotal double null,
    numPuntuaciones int null,
	status int not null
)ENGINE=InnoDB;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
    apellidos varchar(100) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	pass varchar(50) not null,
    tipo varchar(10)/*Para ver si registado o cliente*/,
	status int not null
)ENGINE=InnoDB;

CREATE TABLE sesion_servicio(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_cliente int not null,
    fk_mesero int not null,
    numMesa int not null,
    puntajeMeseroServicio int null,
    totalVenta double null,
    tipoPago varchar(15) null,
    estadoSesion int null, /*Sesion inciada/finalizada*//*Sesiones activas*/
	status int not null/*Agregada/eliminada*//*Conocer si esta eliminada o no de la BD*/
)ENGINE=InnoDB;


CREATE TABLE orden(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_sesionservicio int not null,
	status int not null
)ENGINE=InnoDB;



CREATE TABLE det_orden(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_orden int not null,
    fk_platillo int not null,
    puntajePlatillo int null,
	status int not null
)ENGINE=InnoDB;


CREATE TABLE platillo(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    imagen longblob null,
    nombre varchar(100) not null,
    descripcion text null,
    precio double not null,
    categoria varchar(50) not null ,/*Se obtienen de tabla categoria*/
	puntuacionTotal double null,
    numPuntuaciones int null,
	status int not null
)ENGINE=InnoDB;




/*************************************************************************Llaves foraneas **********/
/***************************Llaves foraneas en sesion_servicio*/
ALTER TABLE sesion_servicio  ADD
CONSTRAINT fk_sesionservicio_mesero
FOREIGN KEY (fk_mesero)
REFERENCES mesero (id)
/*ON UPDATE CASCADE ON DELETE restrict*/;

ALTER TABLE sesion_servicio  ADD
CONSTRAINT fk_sesionservicio_cliente
FOREIGN KEY (fk_cliente)
REFERENCES cliente (id)
/*ON UPDATE CASCADE ON DELETE restrict*/;

/***************************Llaves foraneas en orden*/
ALTER TABLE orden  ADD
CONSTRAINT fk_orden_sesionservicio
FOREIGN KEY (fk_sesionservicio)
REFERENCES sesion_servicio (id)
/*ON UPDATE CASCADE ON DELETE restrict*/;

/***************************Llaves foraneas en det_orden*/
ALTER TABLE det_orden  ADD
CONSTRAINT fk_detorden_orden
FOREIGN KEY (fk_orden)
REFERENCES orden (id)
/*ON UPDATE CASCADE ON DELETE restrict*/;

ALTER TABLE det_orden  ADD
CONSTRAINT fk_detorden_platillo
FOREIGN KEY (fk_platillo)
REFERENCES platillo (id)
/*ON UPDATE CASCADE ON DELETE restrict*/;




/***********************************************************************************
									PROCEDIMIENTOS ALMACENADOS
****************************************************************************************/


/****************************************PROCEDIMIENTOS DE cliente**********/
DROP PROCEDURE IF EXISTS getLogin;
CREATE PROCEDURE getLogin(
usuario varchar(50),
password varchar(50)
)
select * from cliente where cliente.usuario=usuario and cliente.pass =password and cliente.status=1;

/*
call getLogin('mike','mike123');
call getLogin('mike','mike12');
*/

DROP PROCEDURE IF EXISTS getClienteNextId;
CREATE PROCEDURE getClienteNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "cliente";
/*
call getClienteNextId();
*/


DROP PROCEDURE IF EXISTS getClientes;
CREATE PROCEDURE getClientes(
)
select * from cliente where status=1;

/*
select * from cliente;
call getClientes();
*/

DROP PROCEDURE IF EXISTS getCliente;
CREATE PROCEDURE getCliente(
clave int
)
select * from cliente where cliente.id=clave and status=1;

/*
select * from cliente;
call getCliente(1);
*/

 DROP PROCEDURE IF EXISTS insertarCliente;
 CREATE PROCEDURE insertarCliente(
    nombre varchar(50),
    apellidos varchar(100),
	correo varchar(50) ,
	usuario varchar(50) ,
	pass varchar(50) ,
    tipo varchar(10)/*Para ver si registado o cliente*/
 )
 insert into cliente  values(null,nombre,apellidos,correo,usuario,pass,tipo,1);
 
 call insertarCliente('Miguel Ángel','Ramírez Lira','migueram_5@hotmail.com','mike','mike123','1');
 call insertarCliente('jorge','Guani','jorge@hotmail.com','jorge','123','1');
 
 

 DROP PROCEDURE IF EXISTS updateCliente;
 CREATE PROCEDURE updateCliente(
	clave int,
    nombre varchar(50),
    apellidos varchar(100),
	correo varchar(50) ,
	usuario varchar(50) ,
	pass varchar(50),
  tipo int
 )
 update cliente as c set c.nombre=nombre,c.apellidos=apellidos,c.correo=correo,c.usuario=usuario,c.pass=pass, c.tipo=tipo
 where c.id =clave;

call updateCliente(1,'Miguel','Ramírez Lira','migueram_5@hotmail.com','mike','mike123', '2');
 
 
DROP PROCEDURE IF EXISTS deleteCliente;
CREATE PROCEDURE deleteCliente(
	clave int
)
 update cliente as c set c.status=0
 where c.id =clave;
 
 /*
 call deleteCliente(1);
 */

DROP PROCEDURE IF EXISTS getFiltroCliente;
CREATE PROCEDURE getFiltroCliente( 
	filtro varchar(50)
)
SELECT * from cliente AS c
	where (CONVERT(c.id ,CHAR)  like (CONCAT('%',filtro,'%'))/*Uso convert para comparar el valor char recibido con un int o double*/
    OR c.usuario  like (CONCAT('%',filtro,'%'))
    OR c.nombre like (CONCAT('%',filtro,'%'))
	OR c.apellidos like (CONCAT('%',filtro,'%'))
	OR c.correo like (CONCAT('%',filtro,'%')))
    AND status=1;


 /*
 call getFiltroCliente('','','','','','','1');
  call getFiltroCliente('','Jortt','','','','','');
    call getFiltroCliente('2','J','Gu','','','','');
 */
 


/****************************************PROCEDIMIENTOS DE platillo**********/
DROP PROCEDURE IF EXISTS getPlatillos;
CREATE PROCEDURE getPlatillos(
)
select * from platillo where status=1;

/*
select * from platillo;
call getPlatillos();
*/


DROP PROCEDURE IF EXISTS getPlatillo;
CREATE PROCEDURE getPlatillo(
clave int
)
select * from platillo where platillo.id=clave and status=1;

/*
call getPlatillo(2);
*/


DROP PROCEDURE IF EXISTS getPlatilloNextId;
CREATE PROCEDURE getPlatilloNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "platillo";
/*
call getPlatilloNextId();
*/

 DROP PROCEDURE IF EXISTS insertarPlatillo;
 CREATE PROCEDURE insertarPlatillo(
    imagen longblob,
    nombre varchar(100),
    descripcion text,
    precio double,
    categoria varchar(50)/*Se obtienen de tabla categoria*/
 )
 insert into platillo  values(null,imagen,nombre,descripcion,precio,categoria,5,1,1);
 
 call insertarPlatillo('','Enchiladas rojas','muy buenas',35.50,'Comida');
 call insertarPlatillo('','Enchiladas verde','tambien muy buenas',36.50,'Comida');
  call insertarPlatillo('','Jugo naranja','muy fresca',10.50,'Bebida');
  call insertarPlatillo('chhdghdn475','Jugo naranja','muy fresca',10.50,'Bebida');
 
 DROP PROCEDURE IF EXISTS updatePlatillo;
 CREATE PROCEDURE updatePlatillo(
	clave int,
    imagen longblob,
    nombre varchar(100),
    descripcion text,
    precio double,
    categoria varchar(50)
 )
 update platillo as p set p.imagen=imagen,p.nombre=nombre,p.descripcion=descripcion,p.precio=precio,p.categoria=categoria
 where p.id =clave;

 call updatePlatillo(1,'','Gringas','muy buenas',34.50,'Comida');
 
 
 
  DROP PROCEDURE IF EXISTS updatePlatilloNoImage;
 CREATE PROCEDURE updatePlatilloNoImage(
	clave int,
    nombre varchar(100),
    descripcion text,
    precio double,
    categoria varchar(50)
 )
 update platillo as p set p.nombre=nombre,p.descripcion=descripcion,p.precio=precio,p.categoria=categoria
 where p.id =clave;
 
 
 
 DROP PROCEDURE IF EXISTS getPuntajePlatillo;
 CREATE PROCEDURE getPuntajePlatillo(
	clave int
 )
 select puntuacionTotal,numPuntuaciones from platillo where id =clave;
/*
 call getPuntajePlatillo(1);
*/


 DROP PROCEDURE IF EXISTS updatePuntajePlatillo;
 CREATE PROCEDURE updatePuntajePlatillo(
	clave int,
    puntuacionTotal double,
    numPuntuaciones int
 )
 update platillo as p set p.puntuacionTotal=puntuacionTotal,p.numPuntuaciones=numPuntuaciones
 where p.id =clave;

 call updatePuntajePlatillo(1,4,32);


 
 
DROP PROCEDURE IF EXISTS deletePlatillo;
CREATE PROCEDURE deletePlatillo(
	clave int
)
 update platillo as p set p.status=0
 where p.id =clave;
 
 /*
 call deletePlatillo(2);
 */
 
 
DROP PROCEDURE IF EXISTS getPlatillosPorNombre;
CREATE PROCEDURE getPlatillosPorNombre( 
    nombre varchar(100)
)
	SELECT * from platillo AS p
	where p.nombre  like (CONCAT('%',nombre,'%'))
    AND status=1;

 /*
 call getPlatilloPorNombre('enchi');
 */
 
DROP PROCEDURE IF EXISTS getPlatillosPorCategoria;
CREATE PROCEDURE getPlatillosPorCategoria( 
    categoria varchar(50)
)
	SELECT * from platillo AS p
	where p.categoria  like (CONCAT('%',categoria,'%'))
    AND status=1;

 /*
 call getPlatilloPorCategoria('Bebi');
 */
 
 

/****************************************PROCEDIMIENTOS DE categoriaPlatillo**********/



DROP PROCEDURE IF EXISTS getCategoriasPlatillos;
CREATE PROCEDURE getCategoriasPlatillos(
)
select * from categoriaPlatillo where status=1;

/*
select * from categoriaPlatillo;
call getCategoriasPlatillos();
*/


DROP PROCEDURE IF EXISTS getCategoriaPlatilloPorId;
CREATE PROCEDURE getCategoriaPlatilloPorId(
clave int
)
select * from categoriaPlatillo where categoriaPlatillo.id=clave and status=1;

/*
call getCategoriaPlatilloPorId(1);
*/


DROP PROCEDURE IF EXISTS getCategoriaPlatilloNextId;
CREATE PROCEDURE getCategoriaPlatilloNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "categoriaPlatillo";
/*
call getCategoriaPlatilloNextId();
*/

 DROP PROCEDURE IF EXISTS insertarCategoriaPlatillo;
 CREATE PROCEDURE insertarCategoriaPlatillo(
	categoria varchar(50)
 )
 insert into categoriaPlatillo  values(null,categoria,1);
 
 call insertarCategoriaPlatillo('Todos');
call insertarCategoriaPlatillo('Comidas');
call insertarCategoriaPlatillo('Bebidas');
call insertarCategoriaPlatillo('Postres');
    
 
 DROP PROCEDURE IF EXISTS updateCategoriaPlatillo;
 CREATE PROCEDURE updateCategoriaPlatillo(
	clave int,
    categoria varchar(50)
 )
 update categoriaPlatillo as cp set cp.categoria=categoria
 where cp.id =clave;

/*
 call updateCategoriaPlatillo(1,'Postre');
 */
 

DROP PROCEDURE IF EXISTS deleteCategoriaPlatillo;
CREATE PROCEDURE deleteCategoriaPlatillo(
	clave int
)
 update categoriaPlatillo as cp set cp.status=0
 where cp.id =clave;
 
 /*
 call deleteCategoriaPlatillo(2);
 */
 
    
    
    
/****************************************PROCEDIMIENTOS DE MESEROS**********/
DROP PROCEDURE IF EXISTS getMeseros;
CREATE PROCEDURE getMeseros(
)
select * from mesero where status=1;

/*
select * from mesero;
call getMeseros();
*/


DROP PROCEDURE IF EXISTS getMesero;
CREATE PROCEDURE getMesero(
clave int
)
select * from mesero where mesero.id=clave and status=1;

/*
call getMesero(2);
*/


DROP PROCEDURE IF EXISTS getMeseroNextId;
CREATE PROCEDURE getMeseroNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "mesero";
/*
call getMeseroNextId();
*/

  DROP PROCEDURE IF EXISTS insertarMesero;
 CREATE PROCEDURE insertarMesero(
    nombre varchar(50),
    apellidos varchar(100),
    correo varchar(50),
    usuario varchar(50),
    password varchar(50)
 )
 insert into mesero  values(null,nombre, apellidos, correo, usuario, password, 5, 1,1);
 
 call insertarMesero('Juana','Márquez rojas','juan85@hotmail.com', 'juan','pass987');
 call insertarMesero('Cinthia','Nava verde','navachin8@outlook.com', 'cinthia','13791379');
  call insertarMesero('Natalia','Méndez','natymendez20@gmail.com', 'naty','abc');
  call insertarMesero('Georgina','Aguada','georagua12@hotmail.com','gio','123');
 
 DROP PROCEDURE IF EXISTS updateMesero;
 CREATE PROCEDURE updateMesero(
    clave int,
	  nombre varchar(50),
    apellidos varchar(100),
    correo varchar(50),
    usuario varchar(50),
    pass varchar(50)
 )
 update mesero as p set p.nombre=nombre,p.apellidos=apellidos,p.correo=correo,p.usuario=usuario,p.pass=pass
 where p.id =clave;

 call updateMesero(1, 'Juan','Márquez rojas','juan85@hotmail.com', 'juan','pass987');

 
DROP PROCEDURE IF EXISTS deleteMesero;
CREATE PROCEDURE deleteMesero(
	clave int
)
 update mesero as p set p.status=0
 where p.id =clave;
 
 /*
 call deleteMesero(2);
 */
 
 DROP PROCEDURE IF EXISTS getFiltroMesero;
CREATE PROCEDURE getFiltroMesero( 
	filtro varchar(50)
)
SELECT * from mesero AS m
	where (CONVERT(m.id ,CHAR)  like (CONCAT('%',filtro,'%'))/*Uso convert para comparar el valor char recibido con un int o double*/
    OR m.nombre  like (CONCAT('%',filtro,'%'))
    OR m.apellidos like (CONCAT('%',filtro,'%'))
	OR m.correo like (CONCAT('%',filtro,'%'))
	OR m.usuario like (CONCAT('%',filtro,'%')))
    AND status=1;


 
 DROP PROCEDURE IF EXISTS getPuntajeMesero;
 CREATE PROCEDURE getPuntajeMesero(
	clave int
 )
 select puntuacionTotal,numPuntuaciones from mesero where id =clave;
/*
 call getPuntajeMesero(1);
*/


 DROP PROCEDURE IF EXISTS updatePuntajeMesero;
 CREATE PROCEDURE updatePuntajeMesero(
	clave int,
    puntuacionTotal double,
    numPuntuaciones int
 )
 update mesero as m set m.puntuacionTotal=puntuacionTotal,m.numPuntuaciones=numPuntuaciones
 where m.id =clave;

 call updatePuntajeMesero(1,4,32);






 /****************************************PROCEDIMIENTOS DE SESION**********/
 DROP PROCEDURE IF EXISTS getSesiones;
CREATE PROCEDURE getSesiones(
)
select * from sesion_servicio where  status=1;

/*
SELECT * FROM sesion_servicio;
call getSesiones();
*/

DROP PROCEDURE IF EXISTS getSesionPorId;
CREATE PROCEDURE getSesionPorId(
	clave int
)
select * from sesion_servicio where sesion_servicio.id=clave and status=1;

/*
SELECT * FROM sesion_servicio;
call getSesionPorId(1);
call getClientes();
call getMeseros();
*/


DROP PROCEDURE IF EXISTS getSesionNextId;
CREATE PROCEDURE getSesionNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "sesion_servicio";
/*
call getSesionNextId();
*/

 DROP PROCEDURE IF EXISTS insertarNuevaSesion;/*cuando un usuario incia sesion se crea esto*/
 CREATE PROCEDURE insertarNuevaSesion(
    fk_cliente int,
    fk_mesero int,
    numMesa int
 )
 insert into sesion_servicio (id,fk_cliente,fk_mesero,numMesa,estadoSesion,status)  values(null,fk_cliente,fk_mesero,numMesa,1,1);
 
 call insertarNuevaSesion(1,1,1);/*Cada que inicia sesion un usuario*/
 
 DROP PROCEDURE IF EXISTS updatePuntajeMeseroSesion;
 CREATE PROCEDURE updatePuntajeMeseroSesion(/*Puntaje del mesro en una sesion especifica*/
	claveSesion int,
    puntaje int
 )
 update sesion_servicio as ss set ss.puntajeMeseroServicio=puntaje
 where ss.id =claveSesion;

/*
 call updatePuntajeMeseroSesion(1,5);
 */
 
  DROP PROCEDURE IF EXISTS updateTotalVentaYTipoPagoSesion;
 CREATE PROCEDURE updateTotalVentaYTipoPagoSesion(/*Puntaje del mesro en una sesion especifica*/
 	claveSesion int,
    totalVenta double,
    tipoPago varchar(15)
 )
 update sesion_servicio as ss set ss.totalVenta=totalVenta, ss.tipoPago=tipoPago
 where ss.id =claveSesion;

 call updateTotalVentaYTipoPagoSesion(1,25.5,'EFECTIVO');
 
DROP PROCEDURE IF EXISTS deleteSesion;
CREATE PROCEDURE deleteSesion(
	clave int
)
 update sesion_servicio as ss set ss.status=0
 where ss.id =clave;
 
 /*
 call deleteSesion(1);
 */
 





/****************************************PROCEDIMIENTOS DE ORDENES**********/
 DROP PROCEDURE IF EXISTS getOrdenes;
CREATE PROCEDURE getOrdenes(
)
select * from orden where  status=1;

/*
SELECT * FROM orden;
call getOrdenes();
*/

DROP PROCEDURE IF EXISTS getOrdenNextId;
CREATE PROCEDURE getOrdenNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "orden";
/*
call getOrdenNextId();
*/

 DROP PROCEDURE IF EXISTS insertarNuevaOrden;/*cuando un usuario incia sesion se crea esto*/
 CREATE PROCEDURE insertarNuevaOrden(
    fk_sesion int
 )
 insert into orden values(null,fk_sesion,1);
 
 call insertarNuevaOrden(1);/*Agrega una nueva orden a la sesion 1*/
 
 
DROP PROCEDURE IF EXISTS deleteOrden;
CREATE PROCEDURE deleteOrden(
	clave int
)
 update orden as o set o.status=0
 where o.id =clave;
 
 /*
 call deleteOrden(1);
 */
 










