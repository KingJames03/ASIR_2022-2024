DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados;
USE empleados;

CREATE TABLE empleados (
    DNI         VARCHAR(8)   NOT NULL,
    NOMBRE      VARCHAR(10)  NOT NULL,
    APELLIDO1   VARCHAR(15)  NOT NULL,
    APELLIDO2   VARCHAR(15)  NOT NULL, 
    DIRECC1     VARCHAR(25)          ,
    DIRECC2     VARCHAR(20)          ,
    CIUDAD      VARCHAR(20)          ,
    PROVINCIA   VARCHAR(20)          ,
    COD_POSTAL  VARCHAR(5)           ,
    SEXO        VARCHAR(1)           ,
    FECHA_NAC   DATE                 );

CREATE TABLE departamentos (
    DPTO_COD     INTEGER       NOT NULL,
    NOMBRE_DPTO  VARCHAR(30)   NOT NULL,
    DPTO_PADRE   INTEGER               ,
    PRESUPUESTO  INTEGER       NOT NULL,
    PRES_ACTUAL  INTEGER       NOT NULL);

CREATE TABLE estudios (
    EMPLEADO_DNI  VARCHAR(8)    NOT NULL,
    UNIVERSIDAD   VARCHAR(5)    NOT NULL,
    AÑO           INTEGER       NOT NULL,
    GRADO         VARCHAR(3)    NOT NULL,
    ESPECIALIDAD  VARCHAR(20)   NOT NULL);

CREATE TABLE historial_laboral (
    EMPLEADO_DNI    VARCHAR(8)  NOT NULL,
    TRABAJO_COD     INTEGER     NOT NULL,
    FECHA_INICIO    DATE        NOT NULL,
    FECHA_FIN       DATE        NOT NULL,
    DPTO_COD        INTEGER     NOT NULL,
    SUPERVISOR_DNI  VARCHAR(8)  NOT NULL);

CREATE TABLE universidades (
    UNIV_COD    VARCHAR(5)         NOT NULL,
    NOMBRE_UNIV VARCHAR(25)     NOT NULL,
    CIUDAD      VARCHAR(20)     NOT NULL,
    MUNICIPIO   VARCHAR(2)      NOT NULL,
    COD_POSTAL  VARCHAR(5)      NOT NULL);

CREATE TABLE historial_salarial (
    EMPLEADO_DNI    VARCHAR(8)    NOT NULL,
    SALARIO         INTEGER       NOT NULL,
    FECHA_COMIENZO  DATE          NOT NULL,
    FECHA_FIN       DATE          NOT NULL);

CREATE TABLE trabajos (
    TRABAJO_COD     INTEGER       NOT NULL,
    NOMBRE_TRAB     VARCHAR(20)   NOT NULL,
    SALARIO_MIN     INTEGER       NOT NULL,
    SALARIO_MAX     INTEGER       NOT NULL);

/*Sexo M o H*/
ALTER TABLE empleados ADD CONSTRAINT ck_sexo
 CHECK (sexo ="H" OR sexo="M");

/*Claves unicas*/
ALTER TABLE departamentos ADD CONSTRAINT uk_nombre_dpto
 UNIQUE (nombre_dpto);

ALTER TABLE trabajos ADD CONSTRAINT uk_nombre_trab
 UNIQUE (nombre_trab);

/*Claves primarias*/
ALTER TABLE historial_salarial ADD CONSTRAINT pk_historial_salarial
 PRIMARY KEY (empleado_dni, salario, fecha_comienzo);

ALTER TABLE historial_laboral ADD CONSTRAINT pk_historial_laboral
 PRIMARY KEY (empleado_dni,trabajo_cod,fecha_inicio);

ALTER TABLE empleados ADD CONSTRAINT pk_empleados
 PRIMARY KEY (dni) ;

ALTER TABLE departamentos ADD CONSTRAINT pk_departamentos
 PRIMARY KEY (DPTO_COD);

ALTER TABLE estudios ADD CONSTRAINT pk_estudios
 PRIMARY KEY (empleado_dni, universidad, especialidad);

ALTER TABLE universidades ADD CONSTRAINT pk_universidades
 PRIMARY KEY (univ_cod);

ALTER TABLE trabajos ADD CONSTRAINT pk_trabajos
 PRIMARY KEY (trabajo_cod);

/*Claves ajenas*/
ALTER TABLE historial_salarial ADD CONSTRAINT fk_historial_salarial_empleado
 FOREIGN KEY (empleado_dni)
 REFERENCES empleados (dni);

ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_empleado
 FOREIGN KEY (empleado_dni)
 REFERENCES empleados (dni);

ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_supervisor
 FOREIGN KEY (supervisor_dni)
 REFERENCES empleados (dni);

ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_trabajo
 FOREIGN KEY (trabajo_cod)
 REFERENCES trabajos (trabajo_cod);

ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_dpto
 FOREIGN KEY (dpto_cod)
 REFERENCES departamentos (dpto_cod);

ALTER TABLE departamentos ADD CONSTRAINT fk_departamento_padre
 FOREIGN KEY (dpto_padre)
 REFERENCES departamentos (dpto_cod);

ALTER TABLE estudios ADD CONSTRAINT fk_estudios_empleado
 FOREIGN KEY (empleado_dni)
 REFERENCES empleados (dni);

ALTER TABLE estudios ADD CONSTRAINT fk_estudios_universidad
 FOREIGN KEY (universidad)
 REFERENCES universidades (univ_cod)
 ON DELETE CASCADE;/*EJERCICIO 4*/

/*1.Insertar dos filas en cada tabla, rellenando todos sus atributos y haciendo cumplir
las restricciones de integridad anteriores*/
/*EMPLEADOS*/
INSERT INTO empleados VALUES("111444","Julio","Madonado","Pedrerol","Marines","Roig","Vila","Vlc","46191","H","1970-03-01");
INSERT INTO empleados VALUES("111322","Paco","Rodriguez","Embuena","Literato Azorin","Moscardon","PDB","Vlc","46192","H","1995-04-03");
/*TRABAJOS*/
INSERT INTO trabajos VALUES("011","Sergio","200","1200");
INSERT INTO trabajos VALUES("012","Paco","500","1300");
/*DEPARTAMENTOS*/
INSERT INTO departamentos VALUES ("055","Informatica",NULL,"5000","1000");
INSERT INTO departamentos VALUES ("034","RRHH","055","5100","1500");
UPDATE departamentos SET dpto_padre=034 WHERE dpto_cod=055;
/*UNIVERSIDADES*/
INSERT INTO universidades VALUES("1111","UV","VLC","VC","46170");
INSERT INTO universidades VALUES("2222","UPV","VLC","VC","46170");
/*ESTUDIOS*/
INSERT INTO estudios VALUES("111444","1111","2019","GIT","Bioquimica");
INSERT INTO estudios VALUES("111322","2222","2019","CAF","Fisioterapia");
/*HISTORIAL_LABORAL*/
INSERT INTO historial_laboral VALUES("111444","011","05-03-01","06-03-24","055","111322");
INSERT INTO historial_laboral VALUES("111322","012","03-03-05","06-03-14","055","111444");
/*HISTORIAL_SALARIAL*/
INSERT INTO historial_salarial VALUES("111444","1800","05-03-01","06-03-24");
INSERT INTO historial_salarial VALUES("111322","2300","03-03-05","06-03-14");

/*2.Inserte las siguientes filas (las columnas que no aparecen se considerarán nulas). 
Puesto que existe una restricción para los valores del campo Sexo (H y M) 
ninguna de las sentencias anteriores funcionaría.*/
INSERT INTO empleados (nombre, apellido1, apellido2, dni, sexo) VALUES ("Sergio","Palma","Entrena","111444","P");
INSERT INTO empleados (nombre, apellido1, apellido2, dni, sexo) VALUES ("Lucia","Ortega","Plus","222333",NULL);
/*Puesto que existe una restricción para los valores del campo Sexo (H y M) 
ninguna de las sentencias anteriores funcionaría.*/

/*6. Añada un nuevo atributo VALORACIÓN en la tabla de EMPLEADOS que indique
de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar
su andadura en la empresa. Ponga el valor por defecto 5 para ese campo.*/
ALTER TABLE empleados ADD valoracion INTEGER DEFAULT 5;

ALTER TABLE empleados ADD CONSTRAINT ck_valoracion
 CHECK (valoracion BETWEEN 1 AND 10);

/*7. Elimine la restricción de que el atributo NOMBRE de la tabla EMPLEADOS no
puede ser nulo.*/
ALTER TABLE empleados MODIFY nombre VARCHAR(10) NULL;
/*8. Modificar el tipo de datos de DIREC1 de la tabla EMPLEADOS a cadena de
caracteres de 40 como máximo.*/
ALTER TABLE empleados MODIFY direcc1 VARCHAR(40);


/*10.Cambiar la clave primaria de EMPLEADOS al NOMBRE y los dos APELLIDOS*/
ALTER TABLE historial_salarial DROP CONSTRAINT fk_historial_salarial_empleado;
ALTER TABLE historial_laboral DROP CONSTRAINT fk_historial_laboral_empleado;
ALTER TABLE historial_laboral DROP CONSTRAINT fk_historial_laboral_supervisor;
ALTER TABLE estudios DROP CONSTRAINT fk_estudios_empleado;
ALTER TABLE empleados DROP PRIMARY KEY;
ALTER TABLE empleados ADD CONSTRAINT pk_empleados 
 PRIMARY KEY (nombre, apellido1, apellido2);

