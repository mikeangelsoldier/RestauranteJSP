/*JSP*/
DROP SCHEMA IF EXISTS restaurante;
CREATE DATABASE restaurante;

use restaurante;

CREATE TABLE cocina(
	id int PRIMARY KEY,
	claveAcceso varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE categoriaPlatillo(
	id int PRIMARY KEY AUTO_INCREMENT not null,
	categoria varchar(50) not null,
	status int not null
)ENGINE=InnoDB;


CREATE TABLE platillosDelDia(
	idRegistro int PRIMARY KEY AUTO_INCREMENT not null,
	idPlatillo varchar(50) not null
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
	id bigint PRIMARY KEY AUTO_INCREMENT not null,
    fk_cliente int not null,
    fk_mesero int not null,
    numMesa int not null,
    puntajeMeseroServicio double null,
    totalVenta double null,
    tipoPago varchar(15) null,
    fecha date null,		/*Es la fecha donde se finalizo la sesion*/
    estadoSesion int null, /*Sesion inciada/finalizada*//*Sesiones activas*//*1=Iniciada,   0=Finalizada*/
	status int not null/*Agregada/eliminada*//*Conocer si esta eliminada o no de la BD*/
)ENGINE=InnoDB;


CREATE TABLE orden(
	id bigint PRIMARY KEY AUTO_INCREMENT not null,
    fk_sesionservicio bigint not null,
    estadoOrden varchar(15),
	status int not null
)ENGINE=InnoDB;

CREATE TABLE det_orden(
	id bigint PRIMARY KEY AUTO_INCREMENT not null,
    fk_orden bigint not null,
    fk_platillo int not null,
    cantidad int,
    puntajePlatillo double null,
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
DROP PROCEDURE IF EXISTS getClienteLogin;
CREATE PROCEDURE getClienteLogin(
usuario varchar(50),
password varchar(50)
)
select * from cliente where cliente.usuario=usuario and cliente.pass =password and cliente.status=1;

/*
call getClienteLogin('mike','mike123');
call getClienteLogin('mike','mike12');
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
 
 call insertarCliente('','','','Invitado','','2');
 call insertarCliente('Miguel Ángel','Ramírez Lira','migueram_5@hotmail.com','mike','mike123','1');
 call insertarCliente('jorge','Guani','jorge@hotmail.com','jorge','123','1');
 

 DROP PROCEDURE IF EXISTS updateCliente;
 CREATE PROCEDURE updateCliente(
	clave int,
    nombre varchar(50),
    apellidos varchar(100),
	correo varchar(50) ,
	usuario varchar(50) ,
	pass varchar(50)
 )
 update cliente as c set c.nombre=nombre,c.apellidos=apellidos,c.correo=correo,c.usuario=usuario,c.pass=pass
 where c.id =clave;

call updateCliente(2,'Miguel','Ramírez Lira','migueram_5@hotmail.com','mike','mike123');
 
 
DROP PROCEDURE IF EXISTS deleteCliente;
CREATE PROCEDURE deleteCliente(
	clave int
)
 update cliente as c set c.status=0
 where c.id =clave;
 /*
 call deleteCliente(2);
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
 call getFiltroCliente('1');
  call getFiltroCliente('Jor');
    call getFiltroCliente('Gu');
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

DROP PROCEDURE IF EXISTS getPlatillosDeUnaOrden;
CREATE PROCEDURE getPlatillosDeUnaOrden(
idOrden bigint
)
select deto.id as idDetORden,deto.cantidad as cantidadPlatillos,p.id as idPlatillo,p.imagen,p.nombre ,p.descripcion,p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones,p.status from platillo as p JOIN det_orden as deto ON p.id=deto.fk_platillo
where deto.fk_orden=idOrden and deto.status=1;
/*
select * from platillo;
call getPlatillosDeUnaOrden(1);
call getPlatillosDeUnaOrden(2);
call getPlatillosDeUnaOrden(3);
*/



DROP PROCEDURE IF EXISTS getPlatillosDeUnaSesion;
CREATE PROCEDURE getPlatillosDeUnaSesion(
idSesion bigint
)
select p.id as idPlatillo,p.imagen,p.nombre ,p.descripcion,p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones,p.status 
from sesion_servicio as ss JOIN orden as o ON ss.id=o.fk_sesionservicio
JOIN det_orden as detor ON o.id=detor.fk_orden
JOIN platillo as p ON detor.fk_platillo=p.id
where ss.id=idSesion and detor.status=1
group by p.id;
/*
select * from platillo;
call getPlatillosDeUnaSesion(1);
call getPlatillosDeUnaSesion(2);
call getPlatillosDeUnaSesion(3);
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
 /*
 call insertarPlatillo('','Enchiladas rojas','muy buenas',35.50,'Comidas');
 call insertarPlatillo('','Enchiladas verde','tambien muy buenas',36.50,'Comidas');
  call insertarPlatillo('','Jugo naranja','muy fresca',10.50,'Bebidas');
  call insertarPlatillo('chhdghdn475','Jugo naranja','muy fresca',10.50,'Bebidas');
 */
 
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
/*
 call updatePlatillo(1,'','Gringas','muy buenas',36.5,'Comidas');
 */
 
 
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
 call getPlatillosPorNombre('enchi');
 */
 
 
DROP PROCEDURE IF EXISTS getPlatillosPorCategoria;
CREATE PROCEDURE getPlatillosPorCategoria( 
    categoria varchar(50)
)
	SELECT * from platillo AS p
	where p.categoria  like (CONCAT('%',categoria,'%'))
    AND status=1;
 /*
 call getPlatillosPorCategoria('Bebi');
 */
 
 
 /*--------------------------------------------------------------------------------------------*/
 DROP PROCEDURE IF EXISTS getTopPlatillosMasConsumidosEnGeneral;
CREATE PROCEDURE getTopPlatillosMasConsumidosEnGeneral( 
)
	SELECT fk_platillo,count(fk_platillo) as cantidadVecesConsumido from det_orden AS detor
	group by fk_platillo 
     order by cantidadVecesConsumido desc limit 10;
 /*
 call getTopPlatillosMasConsumidosEnGeneral();
 */
 
 
  DROP PROCEDURE IF EXISTS getTopPlatillosMejorPuntuadosEnGeneral;
CREATE PROCEDURE getTopPlatillosMejorPuntuadosEnGeneral( 
)
	SELECT * from platillo AS p 
    order by puntuacionTotal desc
    limit 10;
 /*
 call getTopPlatillosMejorPuntuadosEnGeneral();
 */
 
DROP PROCEDURE IF EXISTS getTopPlatillosMasConsumidosPorUsuario;
CREATE PROCEDURE getTopPlatillosMasConsumidosPorUsuario( 
idCliente int
)
	SELECT fk_platillo,count(fk_platillo) as cantidadVecesConsumido from det_orden AS detor JOIN orden as o
    ON detor.fk_orden=o.id JOIN sesion_servicio as ss ON ss.id=o.fk_sesionservicio
    JOIN cliente as c ON c.id=ss.fk_cliente where c.id=idCliente
	group by fk_platillo 
     order by cantidadVecesConsumido desc limit 10;
 /*
 call getTopPlatillosMasConsumidosPorUsuario(2);
 */
 
 
 
 
 
 
 /****************************************PROCEDIMIENTOS DE platillosDelDia**********/
 DROP PROCEDURE IF EXISTS getPlatillosDelDia;
CREATE PROCEDURE getPlatillosDelDia(
)
select * from platillosDelDia;
/*
select * from platillosDelDia;
call getPlatillosDelDia();
*/
 
 
 DROP PROCEDURE IF EXISTS insertarPlatilloDelDia;
 CREATE PROCEDURE insertarPlatilloDelDia(
    idPlatillo int
 )
 insert into platillosDelDia values(null,idPlatillo);
 /*
 call insertarPlatilloDelDia(1);
 call insertarPlatilloDelDia(5);
 call insertarPlatilloDelDia(4);
 call insertarPlatilloDelDia(2);
 */
 
 DROP PROCEDURE IF EXISTS deletePlatillosDelDia;
CREATE PROCEDURE deletePlatillosDelDia(
	idRegistroEnTabla int
)
 delete from platillosDelDia 
 where idRegistro =idRegistroEnTabla;
 /*
 call deletePlatillosDelDia(1);
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
DROP PROCEDURE IF EXISTS getMeseroLogin;
CREATE PROCEDURE getMeseroLogin(
usuario varchar(50),
password varchar(50)
)
select * from mesero where mesero.usuario=usuario and mesero.pass =password and mesero.status=1;
/*
call getMeseroLogin('naty','abc');
call getMeseroLogin('naty','4545');
*/

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
call getMesero(1);
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
 
 call insertarMesero('José','Cervera Barbosa','jose85@hotmail.com', '1','1');
call insertarMesero('Miguel','Ramírez Lira','mike85@hotmail.com', '2','2');
call insertarMesero('Alfredo Dios','Valdivia Barajas','frodo85@hotmail.com', '3','3');
call insertarMesero('Alfredo Dios Especial','Valdivia Barajas','frodo85@hotmail.com', '4','4');
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
/*
call getFiltroMesero('Cint');
*/


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
 
 
 DROP PROCEDURE IF EXISTS getMeserosYCantidadMesasAsignadas;/*En mesas activas*/
 CREATE PROCEDURE getMeserosYCantidadMesasAsignadas(
 )
 select m.id as idMesero, count(ss.numMesa) as cantidadMesas from mesero as m JOIN sesion_servicio as ss ON m.id=ss.fk_mesero
 where ss.estadoSesion=1/*LAs que estan activas*/
 group by m.id;
/*
 call getMeserosYCantidadMesasAsignadas();
*/

 DROP PROCEDURE IF EXISTS getMeserosYCantidadMesasAsignadas2;/*En mesas activas*/
 CREATE PROCEDURE getMeserosYCantidadMesasAsignadas2(
 )
 select m.id as idMesero, count(ss.numMesa) as cantidadMesas from mesero as m left JOIN sesion_servicio as ss ON m.id=ss.fk_mesero
 and ss.estadoSesion=1/*LAs que estan activas*/
 group by m.id;
/*
 call getMeserosYCantidadMesasAsignadas2();
*/

 DROP PROCEDURE IF EXISTS getMesasMesero;/*En mesas activas*/
 CREATE PROCEDURE getMesasMesero(
 claveMesero int
 )
 select numMesa from sesion_servicio
 where fk_mesero=claveMesero and estadoSesion=1;
/*
 call getMesasMesero(1);
 call getMesasMesero(2);
*/

/****************************************PROCEDIMIENTOS DE ADMINISTRADOR**********/
DROP PROCEDURE IF EXISTS getAdministradorLogin;
CREATE PROCEDURE getAdministradorLogin(
usuario varchar(50),
password varchar(50)
)
select * from administrador where administrador.usuario=usuario and administrador.pass =password and administrador.status=1;

call getAdministradorLogin('1', '1');


DROP PROCEDURE IF EXISTS getAdministradores;
CREATE PROCEDURE getAdministradores(
)
select * from administrador where status=1;
/*
select * from administrador;
call getAdministradores();
*/


DROP PROCEDURE IF EXISTS getAdministrador;
CREATE PROCEDURE getAdministrador(
clave int
)
select * from administrador where administrador.id=clave and status=1;
/*
call getAdministrador(2);
*/


DROP PROCEDURE IF EXISTS getAdministradorNextId;
CREATE PROCEDURE getAdministradorNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "administrador";
/*
call getAdministradorNextId();
*/

  DROP PROCEDURE IF EXISTS insertarAdministrador;
 CREATE PROCEDURE insertarAdministrador(
    nombre varchar(50),
    correo varchar(50),
    usuario varchar(50),
    password varchar(50)
 )
 insert into administrador values(null,nombre, correo, usuario, password,1);
 
 call insertarAdministrador('Juana','juan85@hotmail.com', 'juan','pass987');
 call insertarAdministrador('Cinthia','navachin8@outlook.com', 'cinthia','13791379');
 call insertarAdministrador('Natalia','natymendez20@gmail.com', 'naty','abc');
 call insertarAdministrador('Georgina','georagua12@hotmail.com','gio','123');
 
 DROP PROCEDURE IF EXISTS updateAdministrador;
 CREATE PROCEDURE updateAdministrador(
    clave int,
	  nombre varchar(50),
    correo varchar(50),
    usuario varchar(50),
    pass varchar(50)
 )
 update administrador as p set p.nombre=nombre,p.correo=correo,p.usuario=usuario,p.pass=pass
 where p.id =clave;

 call updateAdministrador(1, 'Juan','juan85@hotmail.com', 'juan','pass987');

 
DROP PROCEDURE IF EXISTS deleteAdministrador;
CREATE PROCEDURE deleteAdministrador(
	clave int
)
 update administrador as p set p.status=0
 where p.id =clave;
 /*
 call deleteAdministrador(2);
 */
 
 DROP PROCEDURE IF EXISTS getFiltroAdministrador;
CREATE PROCEDURE getFiltroAdministrador( 
	filtro varchar(50)
)
SELECT * from administrador AS m
	where (CONVERT(m.id ,CHAR)  like (CONCAT('%',filtro,'%'))/*Uso convert para comparar el valor char recibido con un int o double*/
    OR m.nombre  like (CONCAT('%',filtro,'%'))
	OR m.correo like (CONCAT('%',filtro,'%'))
	OR m.usuario like (CONCAT('%',filtro,'%')))
    AND status=1;

call getFiltroAdministrador('a');
  

 /****************************************PROCEDIMIENTOS DE SESION**********/
 DROP PROCEDURE IF EXISTS getSesiones;
CREATE PROCEDURE getSesiones(
)
select * from sesion_servicio where  status=1;
/*
SELECT * FROM sesion_servicio;
call getSesiones();
*/


 DROP PROCEDURE IF EXISTS getUltimoIdDeSesion;
CREATE PROCEDURE getUltimoIdDeSesion(
)
select max(id) from sesion_servicio where  status=1;
/*
SELECT * FROM sesion_servicio;
call getUltimoIdDeSesion();
*/

 DROP PROCEDURE IF EXISTS getUltimoIdDeSesionDeUnCliente;
CREATE PROCEDURE getUltimoIdDeSesionDeUnCliente(
	idUsuario int
)
select max(id) from sesion_servicio where sesion_servicio.fk_cliente=idUsuario and status=1;
/*
SELECT * FROM sesion_servicio;
call getUltimoIdDeSesionDeUnCliente(2);
*/


 DROP PROCEDURE IF EXISTS getIdSesionDeUnaMesa;
CREATE PROCEDURE getIdSesionDeUnaMesa(
numMesa int
)
select * from sesion_servicio where estadoSesion=1 and sesion_servicio.numMesa=numMesa  and status=1;
/*
SELECT * FROM sesion_servicio;
call getIdSesionDeUnaMesa(1);
*/



 DROP PROCEDURE IF EXISTS getMesasOcupadasEnSesionesActivas;
CREATE PROCEDURE getMesasOcupadasEnSesionesActivas(
)
select id,numMesa from sesion_servicio where estadoSesion=1 and status=1;
/*
call getMesasOcupadasEnSesionesActivas();
*/

DROP PROCEDURE IF EXISTS getSesionPorId;
CREATE PROCEDURE getSesionPorId(
	clave bigint
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

 DROP PROCEDURE IF EXISTS insertarNuevaSesion;/*cuando un usuario inicia sesion se crea esto*/
 CREATE PROCEDURE insertarNuevaSesion(
    fk_cliente int,
    fk_mesero int,
    numMesa int
 )
 insert into sesion_servicio (id,fk_cliente,fk_mesero,numMesa,estadoSesion,status)  values(null,fk_cliente,fk_mesero,numMesa,1,1);
 /*
 call insertarNuevaSesion(1,1,1);
 call insertarNuevaSesion(2,1,2);
 */
 
 DROP PROCEDURE IF EXISTS updatePuntajeMeseroSesion;
 CREATE PROCEDURE updatePuntajeMeseroSesion(/*Puntaje del mesero en una sesion especifica*/
	claveSesion bigint,
    puntaje double
 )
 update sesion_servicio as ss set ss.puntajeMeseroServicio=puntaje
 where ss.id =claveSesion;
/*
 call updatePuntajeMeseroSesion(1,5);
 */
 
 
  DROP PROCEDURE IF EXISTS updateTotalVentaYTipoPagoSesion;
 CREATE PROCEDURE updateTotalVentaYTipoPagoSesion(/*Puntaje del mesro en una sesion especifica*/
 	claveSesion bigint,
    totalVenta double,
    tipoPago varchar(15)
 )
 update sesion_servicio as ss set ss.totalVenta=totalVenta, ss.tipoPago=tipoPago
 where ss.id =claveSesion;
/*
 call updateTotalVentaYTipoPagoSesion(1,0.0,'EFECTIVO');
 */
 
   DROP PROCEDURE IF EXISTS colocarFechaActualPagoSesionServicio;
 CREATE PROCEDURE colocarFechaActualPagoSesionServicio(/*Puntaje del mesro en una sesion especifica*/
 	claveSesion bigint
 )
 update sesion_servicio as ss set ss.fecha=curdate()
 where ss.id =claveSesion;
/*
 call colocarFechaActualPagoSesionServicio(1);
 */
 
 
   DROP PROCEDURE IF EXISTS colocarSesionComoInactiva;
 CREATE PROCEDURE colocarSesionComoInactiva(/*Puntaje del mesro en una sesion especifica*/
 	claveSesion bigint
 )
 update sesion_servicio as ss set ss.totalVenta=totalVenta, ss.estadoSesion=0
 where ss.id =claveSesion;

/*
 call colocarSesionComoInactiva(7);
 */
  
DROP PROCEDURE IF EXISTS deleteSesion;
CREATE PROCEDURE deleteSesion(
	clave bigint
)
 update sesion_servicio as ss set ss.status=0
 where ss.id =clave;
 /*
 call deleteSesion(1);
 */
 
 
 DROP PROCEDURE IF EXISTS calcularTotalPorOrdenEnVentaDeUnaSesion;
 CREATE PROCEDURE calcularTotalPorOrdenEnVentaDeUnaSesion(/*Puntaje del mesro en una sesion especifica*/
 	idSesion bigint
 )
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.numMesa ,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, o.id as idOrden,o.estadoOrden ,
    sum(p.precio) as totalPorOrden 
    from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
	JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where ss.status=1 and o.status=1 and dt.status=1 and p.status=1 and ss.id=idSesion
group by o.id;

/*
 call calcularTotalPorOrdenEnVentaDeUnaSesion(1);
 call calcularTotalPorOrdenEnVentaDeUnaSesion(2);
*/

 DROP PROCEDURE IF EXISTS calcularTotalGeneralEnVentaDeUnaSesion;
 CREATE PROCEDURE calcularTotalGeneralEnVentaDeUnaSesion(/*Puntaje del mesro en una sesion especifica*/
 	idSesion bigint
 )
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.numMesa ,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, 
    sum(p.precio) as totalPorSesion
    from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
	JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where ss.status=1 and o.status=1 and dt.status=1 and p.status=1 and ss.id=idSesion
group by ss.id;

/*
 call calcularTotalGeneralEnVentaDeUnaSesion(1);
 call calcularTotalGeneralEnVentaDeUnaSesion(2);
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


DROP PROCEDURE IF EXISTS getOrdenPorId;
CREATE PROCEDURE getOrdenPorId(
	clave bigint
)
select * from orden where orden.id=clave and orden.status=1;
/*
SELECT * FROM orden;
call getOrdenPorId(1);
call getOrdenPorId(2);
call getOrdenPorId(3);
*/

DROP PROCEDURE IF EXISTS getOrdenesPorIdSesion;
CREATE PROCEDURE getOrdenesPorIdSesion(
	claveSesion bigint
)
select * from orden where orden.fk_sesionservicio=claveSesion and orden.status=1;
/*
SELECT * FROM orden;
call getOrdenesPorIdSesion(1);
call getOrdenesPorIdSesion(2);
call getOrdenesPorIdSesion(3);
*/


DROP PROCEDURE IF EXISTS getIdUltimaOrdenPorIdSesion;
CREATE PROCEDURE getIdUltimaOrdenPorIdSesion(
	claveSesion bigint
)
select max(orden.id) from orden where orden.fk_sesionservicio=claveSesion and orden.status=1;
/*
SELECT * FROM orden;
call getIdUltimaOrdenPorIdSesion(1);
*/


DROP PROCEDURE IF EXISTS getOrdenesSolicitadasEnCocina;
CREATE PROCEDURE getOrdenesSolicitadasEnCocina(
)
select * from orden where (orden.estadoOrden='SOLICITADA' or orden.estadoOrden='PREPARANDO' ) 
and orden.status=1 order by orden.id desc;
/*
SELECT * FROM orden;
call getOrdenesSolicitadasEnCocina();
*/

DROP PROCEDURE IF EXISTS getTopOrdenesSolicitadasEnCocina;
CREATE PROCEDURE getTopOrdenesSolicitadasEnCocina(
)
select * from orden where (orden.estadoOrden='SOLICITADA' or orden.estadoOrden='PREPARANDO' ) 
and orden.status=1 and orden.estadoOrden=1 order by orden.id asc limit 10;
/*
SELECT * FROM orden;
call getTopOrdenesSolicitadasEnCocina();
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

 DROP PROCEDURE IF EXISTS insertarNuevaOrden;
 CREATE PROCEDURE insertarNuevaOrden(
    fk_sesion bigint
 )
 insert into orden values(null,fk_sesion,'REGISTRADA',1);/*SOLICITADA, PREPARADA, ENTREGADA*/
 
 /*
 call insertarNuevaOrden(1);*//*Agrega una nueva orden a la sesion N */
 /*call insertarNuevaOrden(1);*//*Agrega una nueva orden a la sesion N */
 /*call insertarNuevaOrden(2);*//*Agrega una nueva orden a la sesion N */
 
 
  DROP PROCEDURE IF EXISTS indicarSolicitarOrden;/*Cuando el cliente le da en pedir orden*/
 CREATE PROCEDURE indicarSolicitarOrden(
	claveOrden bigint
 )
 update orden as ord set ord.estadoOrden='SOLICITADA'
 where ord.id =claveOrden;
/*
 call indicarSolicitarOrden(1);
  call indicarSolicitarOrden(2);
 */
 
 DROP PROCEDURE IF EXISTS indicarOrdenEnPreparacion;
 CREATE PROCEDURE indicarOrdenEnPreparacion(
	claveOrden bigint
 )
 update orden as ord set ord.estadoOrden='PREPARANDO'
 where ord.id =claveOrden;
 /*
 call indicarOrdenEnPreparacion(2);
 */
 
  DROP PROCEDURE IF EXISTS indicarOrdenPreparada;
 CREATE PROCEDURE indicarOrdenPreparada(
	claveOrden bigint
 )
 update orden as ord set ord.estadoOrden='PREPARADA'
 where ord.id =claveOrden;
 /*
 call indicarOrdenPreparada(2);
 */
 
 
   DROP PROCEDURE IF EXISTS indicarOrdenEntregada;
 CREATE PROCEDURE indicarOrdenEntregada(
	claveOrden bigint
 )
 update orden as ord set ord.estadoOrden='ENTREGADA'
 where ord.id =claveOrden;
/*
 call indicarOrdenEntregada(3);
 */
 
 
DROP PROCEDURE IF EXISTS deleteOrden;
CREATE PROCEDURE deleteOrden(
	clave bigint
)
 update orden as o set o.status=0
 where o.id =clave;
 /*
 call deleteOrden(1);
 */
 
 
/****************************************PROCEDIMIENTOS DE det_orden**********/
 DROP PROCEDURE IF EXISTS getDetallesOrdenes;
CREATE PROCEDURE getDetallesOrdenes(
)
select * from det_orden where status=1;

/*
SELECT * FROM det_orden;
call getDetallesOrdenes();
*/

 DROP PROCEDURE IF EXISTS getDetallesDeUnaOrden;
CREATE PROCEDURE getDetallesDeUnaOrden(
	claveOrden bigint
)
select * from det_orden where det_orden.fk_orden=claveOrden and det_orden.status=1;
/*
call getDetallesDeUnaOrden(1);
*/


 DROP PROCEDURE IF EXISTS getDetallesDeUnaSesion;
CREATE PROCEDURE getDetallesDeUnaSesion(
	idSesion bigint
)
select detor.id,detor.fk_orden,detor.fk_platillo,detor.cantidad,detor.puntajePlatillo,detor.status 
from sesion_servicio as ss jOIN orden as o ON ss.id=o.fk_sesionservicio
JOIN det_orden as detor on o.id=detor.fk_orden where ss.id=idSesion and  detor.status=1;
/*
call getDetallesDeUnaSesion(1);
*/



DROP PROCEDURE IF EXISTS getDetOrdenNextId;
CREATE PROCEDURE getDetOrdenNextId()
  SELECT AUTO_INCREMENT
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = "restaurante"
  AND TABLE_NAME = "det_orden";
/*
call getDetOrdenNextId();
*/

 DROP PROCEDURE IF EXISTS insertarNuevoDetOrden;
 CREATE PROCEDURE insertarNuevoDetOrden(
    fk_orden bigint,
    fk_platillo int,
    cantidad int
 )
 insert into det_orden (id,fk_orden,fk_platillo,cantidad,status) values(null,fk_orden,fk_platillo,cantidad,1);
 
 /*
 call insertarNuevoDetOrden(1,2,8);
  call insertarNuevoDetOrden(1,1,2);
   call insertarNuevoDetOrden(2,2,3);
  call insertarNuevoDetOrden(2,4,1);
  call insertarNuevoDetOrden(3,3,1);
  call insertarNuevoDetOrden(3,4,2);
  */

 DROP PROCEDURE IF EXISTS updatePuntajePlatilloEnDetOrden;
 CREATE PROCEDURE updatePuntajePlatilloEnDetOrden(/*Puntaje del mesero en una sesion especifica*/
	claveDetOrden bigint,
    puntaje double
 )
 update det_orden as dt set dt.puntajePlatillo=puntaje
 where dt.id =claveDetOrden;
/*
 call updatePuntajePlatilloEnDetOrden(1,4);
 call updatePuntajePlatilloEnDetOrden(2,5);
*/

DROP PROCEDURE IF EXISTS updateCantidadPlatillosEnDetOrden;
 CREATE PROCEDURE updateCantidadPlatillosEnDetOrden(/*Puntaje del mesero en una sesion especifica*/
	claveDetOrden bigint,
    cantidadPlatillos int
 )
 update det_orden as dt set dt.cantidad=cantidadPlatillos
 where dt.id =claveDetOrden;
/*
 call updateCantidadPlatillosEnDetOrden(1,4);
 call updateCantidadPlatillosEnDetOrden(2,11);
*/

 
DROP PROCEDURE IF EXISTS deleteDetOrden;
CREATE PROCEDURE deleteDetOrden(
	clave bigint
)
 update det_orden as deto set deto.status=0
 where deto.id =clave;
 /*
 call deleteDetOrden(1);
 */


/****************************************PROCEDIMIENTOS DE JOIN sesion, orden, y platillos**********/
/*
select * from sesion_servicio;
select * from orden;
select * from det_orden;
select * from platillo; 
*/

DROP PROCEDURE IF EXISTS getTodasSesionesYSusOrdenes;/*Regresa cada sesion con el id de todas sus ordenes*/
CREATE PROCEDURE getTodasSesionesYSusOrdenes(
)
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, o.id as idOrden	from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
where ss.status=1 and o.status=1;
/*select * from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
where ss.status=1 and o.status=1;*/

/*
call getTodasSesionesYSusOrdenes();
*/

DROP PROCEDURE IF EXISTS getSesionYSusOrdenes;/*Regresa datos de la sesion especificada, incluyendo el id de todas sus ordenes*/
CREATE PROCEDURE getSesionYSusOrdenes(
clave_sesion bigint
)
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, o.id as idOrden	from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
where ss.status=1 and o.status=1 and ss.id=clave_sesion;
/*
call getSesionYSusOrdenes(1);
call getSesionYSusOrdenes(2);
*/


DROP PROCEDURE IF EXISTS getTodasSesionesYSusOrdenesYPlatillos;/*Regresa cada sesion con el id de todas sus ordenes y platillos de cada orden*/
CREATE PROCEDURE getTodasSesionesYSusOrdenesYPlatillos(
)
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, o.id as idOrden, dt.id as idDetOrden,
    dt.puntajePlatillo,p.id as idPlatillo,p.imagen,p.nombre,p.descripcion,
    p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones
    from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
	JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where ss.status=1 and o.status=1 and dt.status=1 and p.status=1;
/*select * from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
	JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where ss.status=1 and o.status=1 and dt.status=1 and p.status=1;*/

/*
call getTodasSesionesYSusOrdenesYPlatillos();
*/

DROP PROCEDURE IF EXISTS getSesionYSusOrdenesYPlatillos;/*Regresa datos de la sesion especificada, incluyendo el id de todas sus ordenes y platillos de cada orden*/
CREATE PROCEDURE getSesionYSusOrdenesYPlatillos(
clave_sesion bigint
)
select ss.id as idSesion,ss.fk_cliente,ss.fk_mesero,ss.puntajeMeseroServicio,
	ss.totalVenta,ss.tipoPago,ss.estadoSesion, o.id as idOrden, dt.id as idDetOrden,
    dt.puntajePlatillo,p.id as idPlatillo,p.imagen,p.nombre,p.descripcion,
    p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones
    from sesion_servicio as ss JOIN orden as o on ss.id=o.fk_sesionservicio 
	JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where ss.status=1 and o.status=1 and dt.status=1 and p.status=1 and ss.id=clave_sesion;
/*
call getSesionYSusOrdenesYPlatillos(1);
call getSesionYSusOrdenesYPlatillos(2);
*/

DROP PROCEDURE IF EXISTS getTodasOrdenesEnGeneralYPlatillos;/*Regresa ordenes en general y platillos de cada orden*/
CREATE PROCEDURE getTodasOrdenesEnGeneralYPlatillos(
)
select o.id as idOrden,o.fk_sesionservicio, dt.id as idDetOrden,
    dt.puntajePlatillo,p.id as idPlatillo,p.imagen,p.nombre,p.descripcion,
    p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones
    from orden as o JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where o.status=1 and dt.status=1 and p.status=1;
/*select * from orden as o JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where o.status=1 and dt.status=1 and p.status=1;*/

/*
call getTodasOrdenesEnGeneralYPlatillos();
*/

DROP PROCEDURE IF EXISTS getOrdenEspecificaYPlatillos;/*Regresa datos de la orden especificada, y platillos de la orden*/
CREATE PROCEDURE getOrdenEspecificaYPlatillos(
clave_sesion bigint
)
select o.id as idOrden,o.fk_sesionservicio, dt.id as idDetOrden,
    dt.puntajePlatillo,p.id as idPlatillo,p.imagen,p.nombre,p.descripcion,
    p.precio,p.categoria,p.puntuacionTotal,p.numPuntuaciones
    from orden as o JOIN det_orden as dt ON o.id=dt.fk_orden 
    JOIN platillo as p ON dt.fk_platillo=p.id
where o.status=1 and dt.status=1 and p.status=1 and o.id=clave_sesion;
/*
call getOrdenEspecificaYPlatillos(1);
call getOrdenEspecificaYPlatillos(2);
call getOrdenEspecificaYPlatillos(3);
*/


/****************************************PROCEDIMIENTOS DE Cocina**********/
 DROP PROCEDURE IF EXISTS getClaveAcceso;
CREATE PROCEDURE getClaveAcceso(
)
select * from cocina;
/*
call getClaveAcceso();
*/

 DROP PROCEDURE IF EXISTS crearClaveAcceso;
 CREATE PROCEDURE crearClaveAcceso(
    claveAcceso varchar(50)
 )
 insert into cocina values(1,claveAcceso);
 
 call crearClaveAcceso('12458');
 
  DROP PROCEDURE IF EXISTS updateClaveAcceso;
 CREATE PROCEDURE updateClaveAcceso(
    claveAccess varchar(50)
 )
update cocina as c set c.claveAcceso=claveAccess
 where c.id =1;
 /*
 call updateClaveAcceso('458685');
 */
 
DROP PROCEDURE IF EXISTS deleteClaveAcceso;
CREATE PROCEDURE deleteClaveAcceso(
)
 Delete from cocina where id=1;
 /*
 call deleteClaveAcceso();
 */

