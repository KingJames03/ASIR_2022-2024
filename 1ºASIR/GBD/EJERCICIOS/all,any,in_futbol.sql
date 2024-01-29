/*1. Nombre del equipo con más presupuesto 
(de 2 formas: usando MAX y usando ALL)*/
select pressupost, nomllarg
from equips 
where pressupost = (select MAX(pressupost) from equips);

select pressupost, nomllarg
from equips
where pressupost >= ALL (select pressupost from equips)

/*2. Nombre de los equipos que no tienen 
el mayor presupuesto (de 2 formas: usando MAX y usando ANY)*/
select nomllarg
from equips
where pressupost < (select MAX(pressupost) from equips);

select nomllarg
from equips
where pressupost < ANY (select pressupost from equips);

/*3. Nombre de las ciudades que no tienen 
equipo (de 2 formas: usando ALL y usando IN)*/
select nom
from ciutats
where codi != ALL (select ciutat from equips)

select nom
from ciutats
where codi not in (select ciutat from equips)

/*4. Muestra el nombre de los jugadores 
que cobren más que todo un equipo entero.*/
select nom, sou
from jugadors 
where sou > ANY (select (pressupost*1000000) from equips);

/*5. Nombre de los jugadores que han 
marcado más goles que todo un equipo entero.*/
select jugadors.nom, golejadors.gols
from jugadors
INNER JOIN golejadors
    ON jugadors.equip = golejadors.equip
    and jugadors.dorsal = golejadors.dorsal
where golejadors.gols > ANY (select sum(gols) from golejadors group by equip);

/*6. Nombre de los jugadores que han marcado más goles que todo un equipo entero.
También tiene que aparecer el código del equipo del goleador y el código del equipo
a quien supera. Ordenador por el equipo del goleador, nombre del jugador y equipo
a quien supera.*/
select jugadors.nom, jugadors.equip, equips.codi
from golejadors, jugadors, equips
where gols > (select sum(gols) from golejadors g2 where g2.equip = equips.codi)
and golejadors.equip = jugadors.equip
and golejadors.dorsal = jugadors.dorsal
order by 2, 1, 3

/*7. Igual que el ejercicio anterior pero también tiene que aparecer los goles de los
goleadores y los goles del equipo con quien se compara.*/
select jugadors.nom, jugadors.equip, equips.codi, golejadors.gols, sum(golequip.gols)
from golejadors, jugadors, equips, golejadors as golequip
where golejadors.gols > (select sum(gols) from golejadors g2 where g2.equip = equips.codi)
and golejadors.equip = jugadors.equip
and golejadors.dorsal = jugadors.dorsal
and golequip.equip = equips.codi
group by 1, 2, 3, 4
order by 2, 1, 3;

/*8. Jugadores (equipo y nombre) que aún no haya marcado ningún gol. Ordenado por
equipo y nombre.*/

select jugadors.nom, jugadors.equip
from jugadors
where dorsal NOT IN (select dorsal from golejadors)
order by 2, 1

/*9. Equipo con más jugadores*/
SELECT equips.nomllarg
from equips
where codi = (select equip from jugadors group by equip having count(dorsal) >= ALL
(select count(dorsal) from jugadors group by equip))


/*10. Equipo con más jugadores y la cantidad de jugadores.*/
SELECT equips.nomllarg, count(jugadors.dorsal)
from equips, jugadors
where jugadors.equip = equips.codi
and codi = (select equip from jugadors group by equip having count(dorsal) >= ALL
(select count(dorsal) from jugadors group by equip));

/*11. Equipo con más jugadores y equipo con menos jugadores. También tienen que
aparecer las cantidades y una palabra al lado que diga “MAX” o “MIN”.*/
SELECT equips.nomllarg, count(jugadors.dorsal) AS MAX
from equips, jugadors
where jugadors.equip = equips.codi
and equips.codi = (select equip from jugadors group by equip having count(dorsal) >= ALL
(select count(dorsal) from jugadors group by equip))
UNION
SELECT equips.nomllarg, count(jugadors.dorsal) AS MIN
from equips, jugadors
where jugadors.equip = equips.codi
and equips.codi = (select equip from jugadors group by equip having count(dorsal) <= ALL
(select count(dorsal) from jugadors group by equip));

