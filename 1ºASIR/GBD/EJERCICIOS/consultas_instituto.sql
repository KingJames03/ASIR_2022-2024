INSERT INTO alumnos VALUES ("001","Juan","FPB"),("002","Pepe","ESO"),("003","Dani","ASIR");

CREATE TABLE a_asir AS SELECT codi,nombre FROM alumnos WHERE estudios="ASIR";

CREATE TABLE a_eso (codi int, nom VARCHAR(10));

INSERT INTO a_eso VALUES ("045","Luis"),("046","Fran"),("047","Jorge");

INSERT INTO a_eso SELECT codi,nombre FROM alumnos WHERE estudios = "ESO";

DELETE FROM alumnos where estudios = "ASIR";
DELETE FROM alumnos where estudios = "ESO";

ALTER TABLE alumnos RENAME a_fpb;

ALTER TABLE a_fpb DROP COLUMN estudios;
