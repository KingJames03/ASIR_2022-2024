DROP DATABASE IF EXISTS empresa;
create database empresa;
use empresa;

create table empleats(
num int,
nom varchar(10) not NULL,
CAP INT,
COMISSIO INT,
DEPT INT);

CREATE TABLE DEPT(
CODI INT,
NOM VARCHAR(15) NOT NULL,
POBLE VARCHAR(20));

ALTER TABLE DEPT ADD PRIMARY KEY (CODI);
ALTER TABLE empleats ADD PRIMARY KEY (num);
ALTER TABLE empleats ADD COLUMN salari INT NOT NULL;
ALTER TABLE empleats ADD FOREIGN KEY (DEPT) REFERENCES DEPT(CODI) ON DELETE CASCADE;
ALTER TABLE empleats ADD FOREIGN KEY (CAP) REFERENCES empleats(num);
/*ALTER TABLE empleats DROP FOREIGN KEY empleats_ibfk_1; -- Aço elimina la clau aliena
ALTER TABLE empleats DROP COLUMN CAP; -- NO deixa perque es clau aliena*/

/*Ejercicios FUNCIONES INTERNAS (BD empresa)
1. Para realizar los siguientes ejercicios de funciones, primero añadiremos la fecha
de nacimiento (fecha_nac) a cada empleado (con ALTER TABLE). Después, pon
fechas de nacimiento a los empleados existentes (con diferentes UPDATE).*/
ALTER TABLE empleats ADD COLUMN fecha_nac DATE;
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5401,"Juan", NULL ,10,01,1000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5402,"Pablo",5401,12,02,2000);
UPDATE empleats set fecha_nac=1999-12-1 WHERE nom="Juan";
UPDATE empleats set fecha_nac=2001-3-3 WHERE nom="Pablo";
/*2. Muestra todos los datos de la tabla de empleados y, además, de cada uno de
ellos: la longitud de su nombre, la comisión en tanto por 1 (en la tabla está como a
%), el día de la semana en que nacieron, la fecha de nacimiento expresado en
formato: 19 del 3 del 1970.*/
/*SELECT *,
CHAR_LENGTH(nom) AS longitud_nom,
COMISSIO/100 AS Comissio_per_1,
DAYNAME(fecha_nac) AS DIA_DE_LA_SEMANA,
CONCAT(DAY(fecha_nac), "del", MONTH(fecha_nac),"del",YEAR(fecha_nac)) 
FROM empleats;*/
/*3. Muestra los nombres de los departamentos en minúscula y mayúscula.*/
INSERT INTO DEPT VALUES (001,"Informatica","Paterna");
INSERT INTO DEPT VALUES (002,"RRHH","Paterna");
/*SELECT NOM, LOWER (NOM), UPPER(NOM)
FROM DEPT;*/


