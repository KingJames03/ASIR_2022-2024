DROP DATABASE IF EXISTS pubs;
CREATE DATABASE pubs;
USE pubs;

CREATE TABLE pub (
    cod_pub         VARCHAR(5)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    licencia_fiscal VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)         ,
    fecha_apertura  DATE         NOT NULL,
    horario         VARCHAR(60)  NOT NULL,
    cod_localidad   INTEGER      NOT NULL ) ;
CREATE TABLE titular (
    dni_titular     VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)         ,
    cod_pub         VARCHAR(5)   NOT NULL ) ;
CREATE TABLE empleado (
    dni_empleado    VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)          ) ;
CREATE TABLE existencias (
    cod_articulo    VARCHAR(10)  NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    cantidad        INTEGER      NOT NULL,
    precio          DECIMAL      NOT NULL,
    cod_pub         VARCHAR(5)   NOT NULL ) ;
CREATE TABLE localidad (
    cod_localidad   INTEGER      NOT NULL,
    nombre          VARCHAR(60)  NOT NULL ) ;
CREATE TABLE pub_empleado (
    cod_pub         VARCHAR(5)   NOT NULL,
    dni_empleado    VARCHAR(8)   NOT NULL,
    funcion         VARCHAR(9)   NOT NULL ) ;

ALTER TABLE pub ADD CONSTRAINT pk_pub
 PRIMARY KEY (cod_pub) ;

ALTER TABLE localidad ADD CONSTRAINT pk_localidad
 PRIMARY KEY (cod_localidad) ;

ALTER TABLE titular ADD CONSTRAINT pk_titular
 PRIMARY KEY (dni_titular) ;

ALTER TABLE empleado ADD CONSTRAINT pk_empleado
 PRIMARY KEY (dni_empleado) ;

ALTER TABLE existencias ADD CONSTRAINT pk_existencias
 PRIMARY KEY (cod_articulo) ;

ALTER TABLE pub_empleado ADD CONSTRAINT pk_pub_empleado
 PRIMARY KEY (cod_pub, dni_empleado, funcion) ;

ALTER TABLE pub ADD CONSTRAINT fk_pub_localidad
 FOREIGN KEY (cod_localidad)
 REFERENCES localidad (cod_localidad) ;

ALTER TABLE titular ADD CONSTRAINT fk_titular_pu
 FOREIGN KEY (cod_pub)
 REFERENCES pub (cod_pub) ;

ALTER TABLE existencias ADD CONSTRAINT fk_existencias_pub
 FOREIGN KEY (cod_pub)
 REFERENCES pub (cod_pub) ;

ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_pub
 FOREIGN KEY (cod_pub)
 REFERENCES pub(cod_pub) ;

ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_empleado
 FOREIGN KEY (dni_empleado)
 REFERENCES empleado (dni_empleado) ;

ALTER TABLE pub ADD CONSTRAINT ck_horario
 CHECK (horario IN ("HOR1", "HOR2", "HOR3")) ;

ALTER TABLE existencias ADD CONSTRAINT ck_precio
 CHECK (precio <> 0) ;

ALTER TABLE pub_empleado ADD CONSTRAINT ck_funcion
 CHECK (funcion IN ("CAMARERO", "SEGURIDAD", "LIMPIEZA")) ;

