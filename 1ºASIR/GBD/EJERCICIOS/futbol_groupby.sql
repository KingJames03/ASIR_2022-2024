/*1. Muestra de cada equipo: el código, salario máximo, mínimo, la suma de todos los
salarios, cuantos jugadores hay, de cuantos jugadores se conoce el sueldo y la media
entre todos los jugadores*/

select equip, MAX (sou), MIN (sou), SUM (sou),COUNT(*),COUNT (sou),AVG (sou) 
from jugadors 
GROUP BY equip;

/*2. Muestra cuantos jugadores tiene cada equipo en cada posición.*/
select equip, lloc, COUNT (*) from jugadors GROUP BY equip,lloc;

/*3. Goles marcados en total en cada jornada.*/
select jornada, (golsc+golsf) from partits GROUP BY jornada;

/*4. Media de goles por partido en cada jornada.*/
select jornada, AVG (golsc+golsf) from partits GROUP BY jornada;

/*5. Goles marcados por el pichichi de cada equipo. Es decir: mostrar el código del
equipo y los goles marcados por su máximo goleador.*/
select equip, MAX (gols) from golejadors GROUP BY equip;

/*6. Goles marcados en total por cada equipo en casa.*/
select equipc, SUM (golsc) from partits GROUP BY equipc;

/*7. Goles que han recibido en total cada equipo como visitante.*/
select equipf, SUM (golsc) from partits GROUP BY equipf;

/*8. Cuantos partidos han ganado cada equipo jugando en casa.*/
select equipc, COUNT (*) from partits WHERE golsc>golsf GROUP BY equipc;