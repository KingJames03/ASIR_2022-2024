/*1. Edad media de los ciclistas del equipo TVM.*/
select AVG(ciclistes.edat) as Media_edad
from ciclistes
where equip = 'TVM';

/*2. Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain.*/
select ciclistes.nom 
from ciclistes
where equip = (select equip from ciclistes where nom = 'Miguel Indurain');

/*3. Nombre de los ciclistas que han ganado alguna etapa.*/
select ciclistes.nom AS Ganador, etapes.ciclista AS Etapa
from ciclistes, etapes
where etapes.ciclista = ciclistes.dorsal;

/*4. Nombre de los ciclistas que han llevado el maillot General.*/
select ciclistes.nom AS Nombre
from ciclistes, mallots, portar
where portar.mallot = mallots.codi
and portar.ciclista = ciclistes.dorsal
and mallots.tipus = 'General'
Group by ciclistes.nom;

/*5.Obtener el nombre del ciclista más joven (trampa).*/
select nom, edat
from ciclistes
where edat = (select MIN(edat) from ciclistes);

/*6. Obtener el número de ciclistas de cada equipo.*/
select count(nom) AS Numero_ciclistas, equip
from ciclistes
Group by equip;

/*7. Obtener el nombre de los equipos que tengan más de 5 ciclistas.*/
select equip
from ciclistes
Group by equip
having count(nom) > 5;

/*8. Obtener el número de puertos que ha ganado cada ciclista.*/
select ciclistes.nom AS Nombre, count(ports.ciclista) AS Puertos
from ciclistes
INNER JOIN ports 
 on ciclistes.dorsal = ports.ciclista
 group by ciclistes.dorsal


/*9. Obtener el nombre de los ciclistas que han ganado más de un puerto.*/
select ciclistes.nom AS Nombre, count(ports.ciclista) AS Puertos
from ciclistes
INNER JOIN ports 
 on ciclistes.dorsal = ports.ciclista
 group by ciclistes.dorsal
 having count(ports.ciclista) > 1;

/*10. Obtener el nombre y el director de los equipos a los que pertenezca algún ciclista mayor de 33 años.*/
select equips.nom AS Nombre_Equipo, equips.director AS Director
from ciclistes, equips
where ciclistes.edat < 33
group by equips.nom;

/*11. Nombre de los ciclistas que no pertenezcan a Kelme.*/
select nom AS Nombre, equip AS Equipo
from ciclistes
where equip NOT LIKE 'Kelme';

/*12. Nombre de los ciclistas que no hayan ganado ninguna etapa.*/
select ciclistes.nom AS Nombre
from ciclistes, etapes
where etapes.ciclista NOT LIKE ciclistes.dorsal
group BY ciclistes.nom;

/*13. Nombre de los ciclistas que hayan ganado más de un puerto de montaña.*/
select ciclistes.nom AS Nombre
from ciclistes, mallots, portar
where mallots.codi = 'MMO'
and portar.mallot = 'MMO'
and portar.ciclista = ciclistes.dorsal
group by ciclistes.nom
having count(mallots.tipus) > 1;

/*14. De cada equipo obtener la edad media, la máxima edad y la mínima edad.*/
select equips.nom AS Equipo, AVG(ciclistes.edat) AS Media, MAX(ciclistes.edat) AS MAX, MIN(ciclistes.edat) AS MIN
FROM equips, ciclistes
where equips.nom = ciclistes.equip
group by ciclistes.equip;

/*15. Nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años
y que no pertenezcan a los equipos Kelme y Banesto.*/
select nom, equip
from ciclistes
where (edat BETWEEN 25 and 30)
and equip NOT LIKE 'Kelme'
and equip NOT LIKE 'Banesto';

/*16. Nombre de los ciclistas que han ganado la etapa que comienza en Benidorm.*/
select ciclistes.nom AS Nombre, etapes.eixida AS comienza
from ciclistes, etapes
where etapes.ciclista = ciclistes.dorsal
and etapes.eixida = 'Benidorm';

/*17. Obtener el nombre de cada puerto indicando el número 
(netapa) y los kilómetros de la etapa en la que se encuentra el puerto.*/
select ports.nom, ports.etapa , etapes.kms as Kilometros
from ports, etapes
where ports.etapa = etapes.numero;

/*18. Obtener el nombre de los ciclistas con el color de cada maillot que hayan llevado.*/
select ciclistes.nom , mallots.color AS color
from ciclistes, portar, mallots
where portar.ciclista = ciclistes.dorsal
group by mallots.color, ciclistes.nom
order by ciclistes.nom ASC;

/*19. Obtener pares de nombre de ciclista y número de etapa tal que ese ciclista 
haya ganado esa etapa habiendo llevado el maillot de color amarillo al menos una vez.*/
select ciclistes.nom, etapes.numero, mallots.color
from ciclistes, etapes, mallots, portar
where mallots.color = 'groc'
and portar.mallot = mallots.codi
and etapes.ciclista = ciclistes.dorsal
and portar.ciclista = ciclistes.dorsal
and portar.etapa = etapes.numero
group by etapes.numero;

/*20. Obtener el valor del atributo netapa de las etapas 
que no comienzan en la misma ciudad en que acabó la anterior etapa.*/
select etapa_antes.numero, etapa_antes.eixida, etapa_siguiente.arribada
from etapes as etapa_antes, etapes as etapa_siguiente
where etapa_antes.eixida not like etapa_siguiente.arribada;