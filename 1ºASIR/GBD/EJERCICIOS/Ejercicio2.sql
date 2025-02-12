DROP DATABASE IF EXISTS taquilla;
CREATE DATABASE taquilla;
USE taquilla;

CREATE TABLE espectaculos (
    cod_espectaculo VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(80)  NOT NULL,
    tipo            VARCHAR(80)  NOT NULL,
    fecha_inicial   DATE                 ,
    fecha_final     DATE                 ,
    interprete      VARCHAR(80)  NOT NULL,
    cod_recinto     VARCHAR(8)           ) ;
CREATE TABLE precios_espectaculos (
    cod_espectaculo VARCHAR(8)   NOT NULL,
    cod_recinto     VARCHAR(8)   NOT NULL,
    zona            VARCHAR(80)  NOT NULL,
    precio          DECIMAL      NOT NULL ) ;
CREATE TABLE recintos (
    cod_recinto     VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(80)  NOT NULL,
    direccion       VARCHAR(80)  NOT NULL,
    ciudad          VARCHAR(80)  NOT NULL,
    telefono        VARCHAR(80)          ,
    horario         VARCHAR(80)  NOT NULL ) ;
CREATE TABLE zonas_recintos (
    cod_recinto     VARCHAR(8)   NOT NULL,
    zona            VARCHAR(80)  NOT NULL,
    capacidad       INTEGER      NOT NULL ) ;
CREATE TABLE asientos (
    cod_recinto     VARCHAR(8)   NOT NULL,
    zona            VARCHAR(80)  NOT NULL,
    fila            INTEGER      NOT NULL,
    numero          INTEGER      NOT NULL ) ;
CREATE TABLE representaciones (
    cod_espectaculo VARCHAR(8)   NOT NULL,
    fecha           DATE         NOT NULL,
    hora            VARCHAR(8)   NOT NULL ) ;

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE entradas (
    cod_espectaculo VARCHAR(8)   NOT NULL,
    fecha           DATE         NOT NULL,
    hora            VARCHAR(8)   NOT NULL,
    cod_recinto     VARCHAR(8)   NOT NULL,
    fila            INTEGER               ,
    numero          INTEGER              ,
    zona            VARCHAR(80)          ,
    dni_cliente     VARCHAR(9)            ) ;
CREATE TABLE espectadores (
    dni_cliente     VARCHAR(9)   NOT NULL,
    nombre          VARCHAR(80)  NOT NULL,
    direccion       VARCHAR(80)          ,
    telefono        VARCHAR(80)          ,
    ciudad          VARCHAR(80)          ,
    ntarjeta        VARCHAR(20)  NOT NULL ) ;

ALTER TABLE espectaculos
 ADD CONSTRAINT pk_espectaculos
 PRIMARY KEY (cod_espectaculo) ;
ALTER TABLE precios_espectaculos
 ADD CONSTRAINT pk_precios_espectaculos
 PRIMARY KEY (cod_espectaculo, cod_recinto, zona) ;
ALTER TABLE recintos
 ADD CONSTRAINT pk_recintos
 PRIMARY KEY (cod_recinto) ;
ALTER TABLE zonas_recintos
 ADD CONSTRAINT pk_zonas_recintos
 PRIMARY KEY (cod_recinto, zona) ;
ALTER TABLE asientos
 ADD CONSTRAINT pk_asientos
 PRIMARY KEY (cod_recinto, zona, fila, numero) ;
ALTER TABLE representaciones
 ADD CONSTRAINT pk_representaciones
 PRIMARY KEY (cod_espectaculo, fecha, hora) ;
ALTER TABLE entradas
 ADD CONSTRAINT pk_entradas
 PRIMARY KEY (cod_espectaculo, fecha, hora, fila, numero, zona, dni_cliente) ;
ALTER TABLE espectadores
 ADD CONSTRAINT pk_espectadores
 PRIMARY KEY (dni_cliente) ;
 ALTER TABLE espectaculos
 ADD CONSTRAINT fk_espectaculos_recintos
 FOREIGN KEY (cod_recinto)
 REFERENCES recintos (cod_recinto) ;
ALTER TABLE precios_espectaculos
 ADD CONSTRAINT fk_precios_espectaculos
 FOREIGN KEY (cod_espectaculo)
 REFERENCES espectaculos (cod_espectaculo) ;
ALTER TABLE precios_espectaculos
 ADD CONSTRAINT fk_precios_recinto
 FOREIGN KEY (cod_recinto, zona)
 REFERENCES zonas_recintos (cod_recinto, zona) ;
ALTER TABLE zonas_recintos
 ADD CONSTRAINT fk_zonas_recintos
 FOREIGN KEY (cod_recinto)
 REFERENCES recintos (cod_recinto) ;
ALTER TABLE asientos
 ADD CONSTRAINT fk_asientos_recintos
 FOREIGN KEY (cod_recinto, zona)
 REFERENCES zonas_recintos (cod_recinto, zona) ;
ALTER TABLE representaciones
 ADD CONSTRAINT fk_representaciones_espectaculos
 FOREIGN KEY (cod_espectaculo)
 REFERENCES espectaculos (cod_espectaculo) ;
ALTER TABLE entradas
 ADD CONSTRAINT fk_entradas_espectaculo
 FOREIGN KEY (cod_espectaculo)
 REFERENCES espectaculos (cod_espectaculo) ;
ALTER TABLE entradas
 ADD CONSTRAINT fk_entradas_asientos
 FOREIGN KEY (cod_recinto, zona, fila, numero)
 REFERENCES asientos (cod_recinto, zona, fila, numero) ;
ALTER TABLE entradas
 ADD CONSTRAINT fk_entradas_espectadores
 FOREIGN KEY (dni_cliente)
 REFERENCES espectadores(dni_cliente) ;
