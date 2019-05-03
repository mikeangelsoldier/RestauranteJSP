
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
	status int not null
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

/****************************************PROCEDIMIENTOS DE usuario**********/
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



DROP PROCEDURE IF EXISTS getClientes;
CREATE PROCEDURE getClientes(
)
select * from cliente where status=1;

/*
select * from cliente;
call getClientes();
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
	pass varchar(50) ,
    tipo varchar(10)
 )
 update cliente as c set c.nombre=nombre,c.apellidos=apellidos,c.correo=correo,c.usuario=usuario,c.pass=pass,c.tipo=tipo
 where c.id =clave;

call updateCliente(1,'Miguel','Ramírez Lira','migueram_5@hotmail.com','mike','mike123','1');
 
 
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
	clave varchar(50),
    nombre varchar(50),
    apellidos varchar(100),
	correo varchar(50) ,
	usuario varchar(50) ,
	pass varchar(50) ,
    tipo varchar(10)
)
	SELECT * from cliente AS c
	where CONVERT(c.id ,CHAR)  like (CONCAT('%',clave,'%'))/*Uso convert para comparar el valor char recibido con un int o double*/
    AND c.usuario  like (CONCAT('%',usuario,'%'))
    AND c.nombre like (CONCAT('%',nombre,'%'))
	AND c.apellidos like (CONCAT('%',apellidos,'%'))
	AND c.correo like (CONCAT('%',correo,'%'))
	AND c.pass like (CONCAT('%',pass,'%'))
    AND c.tipo like (CONCAT('%',tipo,'%'))
    AND status=1;

 /*
 call getFiltroCliente('','','','','','','');
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
 

 DROP PROCEDURE IF EXISTS updatePlatillo;
 CREATE PROCEDURE updatePlatillo(
	clave int,
    imagen longblob,
    nombre varchar(100),
    descripcion text,
    precio double,
    categoria varchar(50)
 )
 update platillo as p set p.imagen=imagen,p.nombre=nombre,p.descripcion=precio,p.precio=precio,p.categoria=categoria
 where p.id =clave;

 call updatePlatillo(1,'','Gringas','muy buenas',34.50,'Comida');
 
 
 
 DROP PROCEDURE IF EXISTS getPuntaje;
 CREATE PROCEDURE getPuntaje(
	clave int
 )
 select puntuacionTotal,numPuntuaciones from platillo where id =clave;
/*
 call getPuntaje(1);
*/


 DROP PROCEDURE IF EXISTS updatePuntaje;
 CREATE PROCEDURE updatePuntaje(
	clave int,
    puntuacionTotal double,
    numPuntuaciones int
 )
 update platillo as p set p.puntuacionTotal=puntuacionTotal,p.numPuntuaciones=numPuntuaciones
 where p.id =clave;

 call updatePuntaje(1,4,32);


 
 
DROP PROCEDURE IF EXISTS deletePlatillo;
CREATE PROCEDURE deletePlatillo(
	clave int
)
 update platillo as p set p.status=0
 where p.id =clave;
 
 /*
 call deletePlatillo(2);
 */
 
 
DROP PROCEDURE IF EXISTS getPlatilloPorNombre;
CREATE PROCEDURE getPlatilloPorNombre( 
    nombre varchar(100)
)
	SELECT * from platillo AS p
	where p.nombre  like (CONCAT('%',nombre,'%'))
    AND status=1;

 /*
 call getPlatilloPorNombre('enchi');
 */
 
DROP PROCEDURE IF EXISTS getPlatilloPorCategoria;
CREATE PROCEDURE getPlatilloPorCategoria( 
    categoria varchar(50)
)
	SELECT * from platillo AS p
	where p.categoria  like (CONCAT('%',categoria,'%'))
    AND status=1;

 /*
 call getPlatilloPorCategoria('Bebi');
 */





