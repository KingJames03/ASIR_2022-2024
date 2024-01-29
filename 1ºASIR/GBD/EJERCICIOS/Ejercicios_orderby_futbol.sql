/*1. Muestra el nombre largo de cada equipo y su presupuesto, ordenado por el
presupuesto, de menor a mayor.
*/
SELECT nomllarg AS Nombre_largo,
pressupost AS Presupuesto
from equips
ORDER BY 2 DESC;

/*2. De cada partido, muestra la jornada, el equipo de casa y sus goles. Primero saldrán
los que han marcado más goles.*/
SELECT jornada AS Jornada,
equipc AS Equipo_local,
golsc AS Goles_Locales
FROM partits
ORDER BY 3 DESC;

/*3. De cada partido, muestra la jornada, el equipo de casa y sus goles. Estarán
ordenados por equipo (de menor a mayor). Los partidos de cada equipo estarán
ordenados de más goles a menos.
*/
SELECT jornada AS Jornada,
equipc AS Equipo_local,
golsc AS Goles_Locales
FROM partits
ORDER BY 2 ASC, 3 DESC;

/*4. Muestra todos los datos del partido pero primer saldrán los partidos que se hayan
marcado más goles.
 En el caso de empate, saldrán primero los que marcaron más goles en casa.
 En el caso de segundo empate, saldrán ordenados por el código del equipo
de casa (de menor a mayor).
 En el caso de tercer empate, saldrán ordenados por la jornada*/

SELECT *
FROM partits
ORDER BY (golsc+golsf) DESC, golsc DESC, equipc ASC, jornada ASC;