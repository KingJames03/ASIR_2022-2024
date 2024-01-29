/*1. Crear una vista:
A. Crea la vista jug_sue con el dorsal, nombre y lugar del jugador del equipo de
código “sue” (no existe en la tabla de jugadores pero da igual). No le pongas
la cláusula del check option.*/
CREATE VIEW jug_sue AS
select dorsal, nom, lloc
from jugadors
where equip = 'sue';

/*B. Comprueba el contenido de la vista jue_sue. Debemos hacer un select sobre
la vista. Verás que no tiene nada ya que no hay jugadores de ese equipo.*/
select *
from jug_sue;

/*2. Comprobación del funcionamiento de la vista:
A. Inserta el equipo “tav” (Tavernes C.F) y el “sue” (Sueca United) en la tabla de
equipos.*/
insert into equips VALUES
('tav','Tavernes','Tavernes C.F',null, null, null, null, null, null),
('sue','Sueca','Sueca United',null, null, null, null, null, null);

/*B. Inserta en la tabla de jugadores dos nuevos delanteros: Pepe, del Tavernes
C.F y Pablo del Sueca United.*/
insert into jugadors VALUES
('tav','10','Pepe','Davanter',null),
('sue','10','Pablo','Davanter',null);

/*C. Comprueba el contenido de la vista jug_sue. Verás que ahora la vista SI que
tiene un jugador (Pablo). Realmente “NO LO TIENE” pero a través de la vista
estamos mirando los jugadores de la tabla que son del Sueca United.*/
select *
from jug_sue;

/*D. Haz que el jugador del Tavernes C.F fiche por el Sueca United (si es necesario,
cámbiale el dorsal). Debemos de hacer un UPDATE.*/
UPDATE jugadors
set dorsal = 9 
where equip = 'tav'
and nom = 'Pepe';

UPDATE jugadors
set equip = 'sue'
where equip = 'tav'
and nom = 'Pepe'

/*E. Vuelve a comprobar el contenido de la vista jue_sue. Ahora estamos viendo
dos jugadores (Pepe y Pablo).*/
select *
from jug_sue;

/*F. Elimina a Pepe de la tabla jugadores. Tenemos que hacer un DELETE sobre la
tabla.*/
DELETE from jugadors
where nom = 'Pepe'
and equip = 'sue';

/*G. Elimina a Pablo a través de la vista jue_sue. Tenemos que hacer un DELETE
sobre la tabla.*/
DELETE from jug_sue
where nom = 'Pablo'
and dorsal = 10

/*H. Comprueba el contenido de la vista jug_sue. Te dará un error porque en el
insert no le ponemos el código del equipo y, por tanto, cuando se intente
insertar en la tabla de jugadores no admitirá un NULL en el campo del equipo.
Pero si no fuera por eso, sí que se permitiría insertar a través de una vista.*/
select *
from jug_sue;

/*3. Eliminar una vista:
A. Elimina la vista anterior (jug_sue). No hay que borrar sus registros sino que la
destruyas. Tendremos que hacer un drop de la vista. Esto no afectará a la
tabla sobre la cual estaba definida.*/
drop view jug_sue;