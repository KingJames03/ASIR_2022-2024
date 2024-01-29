DROP DATABASE IF EXISTS instituto; 
CREATE DATABASE instituto; 
USE instituto; 
CREATE TABLE ALUMNOS ( 
 codigo     INTEGER, 
 nombre	    VARCHAR(5), 
 estudios	VARCHAR(5) 
);
INSERT INTO instituto VALUES ("001","Juan","FPB"),(002,"Juan","FPB");
