/*4. Crear una vista con el check option:
A. Crea la vista “equipets” con el código, nombre corto, y presupuesto de todos
los equipos que tengan un presupuesto inferior a 30 millones de euros. Hazlo
con el check option.*/
create view equipets AS
select codi, nomcurt, pressupost
from equips 
where pressupost < 30
WITH CHECK OPTION;

/*B. Inserta a través de la vista “equipets” estos equipos, con dos inserts:
a. Equipo “gan”, “C.F. Gandia”, con 0 millones de euros de presupuesto.
b. Equipo “and”, “Andorra C.F”, con 31 millones de presupuesto. Tiene
que dar error por no cumplir la condición de check option.*/
insert into equipets values ("gan","C.F. Gandia",0);
insert into equipets values ("and","Andorra C.F",31);


/*C. Elimina a través de la vista “equipets” los equipos de más de 40 millones de
presupuesto. No dará error pero no borrará ningún equipo, debido al check
option.*/
delete from equipets
where pressupost > 40;

/*D. A través de la vista “equipets” haz que el nuevo presupuesto del C.F. Gandia
ahora sea de 31 millones. Dará error por no cumplir el check option.*/
update equipets
set pressupost = 31
where codi = "gan";


/*5. Crear una vista no actualizable:
A. Crear la vista “equips_nombrosos” con el código del equipo, el nombre corto,
el nombre de la ciudad y la cantidad de jugadores de cada uno. Pero nada
más con aquellos equipos que tengan más de 30 jugadores en la plantilla. Los
nombres de las columnas serán: código, nombre, ciudad, plantilla.*/
create view equips_nombrosos AS
select equips.codi AS codigo, equips.nomcurt AS nombre, ciutats.nom AS ciudad, count(jugadors.dorsal) AS plantilla
from equips, jugadors, ciutats
where equips.ciutat = ciutats.codi
and jugadors.equip = equips.codi
group by jugadors.equip 
having count(jugadors.dorsal) > 30


/*B. En la vista “equipos_nombrosos” modifica el nombre del equipo del Betis
(código “bet”): ahora se llamará “Betis”. Dará un error diciendo que la vista
no es actualizable. No lo es porque como tiene un group by (y multitabla), no
se puede “traducir” ese update cobre la vista a un update sobre tablas. Lo
mismo pasaría si intentamos hacer inserts o deletes sobre esa vista.*/
update equips_nombrosos
set nombre = "Betis"
where codi = "bet";

/*6. Crea una vista a partir de otra (ejercicio solucionado):
A. Crea una vista “resultats_equipos” con estos campos:
 equipo: código del equipo.
 pgc: cantidad de Partidos Ganados en Casa.
 pec: cantidad de Partidos Empatados en Casa.
 ppc: cantidad de Partidos Perdidos en Casa.
 pgf: cantidad de Partidos Ganados Fuera.
 pef: cantidad de Partidos Empatados Fuera.
 ppf: cantidad de Partidos Perdidos Fuera.*/
create view resultats_equipos AS
select codi AS equipo,
(select count(*) from partits where equipc=e.codi and golsc>golsf) as pgc,
(select count(*) from partits where equipc=e.codi and golsc=golsf) as pec,
(select count(*) from partits where equipc=e.codi and golsc<golsf) as ppc,
(select count(*) from partits where equipf=e.codi and golsf>golsc) as pgf,
(select count(*) from partits where equipf=e.codi and golsf=golsc) as pef,
(select count(*) from partits where equipf=e.codi and golsf<golsc) as ppf
from equips e;


/*B. Crea la vista “clasif” con los siguientes campos. Créala a partir de la vista
“resultats_equips”:
equip = Código del equipo
pjc = Partidos Jugados en Casa
pgc = Partidos Ganados en Casa
pec = Partidos Empatados en Casa
ppc = Partidos Perdidos en Casa
puntsc = Puntos en Casa
pjf = Partidos Jugados Fuera
pgf = Partidos Ganados Fuera
pef = Partidos Empatados Fuera
ppf = Partidos Perdidos Fuera
puntsf = Punts Fora
pjt = Partits Jugats en Total
pgt = Partits Guanyats en Total
pet = Partits Empatats en Total
ppt = Partits Perduts en Total
puntst = Punts en Tota
*/
create view classif as
select codi AS equipo, ((select count(*) from partits where equipc=e.codi and golsc>golsf)
+ (select count(*) from partits where equipc=e.codi and golsc=golsf) + (select count(*) from partits where equipc=e.codi and golsc<golsf)) as pjc,
(select count(*) from partits where equipc=e.codi and golsc>golsf), (select count(*) from partits where equipc=e.codi and golsc=golsf),
(select count(*) from partits where equipc=e.codi and golsc<golsf), (3*(select count(*) from partits where equipc=e.codi and golsc>golsf)
+ (select count(*) from partits where equipc=e.codi and golsc=golsf)) as puntsc,
((select count(*) from partits where equipf=e.codi and golsf>golsc) + (select count(*) from partits where equipf=e.codi and golsf=golsc) + (select count(*) from partits where equipf=e.codi and golsf<golsc)) as pjf,
(select count(*) from partits where equipf=e.codi and golsf>golsc), (select count(*) from partits where equipf=e.codi and golsf=golsc),
 (select count(*) from partits where equipf=e.codi and golsf<golsc), (3*(select count(*) from partits where equipf=e.codi and golsf>golsc)
+ (select count(*) from partits where equipf=e.codi and golsf=golsc)) as puntsf,
((select count(*) from partits where equipc=e.codi and golsc>golsf) + (select count(*) from partits where equipc=e.codi and golsc=golsf)
+ (select count(*) from partits where equipc=e.codi and golsc<golsf) + (select count(*) from partits where equipf=e.codi and golsf>golsc)
+ (select count(*) from partits where equipf=e.codi and golsf=golsc) + (select count(*) from partits where equipf=e.codi and golsf<golsc)) as pjt,
((select count(*) from partits where equipc=e.codi and golsc>golsf)+ (select count(*) from partits where equipf=e.codi and golsf>golsc)) as pgt,
((select count(*) from partits where equipc=e.codi and golsc=golsf) + (select count(*) from partits where equipf=e.codi and golsf=golsc)) as pet,
((select count(*) from partits where equipc=e.codi and golsc<golsf) + (select count(*) from partits where equipf=e.codi and golsf<golsc)) as ppt,
(3*(select count(*) from partits where equipc=e.codi and golsc>golsf) + (select count(*) from partits where equipc=e.codi and golsc=golsf)
+ 3*(select count(*) from partits where equipf=e.codi and golsf>golsc) + (select count(*) from partits where equipf=e.codi and golsf=golsc)) as puntst
from equips e;

create view classiff as
select equipo, (pgc + pec + ppc) as pjc,
pgc, pec, ppc, (3*pgc + pec) as puntsc,
(pgf + pef + ppf) as pjf,
pgf, pef, ppf, (3*pgf + pef) as puntsf,
(pgc + pec + ppc + pgf + pef + ppf) as pjt,
(pgc+ pgf) as pgt,
(pec + pef) as pet,
(ppc + ppf) as ppt,
(3*pgc + pec + 3*pgf + pef) as puntst
from resultats_equipos;

/*C. Crea la vista “clasif2” con los campos de “clasif” más otros campos calculados:
goles marcados (a casa, fuera y en total), recibidos (en casa, fuera y en total)
y los que quieras.*/
create view classif2 as
select *, (select sum(golsc) -- Goles Marcados en Casa
from partits
where partits.equipc = classif.equipo) as gmf,
(select sum(golsf) -- Goles Marcados Fuera
from partits
where partits.equipf = classif.equipo) as gmt,
(select sum(golsc) -- Goles Marcados en Total
from partits
where partits.equipc = classif.equipo)
+ (select sum(golsf)
from partits
where partits.equipf = classif.equipo) as grc,
(select sum(golsf) -- Goles Recibidos en Casa
from partits
where partits.equipc = classif.equipo) as grf,
(select sum(golsc) -- Goles Recibidos Fuera
from partits
where partits.equipf = classif.equipo) as grt,
(select sum(golsf) -- Goles Recibidos en Total
from partits
where partits.equipc = classif.equipo)
+ (select sum(golsc)
from partits
where partits.equipf = classif.equipo) as gra
from classif;



