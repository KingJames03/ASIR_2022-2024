/*1. Comprueba si hay algún nombre de jugador repetido. Es decir, debes mostrar el
nombre del jugador y cuantas veces aparece pero para los jugadores que tengan el
nombre repetido*/

SELECT nom, COUNT(*) FROM jugadors GROUP BY nom HAVING (COUNT(*)>1);

/*2. Jornadas en las cuales se hayan marcado más de 35 goles. Tienen que aparecer el
número de la jornada y la cantidad total de goles correspondiente.*/

SELECT jornada, (golsc+golsf) FROM partits GROUP BY jornada HAVING (SUM((golsc+golsf))>35);

/*3. Queremos saber la posesión del balón de cada partido jugando en casa de aquellos
equipos donde si mínima posesión jugando en casa es mayor de 40. Ordenado de
mayor a menos posesión. La media de la posesión tiene que salir sin decimales.*/

SELECT equipc, ROUND (AVG (possessioc)) FROM partits GROUP BY equipc HAVING (AVG (possessioc)>40) ORDER BY 2 DESC;