/*1. Dorsal, equipo y goles del pichichi (el que ha marcado más goles).*/
select dorsal, equip, gols 
from golejadors
where gols = (select MAX(gols) from golejadors)

/*2. Nombre del pichichi.*/
select jugadors.nom AS Nombre
from jugadors, golejadors
where golejadors.dorsal = jugadors.dorsal
and golejadors.equip = jugadors.equip
and golejadors.gols = (select MAX(gols) from golejadors)

/*3. Muestra el nombre y el sueldo del jugador mejor pagado de toda la liga.*/
select nom AS Nombre, sou AS Mejor_sueldo
from jugadors
where sou = (select MAX(sou) from jugadors)

/*4. Muestra el nombre y el sueldo del jugador mejor pagado de cada equipo.*/
select nom AS Nombre, sou AS Mejor_sueldo, equip AS Equipo 
from jugadors
where sou = (select MAX(sou) from jugadors AS jugadors2
where jugadors2.equip = jugadors.equip)

/*5. Jugador que más cobra de cada equipo dentro de su categoría (lugar).
Se debe mostrar el nombre del equipo, el nombre del jugador, el lugar y el sueldo 
(expresado en millones de euros, con un decimal). Ordenado por equipo y lugar.*/
select nom AS Nombre, sou AS Mejor_sueldo, equip AS Equipo, lloc AS Lugar
from jugadors
where sou = (select MAX(sou) from jugadors AS jugadors2
where jugadors2.equip = jugadors.equip
and jugadors2.lloc = jugadors.lloc)
order by equip, lloc;

/*6. Muestra todos los datos de los partidos donde más goles se marcaron de todo el campeonato.*/
select equipc AS Equipo_Casa, equipf AS Equipo_Visitante, jornada AS Jornada, golsc AS Goles_casa, golsf as Goles_Visitante, possessioc as Posesion_Casa
from partits
where golsc+golsf = (select MAX(golsc+golsf) from partits)

/*7. Muestra todos los datos de los partidos donde más goles se marcaron de cada jornada. Ordenado por la jornada.*/
select equipc AS Equipo_Casa, equipf AS Equipo_Visitante, jornada AS Jornada, golsc AS Goles_casa, golsf as Goles_Visitante, possessioc as Posesion_Casa
from partits 
where golsc+golsf = (select MAX(golsc+golsf) from partits AS partits2
where partits2.jornada = partits.jornada)
order by jornada

/*8. Nombre de los jugadores de los equipos del partido donde más goles se marcaron. 
Muestra también el código de sus equipos. Ordenado por equipo y nombre del jugador.*/
select jug.nom AS Nombre, jug.equip AS Equipo
from jugadors as jug
where jug.equip = (select equipc from partits where golsc+golsf = (select MAX(golsc+golsf)
from partits))
    or jug.equip = (select equipf from partits where golsc+golsf = (select MAX(golsc+golsf)
from partits))
order by jug.equip, jug.nom

/*9. Jornadas en las cuales se han marcado más goles que la jornada anterior.*/
select jornada
from partits
group by jornada
having sum(golsc+golsf) > (select sum(golsc+golsf) from partits as p1 where p1.jornada = (partits.jornada-1))

/*10. Nombre largo de equipos que tienen más de 2 porteros, más de dos defensas, 
más de dos mediocentros y más de dos delanteros.*/
select equips.nomllarg AS Nombre
from equips
where equips.codi = (select j1.equip from jugadors j1 where j1.lloc = 'defensa'
and j1.equip = equips.codi group by j1.lloc having count(*) > 2)
and equips.codi = (select j2.equip from jugadors j2 where j2.lloc = 'mig'
and j2.equip = equips.codi group by j2.lloc having count(*) > 2)
and equips.codi = (select j3.equip from jugadors j3 where j3.lloc = 'davanter'
and j3.equip = equips.codi group by j3.lloc having count(*) > 2)
and equips.codi = (select j4.equip from jugadors j4 where j4.lloc = 'porter'
and j4.equip = equips.codi group by j4.lloc having count(*) > 2)