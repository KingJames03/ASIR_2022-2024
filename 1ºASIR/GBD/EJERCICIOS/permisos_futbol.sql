/*1. Crea los usuarios entrenador, jugador, aficionado, prueba y prueba2, que tengan
como clave la misma que el nombre del usuario.*/
CREATE USER entrenador IDENTIFIED BY 'entrenador';
CREATE USER jugador IDENTIFIED BY 'jugador';
CREATE USER aficionado IDENTIFIED BY 'aficionado';
CREATE USER prueba IDENTIFIED BY 'prueba';
CREATE USER prueba2 IDENTIFIED BY 'prueba2';

/*2. Cambia el password del entrenador y ponle: mister. Esto no está en los apuntes.
Consulta en Internet*/
select user from mysql.user 
ALTER USER 'entrenador' IDENTIFIED BY 'mister';

/*3. Elimina el usuario prueba2.*/
select user from mysql.user 
drop user prueba2;
select user from mysql.user 

/*4. Da permiso al usuario entrenador para que pueda ver todos los datos de la bd, de
forma que el entrenador también pueda dar esos permisos a quien quiera*/
GRANT ALL on futbol to entrenador WITH GRANT OPTION;

/*5. Muestra los permisos del usuario entrenador.*/
show grants for entrenador;

/*6. Da permiso al usuario aficionado para ver los datos de la vista clasif2.*/
GRANT select on futbol.classif2 to aficionado

/*7. Da permiso de lectura a “prueba” sobre la tabla “equips” para ver todos los datos
menos su presupuesto*/
grant select(codi,nomcurt,nomllarg,ciutat,entrenador,estadi,marca,patrocinador) on futbol.equips to aficionado

/*8. Da permisos al entrenador para modificar el “lloc” y el “nombre” de los jugadores.*/
grant update(lloc,nom) on futbol.jugadors to entrenador

/*9. Da permisos al entrenador para eliminar jugadores, goleadores y porteros.*/
grant drop on futbol.jugadors to entrenador
grant drop on futbol.golejadors to entrenador
grant drop on futbol.porters to entrenador

show grants for entrenador;


/*10. Quita todos los permisos al usuario “prueba”*/
REVOKE ALL, GRANT OPTION FROM prueba
show grants for prueba

/*11. Da permisos para modificar todos los datos de la tabla equipos al usuario “prueba”
pero solo para hacerlo desde el mismo ordenador donde está guardad la BD.*/
GRANT update on futbol.equips to prueba;
GRANT USAGE ON futbol.equips to prueba@localhost IDENTIFIED BY 'prueba'
show grants for prueba


/*12. Da permisos a “prueba” para ver solo los datos de los partidos del barça. Este tiene
truco. A calentarse la cabeza!*/
create view partidos_barça as 
select * 
from partits
WHERE equipc = 'bar'
or equipf = 'bar'

GRANT SELECT ON futbol.partidos_barça to prueba;

show grants for prueba;
