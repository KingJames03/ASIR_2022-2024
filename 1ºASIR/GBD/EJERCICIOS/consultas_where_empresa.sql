INSERT INTO DEPT VALUES (001,"Informatica","Paterna");
INSERT INTO DEPT VALUES (002,"RRHH","Paterna");
INSERT INTO DEPT VALUES (003,"Produccion","Riba-Roja");
INSERT INTO DEPT VALUES (005,"TIC","Vila");
INSERT INTO DEPT VALUES (006,"Secretaria","Lliria");
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5401,"Juan", NULL,11,01,1000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5402,"Pablo",5401,12,02,2000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5403,"Luis", NULL ,11,01,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5405,"Carlos",5401,13,02,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5406,"Pepe",5401,0,02,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5407,"Joan",5401,NULL,02,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5408,"Alejandro",5401,45,02,7500);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5409,"Uri",5401,23,03,8000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5410,"Ricardo",5401,49,05,6500);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5411,"Andres",5401,13,06,3000);
UPDATE empleats set fecha_nac="1999-12-1" WHERE nom="Juan";
UPDATE empleats set fecha_nac="2001-3-3" WHERE nom="Pablo";


/*1. Muestra el nombre y comisión de aquellos empleados que NO tengan comisión
(piensa que puede haber empleados con comisión 0 y empleados con comisión NULL).*/
SELECT nom,COMISSIO FROM empleats WHERE COMISSIO = 0 or COMISSIO IS NULL;

/*2. Muestra el nombre y la comisión de los empleados que sean del departamento 2
con una comisión superior al 10%.*/

SELECT nom,COMISSIO FROM empleats WHERE DEPT = 2 AND COMISSIO >= 10;

/*3. Muestra el nombre y la comisión de los empleados que tengan una comisión entre
el 20 y el 50%. Hazlo de las dos formas: con el BETWEEN y sin el BETWEEN.*/
SELECT nom,COMISSIO FROM empleats WHERE COMISSIO BETWEEN 20 AND 50;
SELECT nom,COMISSIO FROM empleats WHERE COMISSIO >= 20 AND COMISSIO <= 50;

/*4. Muestra el nombre de los empleados de los departamentos 2,5 y 6. Muestra
también el departamento de cada uno. Hazlo de dos formas: con IN y sin IN.
*/
SELECT nom, DEPT FROM empleats WHERE DEPT IN (2,5,6);

SELECT nom, DEPT FROM empleats WHERE DEPT = 2 OR DEPT = 5 OR DEPT = 6;

/*5. Muestra todos los datos de los empleados que el nombre empiece por A, que
acaben con E y que la tercera letra de su nombre sea una I.*/

SELECT nom FROM empleats WHERE nom LIKE "A%" OR nom LIKE "%E" OR nom LIKE "__I%";
