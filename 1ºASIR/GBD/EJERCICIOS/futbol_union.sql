/*Muestra la quiniela de la primera jornada (equipo casa, equipo fuera, 1X2). Este
ejercicio se realizó pero utilizando la función IF. Ahora lo deberéis solucionar sin
utilizar esa función y ordenado por el código del equipo que juega en casa.*/
select equipc,equipf,1 as resultat from partits where golsc > golsf AND jornada=1
UNION 
(select equipc,equipf,'X' as resultat FROM partits where golsc=golsf AND jornada=1 
UNION 
SELECT equipc,equipf,2 as resultat FROM partits WHERE golsf > golsc AND jornada=1)
ORDER BY equipc; 

/*2. Cuántos 1, cuántos X y cuántos 2 en la primera jornada.*/
select 1 AS resultat,COUNT(*) AS quantitat from partits where golsc > golsf AND jornada=1
UNION 
(select 'X' as resultat,COUNT(*) AS quantitat FROM partits where golsc=golsf AND jornada=1 
UNION 
SELECT 2 as resultat,COUNT(*) AS quantitat FROM partits WHERE golsf > golsc AND jornada=1);

/*3. Cuántos 1, cuántos X y cuántos 2 en cada jornada (ordenado por la jornada).*/
select jornada AS jornada,1 AS resultat,COUNT(*) AS quantitat from partits where golsc > golsf GROUP BY jornada
UNION 
(select jornada AS jornada,'X' as resultat,COUNT(*) AS quantitat FROM partits where golsc=golsf GROUP BY jornada
UNION 
SELECT jornada AS jornada,2 as resultat,COUNT(*) AS quantitat FROM partits WHERE golsf > golsc GROUP BY jornada)
ORDER BY jornada;

/*4. ¿Cuántos partidos le quedan por jugar a cada equipo en casa y cuántos fuera?
Muestra la información ordenada por equipo. Dentro de cada equipo, primero los de
casa.*/
SELECT equipc AS EQUIP, COUNT(*) AS PARTITS,'casa' AS LLOC FROM partits WHERE possessioc is null GROUP BY equipc
UNION
SELECT equipf AS EQUIP, COUNT(*) AS PARTITS,'fora' AS LLOC FROM partits WHERE possessioc is null GROUP BY equipf
ORDER BY EQUIP;

/*5. Cuántos partidos ha ganado/empatado/perdido cada equipo jugando en
casa/fuera. Ordenado por equipo.*/
SELECT equipc AS EQUIP, COUNT(*) AS PARTITS,'guanyats a casa' AS RESULTAT FROM partits WHERE golsc>golsf GROUP BY equipc
UNION
SELECT equipc AS EQUIP, COUNT(*) AS PARTITS,'empatats a casa' AS RESULTAT FROM partits WHERE golsc=golsf GROUP BY equipc
UNION
SELECT equipc AS EQUIP, COUNT(*) AS PARTITS,'perduts a casa' AS RESULTAT FROM partits WHERE golsf>golsc GROUP BY equipc
UNION
SELECT equipf AS EQUIP, COUNT(*) AS PARTITS,'guanyats fora' AS RESULTAT FROM partits WHERE golsf>golsc GROUP BY equipf
UNION
SELECT equipf AS EQUIP, COUNT(*) AS PARTITS,'empatats fora' AS RESULTAT FROM partits WHERE golsf=golsc GROUP BY equipf
UNION
SELECT equipf AS EQUIP, COUNT(*) AS PARTITS,'perduts fora' AS RESULTAT FROM partits WHERE golsc>golsf GROUP BY equipf
order by EQUIP,'guanyats a casa','empatats a casa','perduts a casa','guanyats fora','empatats fora','perduts fora';