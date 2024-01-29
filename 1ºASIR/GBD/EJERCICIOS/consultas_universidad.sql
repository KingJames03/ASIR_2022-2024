/*1.5.4 Consultas sobre una tabla*/
/*1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. 
El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.*/

select apellido1, apellido2, nombre from persona WHERE tipo='alumno' order by apellido1, apellido2, nombre ASC;

/*2. Averigua el nombre y los dos apellidos de los alumnos
que no han dado de alta su número de teléfono en la base de datos.*/

select nombre, apellido1, apellido2 from persona WHERE tipo='alumno' AND telefono is NULL;

/*3. Devuelve el listado de los alumnos que nacieron en 1999.*/

select * from persona WHERE fecha_nacimiento BETWEEN '1999/01/01' AND '1999/12/31';

/*4. Devuelve el listado de profesores que no han dado de 
alta su número de teléfono en la base de datos y además su nif termina en K.*/

select nombre, apellido1, apellido2 FROM persona WHERE tipo='profesor' AND telefono is NULL AND nif LIKE '%K';

/*5. Devuelve el listado de las asignaturas que 
se imparten en el primer cuatrimestre, en el tercer 
curso del grado que tiene el identificador 7.*/

select * from asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado= 7;

/*1.5.5 Consultas multitabla (Composición interna)*/

/*1. Devuelve un listado con los datos de todas las alumnas 
que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).*/

select persona.*, grado.nombre as grado
from persona, asignatura,  grado, alumno_se_matricula_asignatura
WHERE persona.sexo ='M'
AND persona.id = alumno_se_matricula_asignatura.id_alumno
AND grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
AND grado.id = asignatura.id_grado
AND alumno_se_matricula_asignatura.id_asignatura = asignatura.id_grado

/*2. Devuelve un listado con todas las asignaturas ofertadas 
en el Grado en Ingeniería Informática (Plan 2015).*/

select asignatura.nombre as asignatura, grado.nombre as grado
from asignatura, grado
WHERE grado.id = asignatura.id_grado
AND grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY asignatura.id;

/*3. Devuelve un listado de los profesores junto con el nombre del departamento 
al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, 
nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.*/

select persona.apellido1 as Primer_apellido, persona.apellido2 AS Segundo_apellido, persona.nombre AS Nombre, departamento.nombre AS departamento
from persona, profesor, departamento
WHERE persona.tipo = 'profesor'
AND profesor.id_profesor = persona.id
AND profesor.id_departamento = departamento.id

/*4. Devuelve un listado con el nombre de las asignaturas, 
año de inicio y año de fin del curso escolar del alumno con nif 26902806M.*/

select asignatura.nombre, curso_escolar.anyo_inicio AS Inicio_curso, curso_escolar.anyo_fin AS Fin_curso
FROM persona, asignatura, alumno_se_matricula_asignatura, curso_escolar
WHERE persona.nif = '26902806M'
AND asignatura.curso = curso_escolar.id
AND asignatura.id = alumno_se_matricula_asignatura.id_asignatura
AND persona.id = alumno_se_matricula_asignatura.id_alumno

/*5. Devuelve un listado con el nombre de todos los departamentos que 
tienen profesores que imparten alguna asignatura en 
el Grado en Ingeniería Informática (Plan 2015).*/ 

select departamento.nombre AS Departamento, asignatura.nombre AS Asignatura, persona.nombre
from departamento, asignatura, profesor, grado, persona
WHERE profesor.id_departamento = departamento.id
AND grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
AND profesor.id_profesor = persona.id
AND asignatura.id_grado = grado.id
AND profesor.id_profesor = asignatura.id_profesor

/*6. Devuelve un listado con todos los alumnos 
que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.*/

select persona.*
from persona, asignatura, curso_escolar, alumno_se_matricula_asignatura
WHERE persona.tipo = 'alumno'
AND curso_escolar.anyo_inicio = 2018
AND alumno_se_matricula_asignatura.id_alumno = persona.id
AND alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
AND asignatura.id = alumno_se_matricula_asignatura.id_asignatura
order by persona.id

/*1.5.6 Consultas multitabla (Composición externa)*/

/*1. Devuelve un listado con los nombres de todos los profesores y 
los departamentos que tienen vinculados. El listado también debe mostrar 
aquellos profesores que no tienen ningún departamento asociado. 
El listado debe devolver cuatro columnas, nombre del departamento, 
primer apellido, segundo apellido y nombre del profesor.
El resultado estará ordenado alfabéticamente de menor a mayor 
por el nombre del departamento, apellidos y el nombre.*/

select departamento.nombre AS Departamento, persona.apellido1, persona.apellido2, persona.nombre AS Nombre_Profesor
from persona, profesor LEFT JOIN departamento on
profesor.id_departamento = departamento.id
WHERE persona.id = profesor.id_profesor

/*2. Devuelve un listado con los profesores que no están asociados a un departamento.*/
select persona.nombre, persona.apellido1, persona.apellido2
from persona, profesor LEFT JOIN departamento ON


/*3. Devuelve un listado con los departamentos que no tienen profesores asociados.*/
select departamento.*
from departamento LEFT JOIN profesor
    ON departamento.id = profesor.id_departamento
WHERE profesor.id_profesor is NULL

/*4. Devuelve un listado con los profesores que no imparten ninguna asignatura.*/
select persona.apellido1, persona.apellido2, persona.nombre
from persona, profesor LEFT JOIN asignatura
    ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.nombre is NULL
AND profesor.id_profesor = persona.id

/*5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.*/

select asignatura.*
from asignatura LEFT JOIN profesor
    ON asignatura.id_profesor = profesor.id_profesor
WHERE asignatura.id_profesor IS NULL

/*6. Devuelve un listado con todos los departamentos que tienen alguna 
asignatura que no se haya impartido en ningún curso escolar. 
El resultado debe mostrar el nombre del departamento y el 
nombre de la asignatura que no se haya impartido nunca.*/

select departamento.nombre AS Departamento, asignatura.nombre as Asignatura
from departamento, asignatura
LEFT JOIN alumno_se_matricula_asignatura
    on asignatura.id = alumno_se_matricula_asignatura.id_asignatura
LEFT JOIN profesor
    ON profesor.id_profesor = asignatura.id_profesor
WHERE departamento.id = profesor.id_departamento
group by asignatura.id