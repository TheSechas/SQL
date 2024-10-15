1.	Muestra la información de los tenistas zurdos.
SELECT *
FROM tenistas
WHERE manoDominante = "ZURDO";

SELECT *
FROM tenistas
WHERE manoDominante LIKE "ZURDO";

2.	Muestra la información de los tenistas jubilados.

SELECT *
FROM tenistas
WHERE activo = 0;

3.	Muestra el nombre y el apellido de los tenistas diestros y activos.

SELECT nombre, apellido
FROM tenistas
WHERE activo = 1 AND manoDominante = "DIESTRO";

SELECT nombre, apellido
FROM tenistas
WHERE activo = 1 AND manoDominante LIKE "DIESTRO";

4.	Muestra el nombre y el apellido de los tenistas que NO tengan el apellido 2 nulo.

SELECT *
FROM tenistas
WHERE apellido2 IS NOT NULL;

5.	Muestra el nombre y el apellido de los tenistas que SI tengan el apellido 2 nulo.

SELECT *
FROM tenistas
WHERE apellido2 IS NULL;

6.	Muestra la información de los torneos que tengan más de 300 000 euros de premio.

SELECT *
FROM torneos
WHERE premio > 300000;

7.	Muestra la información de los torneos que tengan más de 300 000 euros de premio y se 
celebren en EEUU o la información de aquellos que tengan como premio entre 200 000 y 500 000, 
se celebren en Australia y tengan más de 100 participantes.

SELECT *
FROM torneos
WHERE (premio > 300000 AND pais LIKE "EEUU") OR 
(premio BETWEEN 200000 AND 500000 AND pais LIKE "AUSTRALIA" AND participantes > 100);

8.	Inserta un tenista que se llame Roger Mederer, siendo este zurdo, de nacionalidad austríaca, que esté jubilado y que tenga NIKE como patrocinador.
INSERT INTO tenistas (nombre,apellido1,manoDominante,activo,idPatrocinador) VALUES
("ROGER", "MEDERER", "ZURDO", 0, 1);

9.	Inserta un tenista de nombre María Sainz, diestra, española, jubilada y con REEBOK como patrocinador.
INSERT INTO tenistas (nombre, apellido1, manoDominante, activo, idPatrocinador) VALUES
("MARÍA", "SAINZ", "DIESTRO", 0, 2);

10.	Inserta un tenista que se llame Fulminado Pontes, siendo diestro, portugués, jubilado y que tenga REEBOK como patrocinador.
INSERT INTO tenista (nombre, apellido1, manoDominante, activo, idPatrocinador) VALUES
("FULMINADO", "PONTES", "DIESTRO", 0, 2);

11.	Elimina al tenista Fulminado Pontes UTILIZANDO SU ID.
DELETE FROM tenistas
WHERE id = 8;

12.	Actualiza el registro de María Sainz y hazla ambidiestra utilizando su id.

UPDATE tenistas
SET manoDominante = "AMBIDIESTRA"
WHERE id = 7;

-- LOS UPDATES PUEDEN SER MÚLTIPLES, CAMBIAR VALORES EN MÁS DE 1 COLUMNA--
-- IMAGINAR QUE QUEREMOS CAMBIAR AHORA A ZURDA, PONERLA EN ACTIVO, Y QUE SU PATROCINADOR SEA EL 4 --
UPDATE tenistas
SET manoDominante = "DIESTRA",
    activo = 1,
    idPatrocinador = 4
WHERE id = 7;

13.	Haz que la base de datos refleje que Joe Mcenroe ha ganado Roland Garros y Wimbledon en 1990.
INSERT INTO participaciones (idTenista, idTorneo, edicion, campeon) VALUES
(4, 1, 1990, 1),
(4, 3, 1990, 1);


FUNCIONES -- SE APLICAN EN EL SELECT O EN EL WHERE, EN AMBOS CASOS AFECTAN A UNA COLUMNA --
14.	Muestra la información de los tenistas cuyo nombre tiene más de 5 caracteres.
LENGTH(columna) => NÚMERO DE BYTES
CHAR_LENGTH(columna) => NÚMERO DE CARACTERES, LONGITUD DE UNA CADENA DE TEXTO
SELECT *
FROM tenistas
WHERE CHAR_LENGTH(nombre) > 5;

-- SI USAMOS LENGTH: --
SELECT *
FROM tenistas
WHERE LENGTH(nombre) > 5;
-- saldría María porque la "i" tiene un acento y cuenta un byte doble, la consulta estaría MAL --

15.	Muestra la información de los tenistas juntando los nombres y los apellidos
en UNA ÚNICA COLUMNA.

-- CONCAT() --
-- CONCAT_WS() en esta función el separador será el mismo para todas las columnas y se coloca como primer parámetro --
-- EL CONCAT_WS() SI que concatena valores NULL, CONCAT() NO LO HACE
CONCAT(columna1, columna2) => concatenar, concatenar significa juntar 2 o más valores pertenecientes a varias columna en UNA.
SELECT id, CONCAT(nombre, apellido1) AS nombreApellido1, apellido2, manoDominante, activo, idPatrocinador 
FROM tenistas

CONCAT_WS(separador, columna1, columna2)

-- PARA CONCATENAR 2 VALORES, PODEMOS CONFIGURAR CÓMO SE SEPARAN --
SELECT id, CONCAT(nombre," ",apellido1) AS nombreApellido1, apellido2, manoDominante, activo, idPatrocinador 
FROM `tenistas`;

SELECT id, CONCAT_WS(" ", nombre, apellido1) AS nombreApellido1, apellido2, manoDominante, activo, idPatrocinador 
FROM `tenistas`;

SELECT id, CONCAT(nombre," - ",apellido1) AS nombreApellido1, apellido2, manoDominante, activo, idPatrocinador 
FROM `tenistas`;

SELECT id, CONCAT(nombre," / ",apellido1) AS nombreApellido1, apellido2, manoDominante, activo, idPatrocinador 
FROM `tenistas`;

-- PARA CONCATENAR MÁS DE 2 VALORES, USAREMOS TANTOS SEPARADORES COMO SEAN NECESARIOS --
SELECT id, CONCAT(nombre, " : ", apellido1, " / ",apellido2) AS nombreApellidos, manoDominante, activo, idPatrocinador 
FROM `tenistas`;

/*
ES IMPORTANTE DARSE CUENTA CÓMO LA CONCATENACIÓN DE UN VALOR NULL DEVUELVE UN NULL si usamos CONCAT()
*/

16.	Muestra los nombres de los tenistas SIN REPETIR NINGÚN NOMBRE.
SELECT DISTINCT nombre
FROM tenistas
-- EL DISTINCT ES MUY ÚTIL TAMBIÉN COMBINÁNDOLO CON LA FUNCIÓN COUNT() --
-- Por ejemplo, si queremos ver cuántos nombre hay en la tabla tenistas: --
SELECT COUNT(nombre)
FROM tenistas;
-- Con esta consulta estaremos contando 2 veces el mismo nombre => ROGER --
-- Para no contarlo 2 veces => COUNT(DISTINCT columna) --
SELECT COUNT(DISTINCT nombre)
FROM tenistas;

--FECHAS--
-- Vamos a introducir una columna nueva en la tabla tenistas --
DAY() => PARA EXTRAER EL DÍA DE UNA FECHA
MONTH() => PARA EXTRAER EL mes
YEAR() => PARA EXTRAER EL AÑO
-- Mostrad la información de los tenistas que hayan nacido en la última semana del mes --
SELECT *
FROM tenistas
WHERE DAY(fechaNacimiento) > 24
-- Mostrad la información de los tenistas que hayan nacido en la primera semana del mes --
SELECT *
FROM tenistas
WHERE DAY(fechaNacimiento) <= 7 
-- Mostrad la información de los tenias que hayan nacido más tarde de la primera semana y antes de la última semana de cada mes --
SELECT *
FROM tenistas 
WHERE DAY(fechaNacimiento) BETWEEN 8 AND 24

-- Mostrad el nombre y el primer apellido EN UNA COLUMNA de los tenistas que hayan nacido después de Junio--
SELECT CONCAT(nombre," ",apellido1)
FROM tenistas
WHERE MONTH(fechaNacimiento) > 6;

SELECT CONCAT_WS(" ",nombre,apellido1)
FROM tenistas
WHERE MONTH(fechaNacimiento) > 6;

-- Mostrad el nombre el primer apellido EN UNA COLUMNA de los tenistas cuyo nombre sea mayor a 4 caracteres y hayan nacido antes del año 2000--
SELECT CONCAT(nombre," ",apellido1)
FROM tenistas
WHERE CHAR_LENGTH(nombre) > 4 AND YEAR(fechaNacimiento) < 2000

SELECT CONCAT_WS(" ",nombre,apellido1)
FROM tenistas
WHERE CHAR_LENGTH(nombre) > 4 AND YEAR(fechaNacimiento) < 2000

-- Mostrad el nombre el primer apellido EN UNA COLUMNA de los tenistas cuyo nombre y primer apellido sea mayor a 10 caracteres y hayan nacido antes del año 2000--
SELECT CONCAT_WS(" ",nombre,apellido1)
FROM tenistas
WHERE CHAR_LENGTH(CONCAT(nombre,apellido1)) > 10 AND YEAR(fechaNacimiento) < 2000

FUNCIONES DE AGRUPAMIENTO
17.	Muestra cuántos tenistas hay en la tabla.
SELECT COUNT(*) AS numeroTenistas
FROM tenistas;

SELECT  COUNT(*) AS "Numero de tenistas"
FROM tenistas;

18.	Muestra cuántos tenistas hay en la tabla y haz que la columna resultado ponga “Número de tenistas”.

SELECT  COUNT(*) AS "Numero de tenistas"
FROM tenistas;

19.	Muestra la suma total de los premios que ganaría un tenista si gana 4 grandslams en el mismo año.
SELECT SUM(premio) AS premioTotal
FROM torneos;


20.	Muestra la información del torneo con mayor premio.

SELECT *
FROM torneos
WHERE premio = (SELECT MAX(premio)
                FROM torneos)

21.	Muestra la información del torneo con menor premio.

SELECT *
FROM torneos
WHERE premio = (SELECT MIN(premio)
                FROM torneos)


22.	Muestra el dinero medio que se llevará un tenista en caso de ganar algún torneo.

SELECT AVG(premio) AS "PREMIO medio"
FROM torneos


GROUP BY 
23.	Muestra cuántos torneos ha ganado cada tenista (solo id de tenista).
-- esta consulta NO estaría bien, respondería a "numero de torneos que juega cada tenista", sin importar si quedó campeón o no--
SELECT COUNT(*) AS "NUMERO DE VECES CAMPEON" 
FROM participaciones
GROUP BY idTenista
-- el primer paso debería ser filtrar en la tabla física con un WHERE campeon = 1 --
SELECT COUNT(*) AS "NUMERO DE VECES CAMPEON", idTenista
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;
-- Imaginémonos que nos preguntan ahora, mostrar el id del tenista y cuántas veces quedó campeón, pero especificando EN CADA TORNEO --
SELECT COUNT(*) AS "NUMERO DE VECES CAMPEON", idTenista, idTorneo
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista,idTorneo
24.	Muestra cuántos torneos ha ganado cada tenista en activo (solo id de tenista).
-- primero, saber qué ids de tenistas están en activo, son el 2 y el 5--
-- segundo, filtrar por registros cuyo valor en campeon sea 1 y tengan un id de tenista 2 o 5--
-- tercero, agrupar por CADA tenista--
-- cuarto, contamos--
SELECT COUNT(*) AS "NUMERO DE VICTORIAS EN ACTIVO", idTenista
FROM participaciones
WHERE campeon = 1 AND idTenista IN (SELECT id
									FROM tenistas
									WHERE activo = 1)
GROUP BY idTenista
-- Si quisiéramos contar cuántas veces quedaron campeón en CADA torneo--
SELECT COUNT(*) AS "NUMERO DE VICTORIAS EN ACTIVO", idTenista, idTorneo
FROM participaciones
WHERE campeon = 1 AND idTenista IN (SELECT id
									FROM tenistas
									WHERE activo = 1)
GROUP BY idTenista, idTorneo

25.	Muestra cuántos ganadores tuvo cada torneo (solo id de torneo)
-- Vamos a entender que por ganadores, tienen que ser, ganadores DISTINTOS, es decir, RAFA NADAL con id = 1 ganó varias veces --
-- ROLAND GARROS con id = 1, deberemos contarlo como un ganador y no como 5 ganadores --
SELECT COUNT(DISTINCT idTenista) AS "GANADORES DEL TORNEO", idTorneo
FROM participaciones
WHERE campeon = 1
GROUP BY idTorneo;

SUBCONSULTA
26.	Muestra el nombre y el apellido de los tenistas que han ganado algún Roland Garros.
SELECT nombre, apellido1
FROM tenistas
WHERE idTenista IN (SELECT idTenistas
					FROM participaciones
					WHERE campeon = 1 AND idTorneo = (SELECT id
														FROM torneos
														WHERE nombre LIKE "ROLAND GARROS"))
27.	Muestra qué tenistas NO han ganado ningún torneo.
SELECT *
FROM tenistas 
WHERE id NOT IN (SELECT DISTINCT idTenista
					FROM participaciones
					WHERE campeon = 1);

-- HAVING --
-- Utilizamos el HAVING para filtrar datos que están en una columna afectada por una --
-- función de agrupación SIEMPRE que usamos GROUP BY --

-- Tabla física: es aquella tabla (y sus datos) que persisten en la base de datos. --
-- Tabla lógica: es aquella tabla (y sus datos) que aparecen en los pasos intermedios del cálculo de una consulta, ó resultado final de una consulta --

28. Mostar el id del tenista y el número de torneos ganados por cada tenista.
SELECT COUNT(*), idTenista
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;

29. Mostrar el id de los tenistas que hayan ganado más de 5 torneos.
SELECT COUNT(*), idTenista
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista
HAVING COUNT(*) > 5;
-- Tenéis que recordar que las funciones de agrupación sólo se pueden usar en el SELECT ó en el HAVING --
-- FILTRAMOS CON EL HAVING LAS COLUMNAS DE UNA TABLA LÓGICA DESPUÉS DE AGRUPAR --

30. Mostrar el id del tenista y cuántas veces quedó campeón, pero especificando EN CADA TORNEO --
SELECT COUNT(*) AS "NUMERO DE VECES CAMPEON", idTenista, idTorneo
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista,idTorneo

31. Mostrar el id del tenista y el id del torneo en el que un mismo tenista haya quedado campeón más de 3 veces.
SELECT COUNT(*) AS "NUMERO DE VECES CAMPEON", idTenista, idTorneo
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista,idTorneo
HAVING COUNT(*) > 3;

32. Mostrar el torneo que tiene necesariamente al menos, 3 ganadores distintos.
SELECT COUNT(DISTINCT idTenista) AS numeroGanadores, idTorneo
FROM participaciones
WHERE campeon = 1
GROUP BY idTorneo
HAVING numeroGanadores >= 3;

