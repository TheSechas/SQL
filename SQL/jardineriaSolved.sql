-- CONSULTAS 1 TABLA --

/*8.	Devuelve un listado con el código de cliente de aquellos clientes que
 realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar 
 aquellos códigos de cliente que aparezcan repetidos. 
 Resuelva la consulta:*/
 
 SELECT DISTINCT codigo_cliente
 FROM pago
 WHERE YEAR(fecha_pago)=2008;
 
 SELECT DISTINCT codigo_cliente
 FROM pago
 WHERE DATE_FORMAT(fecha_pago, "%Y")=2008;
 
 /*9.	Devuelve un listado con el código de pedido, código de cliente, 
 fecha esperada y fecha de entrega de los pedidos que no han sido 
 entregados a tiempo.*/
 SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
 FROM pedido
 WHERE fecha_entrega > fecha_esperada;
 
/* 10.	Devuelve un listado con el código de pedido, código de cliente, 
 fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega 
 ha sido al menos dos días antes de la fecha esperada.
●	Utilizando la función ADDDATE de MySQL.
●	Utilizando la función DATEDIFF de MySQL.*/
SELECT *
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

SELECT *
FROM pedido
WHERE DATEDIFF(fecha_esperada,fecha_entrega) >= 2;

-- CONSULTAS RESUMEN --
-- 1.	¿Cuántos empleados hay en la compañía? --
SELECT COUNT(*) AS "NUMERO EMPLEADOS DE LA COMPAÑIA"
FROM empleado;

-- 2.	¿Cuántos clientes tiene cada país? --
SELECT COUNT(*) AS "NUMERO CLIENTES DE CADA PAIS", pais
FROM cliente
GROUP BY pais;

-- 3.	¿Cuál fue el pago medio en 2009? --
SELECT AVG(total) AS "PAGO MEDIO DEL 2009"
FROM pago
WHERE YEAR(fecha_pago)=2009;

-- 4.	¿Cuántos pedidos hay en cada estado? --
-- Ordena el resultado de forma descendente por el número de pedidos. --
SELECT COUNT(*) AS "PEDIDOS EN CADA ESTADO", estado
FROM pedido
GROUP BY estado
ORDER BY COUNT(*) DESC;

SELECT COUNT(*) AS numeroPedidosSegunEstado, estado
FROM pedido
GROUP BY estado
ORDER BY numeroPedidosSegunEstado DESC;

-- 5.	Calcula el precio de venta del producto más caro y más barato en una misma consulta. --
SELECT MAX(precio_venta) AS "MAS CARO", MIN(precio_venta) AS "MAS BARATO"
FROM producto;

-- 7.	¿Cuántos clientes tiene la ciudad de Madrid? --
SELECT COUNT(*) AS "NUMERO DE CLIENTES DE MADRID"
FROM cliente
WHERE ciudad LIKE "MADRID";

-- 8.	¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M? --
SELECT COUNT(*) AS "NUMERO DE CLIENTES POR CIUDAD", ciudad
FROM cliente
WHERE ciudad LIKE "M%"
GROUP BY ciudad;

-- 12.	Calcula el número de productos diferentes que hay en cada uno de los pedidos. --
SELECT COUNT(codigo_producto) AS "PRODUCTO DIFERENTE POR PEDIDO", codigo_pedido
FROM detalle_pedido
GROUP BY codigo_pedido;

-- 13.	Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos. --
SELECT codigo_pedido , SUM(cantidad) AS "UNIDADES DE PRODUCTOS POR PEDIDO"
FROM detalle_pedido
GROUP BY codigo_pedido;

-- 15.	La facturación que ha tenido la empresa en toda la historia, --
-- indicando la base imponible, el IVA y el total facturado. --
-- La base imponible se calcula sumando el coste del producto por el --
-- número de unidades vendidas de la tabla detalle_pedido. El IVA es el -- 
-- 21 % de la base imponible, y el total la suma de los dos campos anteriores. --
SELECT (precio_unidad * cantidad) AS "BASE IMPONIBLE", (precio_unidad * cantidad) * 0.21 AS "IVA", ((precio_unidad * cantidad) + (precio_unidad * cantidad) * 0.21) AS "TOTAL", codigo_pedido
FROM detalle_pedido;

-- 16.	La misma información que en la pregunta anterior, pero agrupada --
--  por código de producto. --
SELECT (precio_unidad * cantidad) AS "BASE IMPONIBLE", (precio_unidad * cantidad) * 0.21 AS "IVA", ((precio_unidad * cantidad) + (precio_unidad * cantidad) * 0.21) AS "TOTAL", codigo_producto
FROM detalle_pedido
GROUP BY codigo_producto;

-- 17.	La misma información que en la pregunta anterior, pero agrupada por --
-- código de producto filtrada por los códigos que empiecen por OR. --
SELECT (precio_unidad * cantidad) AS "BASE IMPONIBLE", (precio_unidad * cantidad) * 0.21 AS "IVA", ((precio_unidad * cantidad) + (precio_unidad * cantidad) * 0.21) AS "TOTAL", codigo_producto
FROM detalle_pedido
WHERE codigo_producto LIKE "OR%"
GROUP BY codigo_producto;

-- 18.	Lista las ventas totales de los productos que hayan facturado más de 3000 euros --
-- Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA). --
SELECT SUM(cantidad) AS UNIDADESVENDIDAS,(SUM(cantidad) * precio_unidad) AS FACTURADO,(SUM(cantidad) * precio_unidad) + ((SUM(cantidad) * precio_unidad) * 0.21) AS IMPUESTOS,codigo_producto
FROM detalle_pedido
GROUP BY codigo_producto
HAVING IMPUESTOS > 3000;
-- Sin JOIN no podemos mostrar el nombre --

-- 1.4.8 Subconsultas --
-- 1.4.8.1 Con operadores básicos de comparación --

-- 1.	Devuelve el nombre del cliente con mayor límite de crédito. --
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito)
						FROM cliente);
                        
-- 2.	Devuelve el nombre del producto que tenga el precio de venta más caro. --
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta)
						FROM producto);
                        
-- 3.	Devuelve el nombre del producto del que -- 
-- se han vendido más unidades. (Tenga en cuenta que tendrá que calcular --
-- cuál es el número total de unidades que se han vendido de cada producto --
-- a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es--
-- el código del producto, puede obtener su nombre fácilmente.)--
SELECT SUM(cantidad), codigo_producto
FROM detalle_pedido
GROUP BY codigo_producto
HAVING SUM(cantidad) >= ALL (SELECT SUM(cantidad)
								FROM detalle_pedido
								GROUP BY codigo_producto
								);
                                
-- 5.	Devuelve el producto que más unidades tiene en stock. --
SELECT *
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock)
							FROM producto);
                            
-- 7.	Devuelve el nombre, los apellidos y el email de los empleados --
-- que están a cargo de Alberto Soria. --
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe = (SELECT codigo_empleado
						FROM empleado
						WHERE nombre LIKE "ALBERTO" AND apellido1 LIKE "SORIA");
                        
-- 1.4.8.2 Subconsultas con ALL y ANY --

-- 8.	Devuelve el nombre del cliente con mayor límite de crédito. --
-- la forma más sencilla sería usar una subconsulta pero nos piden usar ALL o ANY --
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito)
						FROM cliente);
                        
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito
								FROM cliente);
					
                        
-- 9.	Devuelve el nombre del producto que tenga el precio de venta más caro. --
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta
							FROM producto);
-- 10.	Devuelve el producto que menos unidades tiene en stock. --

SELECT *
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock
								FROM producto);
                                
-- 1.4.8.3 Subconsultas con IN y NOT IN --

-- 11.	Devuelve el nombre, apellido1 y cargo de los empleados que no representen a --
-- ningún cliente. --
SELECT nombre, apellido1, puesto
FROM empleado
WHERE codigo_empleado NOT IN (SELECT DISTINCT codigo_empleado_rep_ventas
								FROM cliente);

-- 12.	Devuelve un listado que muestre solamente los clientes que no han realizado ningún --
-- pago. --
SELECT *
FROM cliente
WHERE codigo_cliente NOT IN (SELECT DISTINCT codigo_cliente
								FROM pago);
-- 13.	Devuelve un listado que muestre solamente los clientes que sí han realizado ningún --
-- pago. --
SELECT *
FROM cliente
WHERE codigo_cliente IN (SELECT DISTINCT codigo_cliente
						FROM pago);
                        
-- 14.	Devuelve un listado de los productos que nunca han aparecido en un pedido. --
SELECT *
FROM producto 
WHERE codigo_producto NOT IN (SELECT codigo_producto
						FROM detalle_pedido);
-- 15.	Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos --
-- empleados que no sean representante de ventas de ningún cliente.--
SELECT nombre, apellido1, puesto, telefono
FROM empleado INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE codigo_empleado NOT IN (SELECT DISTINCT codigo_empleado_rep_ventas
								FROM cliente);
                                
-- 1.4.8.4 Subconsultas con EXISTS y NOT EXISTS --

-- 16.	Devuelve un listado que muestre solamente los clientes que no han realizado ningún --
-- pago. --
SELECT codigo_cliente
FROM cliente
WHERE NOT EXISTS (SELECT codigo_cliente
				  FROM pago 
                  WHERE cliente.codigo_cliente = pago.codigo_cliente);
                  
-- 17.	Devuelve un listado que muestre solamente los clientes que sí han realizado ningún --
-- pago. --
SELECT codigo_cliente
FROM cliente
WHERE EXISTS (SELECT codigo_cliente
				  FROM pago 
                  WHERE cliente.codigo_cliente = pago.codigo_cliente);
                  
-- 18.	Devuelve un listado de los productos que nunca han aparecido en un pedido. --

SELECT codigo_producto
FROM producto
WHERE NOT EXISTS (SELECT codigo_producto
					FROM detalle_pedido
                    WHERE producto.codigo_producto = detalle_pedido.codigo_producto);
                    
-- 19.	Devuelve un listado de los productos que han aparecido en un pedido alguna vez.--
SELECT codigo_producto
FROM producto
WHERE EXISTS (SELECT codigo_producto
					FROM detalle_pedido
                    WHERE producto.codigo_producto = detalle_pedido.codigo_producto);
                    
-- JOINS  COMPOSICION INTERNA --

-- 1.	Obtén un listado con el nombre de cada cliente y el nombre y apellido --
-- de su representante de ventas. --

SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2
FROM cliente INNER JOIN empleado
	ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;


-- 2.	Muestra el nombre de los clientes que hayan realizado pagos junto --
-- con el nombre de sus representantes de ventas. --

SELECT c.nombre_cliente,e.nombre,e.apellido1,e.apellido2
FROM cliente AS c INNER JOIN pago AS p 
	ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN empleado AS e
    ON c.codigo_empleado_rep_ventas = e.codigo_empleado;
    
-- 3.	Muestra el nombre de los clientes que no hayan realizado pagos --
-- junto con el nombre de sus representantes de ventas. --
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c LEFT JOIN pago AS p
	ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN empleado AS e 
    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE p.codigo_cliente IS NULL;

SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2
FROM pago RIGHT JOIN cliente
	ON pago.codigo_cliente = cliente.codigo_cliente
    INNER JOIN empleado
    ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE pago.codigo_cliente IS NULL;

-- 4.	Devuelve el nombre de los clientes que han hecho pagos y --
-- el nombre de sus representantes junto con la ciudad de la oficina --
-- a la que pertenece el representante. --
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c INNER JOIN pago AS p
	ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN empleado AS e
    ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN oficina AS o
    ON e.codigo_oficina = o.codigo_oficina;

-- 5.	Devuelve el nombre de los clientes que no hayan hecho pagos --
-- y el nombre de sus representantes junto con la ciudad de la oficina --
-- a la que pertenece el representante. --
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c LEFT JOIN pago AS p
	ON c.codigo_cliente=p.codigo_cliente
	INNER JOIN empleado AS e
    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    INNER JOIN oficina AS o
    ON e.codigo_oficina = o.codigo_oficina
WHERE p.codigo_cliente IS NULL;
-- 6.	Lista la dirección de las oficinas que tengan clientes en Fuenlabrada. --

SELECT oficina.linea_direccion1, oficina.linea_direccion2
FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
	INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.ciudad LIKE "FUENLABRADA";

-- 7.	Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante. --
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2, oficina.ciudad
FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
	INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;


-- 8.	Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes. --

SELECT jefe.nombre AS "NOMBRE DE JEFE", empleado.nombre AS "NOMBRE DE EMPLEADO"
FROM empleado AS jefe INNER JOIN empleado 
	ON jefe.codigo_empleado = empleado.codigo_jefe;
-- 9.	Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido. --

SELECT cliente.nombre_cliente
FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE fecha_entrega > fecha_esperada;

-- 10.	Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente. --
SELECT DISTINCT producto.gama
FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto;

-- 1.4.6 Consultas multitabla (Composición externa) --
-- 1.	Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago. --
SELECT *
FROM cliente LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

SELECT *
FROM pago RIGHT JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

-- 2.	Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido. --
SELECT *
FROM cliente LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;


SELECT *
FROM cliente RIGHT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;

-- 3.	Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido. --


SELECT *
FROM pago RIGHT JOIN cliente ON pago.codigo_cliente = cliente.codigo_cliente
	LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_cliente IS NULL;

SELECT *
FROM cliente LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
	LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_cliente IS NULL;

-- 4.	Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada. --
SELECT *
FROM empleado LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_oficina IS NULL;

-- 5.	Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado. --
SELECT *
FROM empleado LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.codigo_empleado_rep_ventas IS NULL;

SELECT *
FROM cliente RIGHT JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.codigo_empleado_rep_ventas IS NULL;

-- 6.	Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado. --

SELECT *
FROM cliente RIGHT JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventas IS NULL AND oficina.codigo_oficina IS NULL;

SELECT *
FROM empleado LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventas IS NULL AND oficina.codigo_oficina IS NULL;

-- 7.	Devuelve un listado de los productos que nunca han aparecido en un pedido. --

-- Con hacer un LEFT entre producto y detalle_pedido sería suficiente --
SELECT *
FROM producto LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL;

SELECT *
FROM producto LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
LEFT JOIN pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
WHERE detalle_pedido.codigo_producto IS NULL;

-- 8.	Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes --
-- de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales. --
SELECT *
FROM oficina LEFT JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE empleado.codigo_empleado NOT IN (SELECT cliente.codigo_empleado_rep_ventas
										FROM cliente INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
														INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
														INNER JOIN detalle_pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
														INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
                                                        WHERE producto.gama LIKE "FRUTALES" AND cliente.codigo_empleado_rep_venta IS NOT NULL);
                                                      
                                                        
                

-- 9.	Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago. --

SELECT DISTINCT cliente.*, pago.*
FROM cliente INNER JOIN pedido USING (codigo_cliente)
			LEFT JOIN pago USING (codigo_cliente)
WHERE pago.codigo_cliente IS NULL;

-- 10.	Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado. --
SELECT e1.nombre 'Nombre Jefe', e2.nombre 'Nombre Empleado'
FROM empleado AS e1
INNER JOIN empleado AS e2 ON e1.codigo_empleado = e2.codigo_jefe
LEFT JOIN cliente ON e1.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.codigo_cliente IS NULL;


