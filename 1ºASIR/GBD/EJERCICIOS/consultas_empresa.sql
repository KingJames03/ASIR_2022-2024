INSERT INTO DEPT VALUES (001,"Informatica","Paterna");
INSERT INTO DEPT VALUES (002,"RRHH","Paterna");
INSERT INTO DEPT VALUES (003,"Produccion","Riba-Roja");
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5401,"Juan", NULL,11,01,1000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5402,"Pablo",5401,12,02,2000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5403,"Luis", NULL ,11,01,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5405,"Carlos",5401,13,02,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5406,"Pepe",5401,0,02,5000);
INSERT INTO empleats (num, nom, cap, COMISSIO, DEPT,salari) VALUES (5407,"Joan",5401,NULL,02,5000);
UPDATE empleats set fecha_nac="1999-12-1" WHERE nom="Juan";
UPDATE empleats set fecha_nac="2001-3-3" WHERE nom="Pablo";

/*Ejercicio 1*/
SELECT DISTINCT DEPT FROM empleats;

/*Ejercicio 2*/
SELECT DISTINCT POBLE FROM DEPT;
/*Ejercicio 3*/
SELECT DISTINCT comissio, dept FROM empleats;
