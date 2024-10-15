USE tenisbd;

-- TABLA PARTICIPACIONES --

-- ¿Cuantas participaciones tiene cada tenista? --
SELECT idTenista, COUNT(*) AS "NUMERO DE PARTICIPACIONES EN DISTINTAS EDICIONES DE TORNEO"
FROM participaciones
GROUP BY idTenista;

--SOLUCIÓN--
 -- idTenista 	NUMERO DE PARTICIPACIONES EN DISTINTAS EDICIONES DE TORNEO 
 --   1 	                                           24
 --   2 	                                            4
 --   3 	                                           20
 --   5 	                                            2

SELECT COUNT(idTenista)
FROM participaciones
GROUP BY idTenista;

--SOLUCIÓN--
 -- COUNT(idTenista) 	
--           24
--            4
--           20
--           24


USE zoobdasir;
--¿Cunatos cuidadores tuvo cada animal?--
SELECT COUNT(DISTINCT(idcuidador)), idanimal
FROM animalescuidadores
GROUP BY idanimal;

--¿Cuantos animales fuero cuidados cada día?--
SELECT fecha, COUNT(DISTINCT(idanimal))
FROM animalescuidadores
GROUP BY fecha;


/*
GROUP BY columna => agrupar por los valores iguales de esa columna

CON UN GROUP BY columna, de forma NECESARIA, en el SELECT, tan solo podremos usar la columna por la que agrupamos
acompañada de otras columna SIEMPRE QUE SE VEAN AFECTADAS POR UNA FUNCIÓN DE AGRUPAMIENTO

3 USOS DE COUNT:
- COUNT(*) => contará el número de registros de cada agrupación
- COUNT(columna) => contará el número de valores NO NULOS para esa agrupación
- COUNT(DISTINCT(columna)) => contará el número de valores NO NULOS para esa agrupación SIN CONTAR VALORES REPETIDOS
*/

--1. Calcula cuántas veces aparece cada tenista en la tabla participaciones --
SELECT idTenista, COUNT(*) AS "NUMERO DE PARTICIPACIONES" 
FROM participaciones
GROUP BY idTenista;

--2. Calcula cuántos torneos jugó cada tenista (si 1 tenista jugó 2 ediciones del mismo torneo, contará como 2 la cuenta)--
SELECT idTenista, COUNT(*) AS "NUMERO DE PARTICIPACIONES" 
FROM participaciones
GROUP BY idTenista;

SELECT idTenista, COUNT(idGrandSlam) AS "NUMERO DE PARTICIPACIONES" 
FROM participaciones
GROUP BY idTenista;

--2B Calcula cuántos torneos jugó cada tenista (si 1 tenista jugó 2 ediciones del mismo torneo, contará solo como 1). --
SELECT idTenista, COUNT(DISTINCT(idGrandSlam)) AS "PARTICIPACIONES EN GRAND SLAMS"
FROM participaciones
GROUP BY idTenista;

--3. Calcula cuántos tenistas jugaron cada torneo --
SELECT idGrandSlam, COUNT(DISTINCT(idTenista)) AS "NUMERO DE TENISTAS"
FROM participaciones
GROUP BY idGrandSlam;

--4. Calcula cuántos participantes distintos tuvo cada torneo --
SELECT idGrandSlam, COUNT(DISTINCT(idTenista)) AS "NUMERO DE TENISTAS QUE PARTICIPARON"
FROM participaciones 
GROUP BY idGrandSlam;

--5. Calcula cuántas veces fue campeón cada tenista --
SELECT idTenista, COUNT(*) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;

-- como hemos filtrado con WHERE campeon = 1, en la columna campeon NO puede haber valores NULL, por lo que también estaría bien hacer: --
SELECT idTenista, COUNT(campeon) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;

--6. Calcula cuántas veces fue campeón cada tenista en 2020 --
SELECT idTenista, COUNT(campeon) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1 AND edicion = 2020
GROUP BY idTenista;



-- ¿Cuántos perros de cada sexo hay en total actualmente en el centro?

SELECT COUNT(*), sexo, especie
FROM mascotas
WHERE estado LIKE "A" AND especie LIKE "P"
GROUP BY sexo, especie;

-- ¿Cuántos ejemplares contiene cada jaula o ubicación?

SELECT COUNT(*), ubicacion
FROM mascotas
GROUP BY ubicacion;

-- ¿Cuántos ejemplares de cada especie, y dentro de cada especie, de cada sexo, hay actualmente en el centro? 
-- (En este ejercicio tendremos que agrupar por dos niveles de la misma manera que con ORDER BY podíamos
-- ordenador los registros según los valores de sus campos por niveles).

SELECT COUNT(*), sexo, especie
FROM mascotas
GROUP BY sexo, especie;

-- ¿Cuántos perros y gatos han pasado por el centro y han sido dados de baja?

SELECT COUNT(*), estado, especie
FROM mascotas
WHERE estado LIKE "B"
GROUP BY estado, especie

-- ¿Cuántos perros macho hay en el centro agrupados por ubicación?

SELECT COUNT(*), sexo, especie, ubicacion
FROM mascotas
WHERE especie LIKE "P" AND estado LIKE "A" AND sexo LIKE "M"
GROUP BY sexo, especie, ubicacion;

-- Construir una consulta que nos devuelva qué especies distintas hay en cada ubicación.

SELECT COUNT(*), especie, ubicacion
FROM mascotas
GROUP BY especie, ubicacion;

-- ¿Cuántos ejemplares habrá dados de alta en las ubicaciones E02 y E03?

SELECT COUNT(*), ubicacion
FROM mascotas
WHERE estado LIKE "A" AND ubicacion IN ("E02", "E03")
GROUP BY ubicacion;

-- ¿Qué ubicaciones del centro de veterinaria tienen tan solo un ejemplar?

SELECT COUNT(*), ubicacion
FROM mascotas
WHERE ubicacion = "E03"
GROUP BY ubicacion;

-- Devuelve aquellas ubicaciones que tengan entre 2 y 3 animales.

SELECT COUNT(*), ubicacion
FROM mascotas
WHERE ubicacion IN ("2", "3")
GROUP BY ubicacion;

-- ¿Qué ubicaciones del centro tiene más de 2 ejemplares?

SELECT COUNT(*), ubicacion
FROM mascotas
WHERE ubicacion > 2
GROUP BY ubicacion;
