/******************************Multitablas******************************/



/*1. Nombre de los jugadores con contrato y equipo al que pertenecen*/
select jugadores.nombre AS Nombre_jugador, equipos.nombre AS Nombre_equipo
from jugadores, equipos, jugador_con_contrato, ofrecer
where jugadores.contrato = ofrecer.contrato
and jugadores.nombre = jugador_con_contrato.nombre
and ofrecer.equipo = equipos.nombre;

/*2. Nombre de los equipos, victorias y derrotas que pertenezcan al este*/
select equipos.nombre AS Nombre_equipo, temporada_regular.victorias AS Victorias, temporada_regular.derrotas AS derrotas
from equipos, temporada_regular, este
where equipos.nombre = este.nombre_este
and este.nombre_este = temporada_regular.name_equip;

/*3. Posicion de los equipos del oeste en los playoffs de 2019 y 2020*/
select equipos.nombre AS Nombre_equipo, clasificacion.posicion AS Posicion, clasificacion.playoffs AS Año_Playoffs
from equipos, clasificacion, oeste
where equipos.nombre = oeste.nombre_oeste
and equipos.nombre = clasificacion.equip_clas
and clasificacion.playoffs between 2019 and 2020;

/*4. Numero de victorias y derrotas de los dos equipos que llegaron a la final de la NBA en el año 2020*/
select campeon.este AS Campeon_del_este, campeon.oeste AS Campeon_del_oeste, victorias_este.victorias AS Victorias_ESTE, victorias_oeste.victorias AS Victorias_OESTE
from temporada_regular as victorias_este, temporada_regular as victorias_oeste, campeon, este, oeste, temporada_regular
where campeon.este = este.nombre_este
and campeon.oeste = oeste.nombre_oeste
and campeon.año_playoffs = 2020
and temporada_regular.num_temp = campeon.año_playoffs

/*5. Numero de partidos que han jugado los jugadores con contrato cuya posicion sea alero*/
select jugadores.nombre AS Nombre_del_jugador, jugadores.posicion AS Posicion, partidos.part_jug AS Partidos_jugados
from jugadores, partidos
where jugadores.nombre = partidos.jugador
and jugadores.posicion = 'Alero'

/******************************Multitablas******************************/

/******************************Subconsutas******************************/

/*1. Muestra el nombre y el contrato del jugador con mejor contrato*/
select nombre, contrato AS Contrato
from jugadores
where contrato = (select MAX(contrato) from jugadores)

/*2. Jugador que mas partidos jugó en 2020*/
select jugadores.nombre AS Jugador, partidos.part_jug AS Partidos
from jugadores, partidos
where partidos.part_jug = (select MAX(part_jug) from partidos)
and jugadores.nombre = partidos.jugador;

/*3. */