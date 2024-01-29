/*1. De cada partido queremos mostrar los códigos de los equipos y el nombre de la
ciudad donde juegan.*/
select partits.equipc,partits.equipf, ciutats.nom
from partits,equips,ciutats
where partits.equipc = equips.codi
and ciutats.codi = equips.ciutat;

/*2. De cada partido que falta por jugar queremos mostrar en qué fecha se disputará,
los nombre cortos de los equipos, los nombres de las ciudades respectivas y el total
de habitante de las dos ciudades.
*/

select jornades.data, equipcasa.nomcurt AS Equipo_local, equipfora.nomcurt AS Equipo_visitante, ciutatcasa.nom AS Ciutat_partit, ciutatcasa.habitants+ciutatfora.habitants as Habitantes_totales
from partits, jornades, equips as equipcasa, equips as equipfora, ciutats as ciutatcasa, ciutats as ciutatfora
where partits.jornada = jornades.num
and partits.equipc = equipcasa.codi
and partits.equipf = equipfora.codi
and equipcasa.ciutat = ciutatcasa.codi
and equipfora.ciutat = ciutatfora.codi
and partits.golsc is null;


/*3. De cada equipo: el presupuesto, lo que se gasta con los jugadores y el porcentaje
que representa.
*/
select equips.codi, equips.pressupost AS Presupuesto, SUM(jugadors.sou) AS Gasto_jugadores, ROUND((SUM(jugadors.sou)*100)/(equips.pressupost*1000000),2) AS Porcentaje
FROM equips, jugadors
where equips.codi = jugadors.equip
group by equips.codi;

/*4. Lista de jugadores donde conste: nombre del jugador y nombre de la ciudad donde
juega.
*/
select jugadors.nom AS Nom_jugador, ciutats.nom AS Ciutat_on_juga
from jugadors, equips, ciutats
where jugadors.equip = equips.codi
and ciutats.codi = equips.ciutat;

/*5. Cantidad total de goles de penalti marcados por equipos de ciudades de menos de
200000 habitantes.*/
select sum(golejadors.penals) AS Cantidad_total_penaltis,ciutats.nom as Ciudad, ciutats.habitants AS Ciudades_menos_200000
from golejadors, equips, ciutats
where ciutats.habitants < 200000
and golejadors.equip = equips.codi
and equips.ciutat = ciutats.codi
group by ciutats.nom;

/*6. En qué fechas se han enfrentado el Valencia y el Barcelona (sabiendo que sus
códigos son “val” y “bar”). Muestra que equipo jugaba en casa y fuera y el resultado
de los goles.*/
select  jornades.data AS Fecha,partits.equipc AS Equipo_casa, partits.equipf AS Equipo_visitante, partits.golsc AS Goles_casa, partits.golsf AS Goles_visitante
from jornades, partits
where (partits.equipc = "val" and partits.equipf = "bar") OR (partits.equipc = "bar" AND partits.equipf = "val")
and jornades.num = partits.jornada group BY partits.jornada;

/*7. En qué fechas se han enfrentado el Valencia y el Barcelona (sabiendo que sus
nombres cortos son “Valencia” y “Barça”). Muestra que equipo jugaba en casa y fuera
(nombres largos) y el resultado de los goles.*/
select jornades.data AS Fecha, equipcasa.nomllarg AS Equipo_Casa, equipfora.nomllarg AS Equipo_visitante, partits.golsc AS Goles_casa, partits.golsf AS Goles_visitante
FROM jornades, equips AS equipcasa, equips AS equipfora, partits
where ((partits.equipc = 'val' and partits.equipf = 'bar') OR (partits.equipc = 'bar' AND partits.equipf = 'val'))
AND partits.equipc = equipcasa.codi
and partits.equipf = equipfora.codi
and jornades.num = partits.jornada group BY partits.jornada;

/*8. Muestra parejas de jugadores donde uno de ellos cobre 10 veces más que el otro.
Muestra también sus sueldos.*/
select jugadors.nom AS Jugador_mas ,jugadorsmenos.nom AS Jugador_menos, jugadors.sou AS Cobra_mas, jugadorsmenos.sou AS Cobra_menos
from jugadors RIGHT join jugadors as jugadorsmenos
on jugadorsmenos.sou * 10 < jugadors.sou


/*9. Modifica el ejercicio anterior para que también aparezcan los respectivos nombres
(largos) de los equipos*/
select jugadors.nom AS Jugador_mas, equipsmas.nomllarg AS Equipo_cobra_mas, jugadorsmenos.nom AS Jugador_menos, equipsmenos.nomllarg AS Equipo_cobra_menos, jugadors.sou AS Cobra_mas, jugadorsmenos.sou AS Cobra_menos
from equips as equipsmas, equips as equipsmenos, jugadors RIGHT join jugadors as jugadorsmenos
on jugadorsmenos.sou*10 < jugadors.sou
where jugadors.equip = equipsmas.codi
and jugadorsmenos.equip = equipsmenos.codi;

/*10. Medicampistas que cobren más que algún delantero de su equipo. Se debe
mostrar los 2 nombre y sus 2 sueldos.*/
select jugadors.nom AS Jugador_medio_mas, jugadorsmenos.nom AS Jugador_delantero_mas, jugadors.sou AS Cobra_mas, jugadorsmenos.sou AS Cobra_menos
from jugadors RIGHT join jugadors as jugadorsmenos
on jugadors.sou > jugadorsmenos.sou
where jugadors.lloc = "mig"
and jugadorsmenos.lloc = "davanter"
and jugadors.equip = jugadorsmenos.equip;

/*11. Parejas de portero y goleador de un mismo equipo donde el goleador haya
marcado más goles que los que ha encajado el portero. Se debe mostrar el equipo y
el nombre del portero y goleador con sus respectivos goles. Ordenado por equipo y
el nombre del portero.*/
select porters.equip AS Equipo, portero.nom AS Portero, porters.gols AS Goles_encajados, golejadors.equip AS Equipo, goleador.nom AS Goleador, golejadors.gols
FROM porters, jugadors AS portero, jugadors AS goleador, golejadors
where porters.equip = portero.equip
and porters.dorsal = portero.dorsal
and golejadors.equip = goleador.equip
and golejadors.dorsal = goleador.dorsal
and porters.gols < golejadors.gols
and portero.equip = goleador.equip;


/*12. Queremos comparar los goles de Messi y Ronaldo (no sabemos el nombre
completo de ellos). Muestra el nombre del jugador y toda la estadística de los goles
como jugadores pero solamente el de los dos.*/
select jugadors.nom AS Nombre, golejadors.gols AS Goles, golejadors.penals AS Penaltis, golejadors.pp AS Propia_puerta, golejadors.minutsgol AS Minutos_goles, golejadors.gtitular AS Goles_titular,
golejadors.gsuplent AS Goles_suplente, golejadors.gpunts AS Goles_puntos, golejadors.gvictoria AS Goles_victoria, golejadors.gremuntada AS Goles_remuntada,
golejadors.percent AS Porcentaje
from golejadors, jugadors
where ((jugadors.equip = 'bar' and jugadors.dorsal = 10) OR (jugadors.equip = 'rma' and jugadors.dorsal = 7))
and golejadors.equip = jugadors.equip
and golejadors.dorsal = jugadors.dorsal;

/*13. Media de goles marcados en cada jornada y la fecha de la jornada (un decimal).*/
select AVG(partits.golsc+partits.golsf) AS Media_goles, jornades.data AS Jornada
FROM partits, jornades
where partits.jornada = jornades.num
group by jornades.num;

/*14. Cuantos partidos ha ganado/empatado/perdido cada equipo, pero sin diferenciar
si es en casa o fuera (solo los goles totales)*/
select equips.codi as "EQUIP", count(*) as "PARTITS", "Guanyats" as "RESULTAT"
from equips, partits
where ((equips.codi = partits.equipc) AND golsc>golsf) OR ((equips.codi = partits.equipf) AND golsf>golsc)
group by 1
UNION
select equips.codi, count(*), "Empatats" as "RESULTAT"
from equips, partits
where (equips.codi = partits.equipc AND golsc = golsf) OR (equips.codi = partits.equipf AND golsf=golsc)
group by 1
UNION
select equips.codi, count(*), "Perduts" as "RESULTAT"
from equips, partits
where ((equips.codi = partits.equipc) AND golsc<golsf) OR ((equips.codi = partits.equipf) AND golsf<golsc)
group by 1
order by 1, 3;

/*15. Quants partits li queda per jugar en total a cada equip? */
select equips.codi as "Equip", count(*) as Partits_per_jugar
from partits, equips
where (partits.equipc = equips.codi OR partits.equipf = equips.codi) AND partits.golsc is null
group by 1;