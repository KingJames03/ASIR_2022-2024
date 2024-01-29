/*1. Partidos que ha perdido el Barcelona (codi ‘bar’) jugando en casa.*/
SELECT * from partits where (equipc = "bar") and (golsf > golsc);

/*2. Partidos que ha perdido el Barcelona jugando fuera*/
SELECT * from partits where (equipf = "bar") and (golsc > golsf);

/*3. Cantidad de partidos que ha perdido el Barcelona.*/
SELECT count (*) from partits where (equipf = "bar") and (golsc > golsf);

/*4. Partidos donde se han marcado más de 5 goles.*/
SELECT * from partits where golsc + golsf >=5 or golsc >=5 or golsf >=5;

/*5. Jornadas que se jugaron en febrero.*/
SELECT * from jornades where data between "2013/02/01" and "2013/02/28";

/*6. Cuantos partidos no ha jugado el Valencia (no ha jugado si no están puesto los
goles).*/
SELECT count (*) from partits where golsc is null and (equipc="val" or equipf="val");

/*7. Partidos donde el Madrid (codi ‘rma’) ha recibido 3 o más goles.*/
SELECT count (*) from partits where (golsf >=3 and equipc="rma") or (golsc >=3 and equipf="rma");

/*8. Partidos donde el Madrid ha perdido por más de un gol de diferencia.*/
SELECT * from partits where (equipc="rma") and (golsc=golsf + 1) or (equipf="rma") and (golsf = golsc + 1); 

/*9. Partidos donde un equipo haya tenido más de un 60% de posesión.*/
SELECT * from partits where (possessioc > 60) or ((100 - possessioc) > 60);

/*10. Partidos donde un equipo haya tenido más del 60% de posesión y haya perdido el
partido.*/
SELECT * from partits where (possessioc > 60 and (golsc < golsf)) or ((100 - possessioc) > 60 and (golsf < golsc));

/*11. Muestra la quiniela de la primera jornada (equipo casa, equipo fuera, 1X2). Utiliza
la función “IF”. Ejemplo de uso:*/
SELECT equipc, equipf, if (golsc > golsf, 1, if (golsc = golsf, "X", 2)) AS 1X2 FROM partits;