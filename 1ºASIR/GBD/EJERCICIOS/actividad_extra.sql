/*Crea una base datos llamada Actividad_Extra con una tabla llamada alumnos.
Añade 3 registros.*/
create database actividad_extra;
use actividad_extra;

create table alumnos (
    cod int primary key,
    nombre varchar (20),
    apellido varchar (20)
);

insert into alumnos values (001,"Jaime","Mayordomo");
insert into alumnos values (002,"Joan","Cervera");
insert into alumnos values (003,"Raúl","Ibáñez");

/*Crea dos usuarios (gestor1 y gestor2) con todos los privilegios 
de lectura, insert, modificar y borrar registros y lector con los privilegios de solo lectura.*/
create user gestor1 identified by 'gestor1'
create user gestor2 identified by 'gestor2'
create user lector identified by 'lector'

grant select, insert, update, delete 
    on actividad_extra.*
    to gestor1, gestor2

grant select on 
    actividad_extra.*
    to lector


