/*1. Muestra toda la estadística de los goleadores
 que han marcado algún penalti.*/
select * from golejadors where penals > 0;

/*2. De cada partido, muestra la jornada, el equipo de casa y el de fuera, los goles de
cada equipo, el total de goles, la posesión del equipo de casa y la del equipo de fuera.
Pon nombres coherentes a las columnas.
*/
select jornada AS Jornada,
equipc AS Equipo_local,
equipf AS Equipo_Visitante,
golsc AS Goles_Locales,
golsf AS "Goles_Visitante",
(golsc+golsf) AS "Total_goles",
possessioc AS "Posesion_equipo_local",
(100-possessioc) AS Posesion_equipo_Visitante
FROM partits;

/*3. Goles marcados por el pichichi 
(solamente los goles, el nombre del jugador NO).
*/
select max(gols) from golejadors;

select * from jugadors
WHERE equip = (
    select equip from golejadors
    WHERE gols=46) AND dorsal= (
        select dorsal from golejadors WHERE gols=46);

/*4. Media de los goles por partido en toda la liga.*/
SELECT AVG(golsc+golsf) from partits;

/*5. Muestra los siguientes salarios: 
el más caro, el más barato y la media.*/
select
MAX(sou) AS Maximo_sueldo,
MIN(sou) AS Mininimo_sueldo,
AVG(sou) AS Media_salario
FROM jugadors;

/*6. Total de goles marcados en toda la liga.
Nota*: esta información está en dos tablas: en los resultados 
de los partidos y en los goles marcados por cada goleador. 
La explicación es que hay goles que no los han marcado los goleadores 
(como los goles de los porteros, defensas, en propia puerta…)*
a) Total de goles marcados en todos los partidos.
b) Total de goles marcados por todos los goleadores.*/
select (golsc+golsf) AS Total_goles_partidos
from partits;
select SUM(gols) AS Total_goles_goleadores
from golejadors;

/*7. Muestra cuantos partidos hay, cuantos se han jugado 
y cuantos no se han jugado.*/
SELECT COUNT(*) AS Total_partidos,
COUNT(possessioc>0) AS Partidos_jugados,
((COUNT(*))-(COUNT(possessioc>0))) AS No_jugados
from partits;

/*8. Muestra la diferencia entre el mayor presupuesto y el menor*/
SELECT MAX(pressupost) AS Maximo_presupuesto,
MIN(pressupost) AS Minimo_presupuesto,
((MAX(pressupost))-(MIN(pressupost))) AS Diferencia
 from equips;

 /*9. Muestra la fecha más antigua y 
 la más reciente de las jornadas.*/
 SELECT MIN(data) AS Fecha_mas_antigua,
 MAX(data) AS Fecha_mas_reciente
 from jornades;