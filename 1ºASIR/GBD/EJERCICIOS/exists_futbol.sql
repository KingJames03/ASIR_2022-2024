/*Ejercicios de subconsultas que devuelven más de una fila: uso de EXISTS(BD futbol)*/
/*1. Muestra el nombre de las ciudades que tengan algún equipo de fútbol. Hazlo al
menos con 3 soluciones posibles:
 EXISTS
 IN
 MULTITABLA (composición)
 MULTITABLA (join)
*/

/*exists*/
select nom
from ciutats
where EXISTS (select * from equips where equips.ciutat = ciutats.codi)

/*in*/
select nom 
from ciutats
where codi in (select ciutat from equips)

/*MULTITABLA (composición)*/
select ciutats.nom
from ciutats, equips
where equips.ciutat = ciutats.codi
group by ciutats.nom

/*MULTITABLA (join)*/
select ciutats.nom
from ciutats
INNER JOIN equips
    on ciutats.codi = equips.ciutat
group by ciutats.nom

/*2. Muestra el nombre de las ciudades que no tengan ningún equipo de futbol. Este
ejercicio ya lo hicimos con el “NOT IN” y con “!=ALL”. Hazlo ahora con el “NOT EXISTS”.*/
select nom
from ciutats
where NOT EXISTS (select * from equips where equips.ciutat = ciutats.codi)

/*2b. Nombre de equipos que no tienen ningún jugador con el dorsal 2.*/
SELECT nomllarg
FROM equips
WHERE codi NOT IN (SELECT equip FROM jugadors WHERE dorsal = 2);
