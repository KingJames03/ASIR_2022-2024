/*1. Borra las ciudades que no tengan equipo de fútbol.*/
delete from ciutats
where codi not in (select ciutat from equips);

/*2. Incrementa 1000 euros a cada jugador que haya ganado algún partido en su equipo*/
update jugadors
set sou = sou + 1000
where equip in (select equipc from partits where golsc > golsf);

/*3. Incrementa 1000 euros a cada jugador por cada partido que haya ganado su equipo*/
update jugadors
set sou = sou + 1000*(select count(equipc) from partits 
where golsc > golsf group by equipc
having jugadors.equip = partits.equipc)
where (jugadors.equip) in (select equipc from partits
where golsc > golsf group by equipc)

/*4. Incrementa 1000 euros a cada portero que haya recibido menos de 20 goles*/
update jugadors
set sou = sou + 1000
where (equip, dorsal) in (select equip, dorsal from porters where gols < 20);


/*5. Incrementa 1000 euros a cada jugador por cada gol marcado.*/
update jugadors
set jugadors.sou = jugadors.sou + 1000*(select gols from golejadors 
group by equip, dorsal
having (jugadors.equip, jugadors.dorsal) = (golejadors.equip, golejadors.dorsal))
where (jugadors.equip, jugadors.dorsal) in (select equip, dorsal from golejadors 
group by equip, dorsal)

