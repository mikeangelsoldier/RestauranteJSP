
DROP SCHEMA IF EXISTS restaurante;
CREATE DATABASE restaurante;

use restaurante;

CREATE TABLE cocina(
	claveAcceso varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE categoriaPlatillo(
	id int PRIMARY KEY AUTO_INCREMENT not null,
	categoria varchar(50) not null
)ENGINE=InnoDB;

/********************************************************************/


CREATE TABLE administrador(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	contraseña varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE mesero(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
    apellidos varchar(100) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	contraseña varchar(50) not null,
    puntuacionTotal double null,
    numPuntuaciones int null
)ENGINE=InnoDB;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    nombre varchar(50) not null,
    apellidos varchar(100) not null,
	correo varchar(50) null,
	usuario varchar(50) not null,
	contraseña varchar(50) not null,
    tipo varchar(10)/*Para ver si registado o cliente*/
)ENGINE=InnoDB;

CREATE TABLE sesion_servicio(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_cliente int not null,
    fk_mesero int not null,
    numMesa int not null,
    puntajeMeseroServicio int null,
    totalVenta double null,
    tipoPago varchar(15) null
)ENGINE=InnoDB;


CREATE TABLE orden(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_sesionservicio int not null
)ENGINE=InnoDB;



CREATE TABLE det_orden(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    fk_orden int not null,
    fk_platillo int not null,
    puntajePlatillo int null
)ENGINE=InnoDB;


CREATE TABLE platillo(
	id INT PRIMARY KEY AUTO_INCREMENT not null,
    imagen blob null,
    nombre varchar(100) not null,
    descripcion text null,
    precio double not null,
    categoria varchar(50) not null ,/*Se obtienen de tabla categoria*/
	puntuacionTotal double null,
    numPuntuaciones int null
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


















