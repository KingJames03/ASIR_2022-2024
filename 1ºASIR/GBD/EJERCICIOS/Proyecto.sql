DROP DATABASE IF EXISTS proyecto;
CREATE DATABASE proyecto;
USE proyecto;

CREATE TABLE Jugadores (
    nombre         VARCHAR(20)   NOT NULL,
    años           INTEGER               ,
    posicion       VARCHAR(20)           ,
    dorsal         INTEGER               ,
    contrato       INTEGER                ) ;

CREATE TABLE Jugadores_nac (
    nacionalidad   VARCHAR(20)           ,
    nombre         VARCHAR(20)   NOT NULL ) ;

CREATE TABLE Agente_libre (
    nombre         VARCHAR(20)            ) ;

CREATE TABLE Jugador_con_contrato (
    nombre         VARCHAR(20)            ) ;

CREATE TABLE Equipos (
    nombre         VARCHAR(20)           ,
    dors_reti      VARCHAR(30)           ,
    campeonatos    INTEGER               ,
    fech_fund      INTEGER               ,
    clasificacion  INTEGER                ) ;

CREATE TABLE Temporada_regular (
    name_equip     VARCHAR(20)           ,
    num_temp       INTEGER               ,
    victorias      INTEGER               ,
    derrotas       INTEGER               ,
    posicion       INTEGER                ) ;

CREATE TABLE Partidos (
    temp_regular   INTEGER               ,
    jugador        VARCHAR(20)           ,
    equipo         VARCHAR(20)   NOT NULL,
    part_jug       INTEGER                ) ;

CREATE TABLE Dueño (
    nombre        VARCHAR(20)            ,
    patrimonio    INTEGER                 ) ;

CREATE TABLE Tiene (
    dueño         VARCHAR(20)            ,
    equipo        VARCHAR(20)            ,
    fech_adq      INTEGER                    ) ;

CREATE TABLE Contratos (
    dinero        INTEGER                ,
    años_ofr      INTEGER                ,
    nombre_jug    VARCHAR(20)             ) ;

CREATE TABLE Ofrecer (
    contrato      INTEGER                ,
    equipo        VARCHAR(20)             ) ;

CREATE TABLE Playoffs (
    año           INTEGER                    ) ;   

CREATE TABLE Campeon (
    año_playoffs  INTEGER                ,
    este          VARCHAR(20)            ,  
    oeste         VARCHAR(20)            ,
    nba           VARCHAR(20)             ) ;

CREATE TABLE Clasificacion (
    equip_clas    VARCHAR(20)            ,
    posicion      INTEGER                ,
    playoffs      INTEGER                 ) ;

CREATE TABLE Este (
    nombre_este   VARCHAR(20)            ,
    año_este      INTEGER                ,
    clasi         INTEGER                 ) ;

CREATE TABLE Oeste (
    nombre_oeste  VARCHAR(20)            ,
    año_oeste     INTEGER                ,
    clasi         INTEGER                 ) ;

/*CLAVES PRIMARIAS*/
ALTER TABLE Jugadores ADD CONSTRAINT pk_jugadores
 PRIMARY KEY (nombre);

ALTER TABLE Jugadores_nac ADD CONSTRAINT pk_jugadores_nac
 PRIMARY KEY (nacionalidad,nombre);

ALTER TABLE Agente_libre ADD CONSTRAINT pk_agente_libre
 PRIMARY KEY (nombre);

ALTER TABLE Jugador_con_contrato ADD CONSTRAINT pk_jugador_con_contrato
 PRIMARY KEY (nombre);

ALTER TABLE Equipos ADD CONSTRAINT pk_equipos
 PRIMARY KEY (nombre);

ALTER TABLE Temporada_regular ADD CONSTRAINT pk_temporada_regular
 PRIMARY KEY (num_temp,name_equip);

ALTER TABLE Partidos ADD CONSTRAINT pk_partidos
 PRIMARY KEY (temp_regular, jugador);

ALTER TABLE Dueño ADD CONSTRAINT pk_dueño
 PRIMARY KEY (nombre);

ALTER TABLE Tiene ADD CONSTRAINT pk_tiene
 PRIMARY KEY (dueño);

ALTER TABLE Ofrecer ADD CONSTRAINT pk_ofrecer
 PRIMARY KEY (contrato, equipo);

ALTER TABLE Contratos ADD CONSTRAINT pk_contratos
 PRIMARY KEY (dinero);

ALTER TABLE Playoffs ADD CONSTRAINT pk_playoffs
 PRIMARY KEY (año);

ALTER TABLE Campeon ADD CONSTRAINT pk_campeon
 PRIMARY KEY (año_playoffs, nba, este, oeste);


ALTER TABLE Este ADD CONSTRAINT pk_este
 PRIMARY KEY (clasi,año_este,nombre_este);

ALTER TABLE Oeste ADD CONSTRAINT pk_oeste
 PRIMARY KEY (clasi,año_oeste,nombre_oeste);

ALTER TABLE Clasificacion ADD CONSTRAINT pk_clasificacion
 PRIMARY KEY (posicion);

/*CLAVES AJENAS*/

/*ALTER TABLE Jugadores ADD CONSTRAINT fk_jugadores
 FOREIGN KEY (contrato)
 REFERENCES Contratos (dinero);*/

ALTER TABLE Temporada_regular  ADD CONSTRAINT fk_name_equip
 FOREIGN KEY (name_equip)
 REFERENCES Equipos(nombre);

ALTER TABLE Jugadores_nac ADD CONSTRAINT fk_jugadores_nac
 FOREIGN KEY (nombre)
 REFERENCES Jugadores (nombre);

ALTER TABLE Agente_libre ADD CONSTRAINT fk_agente_libre
 FOREIGN KEY (nombre)
 REFERENCES Jugadores (nombre);

ALTER TABLE Jugador_con_contrato ADD CONSTRAINT fk_jugador_con_contrato
 FOREIGN KEY (nombre)
 REFERENCES Jugadores (nombre);

ALTER TABLE Equipos ADD CONSTRAINT fk_equipos_clasi
 FOREIGN KEY (clasificacion)
 REFERENCES Clasificacion (posicion);

ALTER TABLE Partidos ADD CONSTRAINT fk_partidos_jugador
 FOREIGN KEY (jugador)
 REFERENCES Jugadores (nombre);

ALTER TABLE Partidos ADD CONSTRAINT fk_partidos_equipo
 FOREIGN KEY (equipo)
 REFERENCES Equipos (nombre);

ALTER TABLE Tiene ADD CONSTRAINT fk_tiene_dueño
 FOREIGN KEY (dueño)
 REFERENCES Dueño (nombre);

ALTER TABLE Tiene ADD CONSTRAINT fk_tiene_equipo
 FOREIGN KEY (equipo)
 REFERENCES Equipos (nombre);

ALTER TABLE Ofrecer ADD CONSTRAINT fk_ofrecer_contrato
 FOREIGN KEY (contrato)
 REFERENCES Contratos (dinero);

ALTER TABLE Ofrecer ADD CONSTRAINT fk_ofrecer_equipo
 FOREIGN KEY (equipo)
 REFERENCES Equipos (nombre);

ALTER TABLE Campeon ADD CONSTRAINT fk_campeon
 FOREIGN KEY (año_playoffs)
 REFERENCES Playoffs (año);

ALTER TABLE Clasificacion ADD CONSTRAINT fk_clasificacion
 FOREIGN KEY (playoffs)
 REFERENCES Playoffs (año);

ALTER TABLE Clasificacion ADD CONSTRAINT fk_equip_clas
 FOREIGN KEY (equip_clas)
 REFERENCES Equipos (nombre);

ALTER TABLE Este ADD CONSTRAINT fk_nombre_este
 FOREIGN KEY (nombre_este)
 REFERENCES Equipos (nombre);

ALTER TABLE Oeste ADD CONSTRAINT fk_nombre_oeste
 FOREIGN KEY (nombre_oeste)
 REFERENCES Equipos (nombre);

ALTER TABLE Este ADD CONSTRAINT fk_año_este
 FOREIGN KEY (año_este)
 REFERENCES Playoffs (año);

ALTER TABLE Oeste ADD CONSTRAINT fk_año_oeste
 FOREIGN KEY (año_oeste)
 REFERENCES Playoffs (año);

ALTER TABLE Contratos ADD CONSTRAINT fk_contratos_nombre_jugador
 FOREIGN KEY (nombre_jug)
 REFERENCES Jugadores (nombre);

/*INSERCION DE DATOS*/

INSERT INTO Jugadores VALUES ("Lebron James",38,"Alero",6,138),("Stephen Curry",34,"Base",30,89),
("Kevin Durant",34,"Alero",7,NULL),("Lamelo Ball",21,"Base",1,NULL),
("Zion Williamson",22,"Ala-Pivot",1,50),("Ja Morant",23,"Base",12,NULL),
("Anthony Davis",29,"Ala-Pivot",3,NULL),("Luka Doncic",24,"Base",77,NULL),
("Demar Derozan",33,"Alero",11,100),("Derrick White",28,"Escolta",9,16),
("Marc Gasol",36,"Pivot",33,NULL),("Lance Stephenson",34,"Base",6,NULL);

INSERT INTO Jugadores_nac VALUES ("EEUU","Lebron James"), ("EEUU","Stephen Curry"),("EEUU","Kevin Durant"),
("EEUU","Lamelo Ball"), ("EEUU","Zion Williamson"), ("EEUU","Ja Morant"), ("EEUU","Anthony Davis"),
("Eslovenia","Luka Doncic"), ("EEUU","Demar Derozan"), ("EEUU","Derrick White"),("España","Marc Gasol"),
("EEUU","Lance Stephenson");

INSERT INTO Agente_libre VALUES ("Marc Gasol"), ("Lance Stephenson");

INSERT INTO Jugador_con_contrato VALUES ("Lebron James"), ("Stephen Curry"), ("Kevin Durant"),
("Lamelo Ball"), ("Zion Williamson"), ("Ja Morant"), ("Anthony Davis"), ("Luka Doncic"),
("Demar Derozan"), ("Derrick White");

INSERT INTO Playoffs VALUES (2018), (2019), (2020), (2021); 

INSERT INTO Equipos VALUES ("Lakers","8,24,32,33,34","17","1947","12"),("Warriors","13,14,24","7","1946","10"),
("Chicago Bulls","23,33,91","6","1966","10"), ("Pelicans","0","0","1988","4"),
("Miami Heat","1,3,32","3","1988","6"), ("Celtics","5,6,33,34","17","1946","1");

INSERT INTO Clasificacion VALUES ("Lakers","11","2018"), ("Lakers","10","2019"), ("Lakers","1","2020"),
("Lakers","12","2021"), ("Warriors","2","2018"), ("Warriors","1","2019"), ("Warriors","15","2020"),
("Warriors","10","2021"), ("Celtics","2","2018"), ("Celtics","4","2019"), ("Celtics","3","2020"),
("Celtics","1","2021"), ("Pelicans","6","2018"), ("Pelicans","13","2019"), ("Pelicans","13","2020"),
("Pelicans","4","2021"), ("Chicago Bulls","13","2018"), ("Chicago Bulls","13","2019"),
("Chicago Bulls","11","2020"), ("Chicago Bulls","10","2021"), ("Miami Heat","6","2018"),
("Miami Heat","10","2019"), ("Miami Heat","5","2020"), ("Miami Heat","6","2021");

INSERT INTO Temporada_regular VALUES ("Lakers","2020","52","19","1"),
("Warriors","2020","15","50","15"),("Celtics","2020","48","24","3"),("Pelicans","2020","30","42","13"),
("Chicago Bulls","2020","22","43","11"),("Miami Heat","2020","44","29","5");

INSERT INTO Oeste VALUES ("Lakers","2020","1"),("Warriors","2020","15"),("Pelicans","2020","13");

INSERT INTO Este VALUES ("Celtics","2020","3"),("Miami Heat","2020","5"),("Chicago Bulls","2020","11");

INSERT INTO Campeon VALUES ("2020","Miami Heat","Lakers","Lakers");

INSERT INTO Partidos VALUES ("2020","Lebron James","Lakers","65"),("2020","Stephen Curry","Warriors","50"),
("2020","Demar Derozan","Chicago Bulls","54"),("2020","Derrick White","Celtics","35");

INSERT INTO Dueño VALUES ("Magic Johnson","620"),("Joe Lacob","1500"),("Micky Arison","5700"),
("Jerry Reinsdorf","1800"),("Gayle Benson","4700"),("Celtics Partners","8000");

INSERT INTO Tiene VALUES ("Magic Johnson","Lakers",1995),("Joe Lacob","Warriors",2010),
("Micky Arison","Miami Heat",1995),("Jerry Reinsdorf","Chicago Bulls",1985),
("Gayle Benson","Pelicans",2018),("Celtics Partners","Celtics",1989);

INSERT INTO Contratos VALUES ("138","4","Lebron James"),("89","3","Stephen Curry"),
("100","4","Demar Derozan"),("50","2","Zion Williamson"),("16","1","Derrick White");

INSERT INTO Ofrecer VALUES ("138","Lakers"),("89","Warriors"),("100","Chicago Bulls"),
("50","Pelicans"),("16","Celtics");




