/*1. Nombre del río más largo (y los kms)*/
select nom, longitud
from rius
where longitud = (select MAX(longitud) from rius)

/*2. De cada mar, muestra su nombre y el nombre del río más largo que desemboca en él (y los kms del río.)*/
select mars.nom, rius.nom, rius.longitud
from mars, rius
where rius.mar = mars.codi
and rius.longitud in (select max(longitud) from rius group by mar)

/*3. Cantidad de provincias por las cuales no pasa ningún río.*/
select count(*) AS Cantidad_provincias_no_pasa_rio
from provincies
where codi NOT IN (select prov from passaper)

/*4. Cantidad de provincias.*/
select count(*) AS Cantidad_provincias
from provincies

/*5.Cantidad de provincias donde no consta que limiten con ninguna otra.*/
select count(*) AS Cantidad_provincias_no_limita
from provincies
where codi not in (select prov1 from limita)
and codi not in (select prov2 from limita)