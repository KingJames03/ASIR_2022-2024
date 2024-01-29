/*1.Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante, empleado.apellido1 AS apellido_representante
from cliente JOIN empleado
    on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

/*2.Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante
from cliente JOIN empleado
    ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
NATURAL JOIN pago;

/*3.Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante
from cliente JOIN empleado
    ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN pago
    ON cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.id_transaccion is NULL;

/*4.Devuelve el nombre de los clientes que han hecho pagos y 
el nombre de sus representantes junto con la ciudad de la oficina 
a la que pertenece el representante.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante, oficina.ciudad AS Ciudad_oficina
from cliente JOIN empleado AS Representante
    ON cliente.codigo_empleado_rep_ventas = Representante.codigo_empleado
NATURAL JOIN pago,
empleado NATURAL JOIN oficina;

/*5.Devuelve el nombre de los clientes que no hayan hecho pagos y 
el nombre de sus representantes junto con la ciudad de la oficina 
a la que pertenece el representante.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante, oficina.ciudad AS Ciudad_oficina
from cliente JOIN empleado AS Representante
    ON cliente.codigo_empleado_rep_ventas = Representante.codigo_empleado
LEFT JOIN pago 
    ON cliente.codigo_cliente = pago.codigo_cliente,
empleado NATURAL JOIN oficina
WHERE pago.id_transaccion is NULL;

/*6.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*/
select oficina.linea_direccion1, oficina.linea_direccion2, cliente.nombre_cliente
from cliente JOIN empleado AS Representante
    on cliente.codigo_empleado_rep_ventas = Representante.codigo_empleado,
empleado NATURAL JOIN oficina
WHERE cliente.region = 'Fuenlabrada'
GROUP BY oficina.codigo_oficina;

/*7.Devuelve el nombre de los clientes 
y el nombre de sus representantes junto 
con la ciudad de la oficina a la que pertenece el representante.*/
select cliente.nombre_cliente AS Cliente, empleado.nombre AS Nombre_Representante, oficina.ciudad AS Ciudad_oficina
from cliente JOIN empleado AS Representante
    ON cliente.codigo_empleado_rep_ventas = Representante.codigo_empleado,
empleado NATURAL JOIN oficina;

/*8.Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.*/
select empleado.nombre AS Nombre_empleado, jefe.nombre AS Jefe
from empleado INNER JOIN empleado as jefe
    on empleado.codigo_jefe = jefe.codigo_empleado;

/*9.Devuelve un listado que muestre el nombre de cada empleados, 
el nombre de su jefe y el nombre del jefe de sus jefe.*/
select empleado.nombre AS Nombre_empleado, jefe.nombre AS Jefe, jefesupremo.nombre AS Jefe_Supremo
from empleado JOIN empleado as jefe
    on empleado.codigo_jefe = jefe.codigo_empleado
INNER JOIN empleado AS jefesupremo
    ON jefe.codigo_jefe = jefesupremo.codigo_empleado;

/*10.Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.*/
select 

/*11.Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.*/

