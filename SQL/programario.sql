CREATE DATABASE programario;

USE programario;

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
    `dni` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `edad` int NOT NULL,
    PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `comercio`;
CREATE TABLE IF NOT EXISTS `comercio` (
    `cif` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `ciudad` int NOT NULL,
    PRIMARY KEY (`cif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `desarrolla`;
CREATE TABLE IF NOT EXISTS `desarrolla` (
    `id_fab` int NOT NULL,
    `codigo` int NOT NULL,
    KEY (`id_fab`),
    KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `distribuye`;
CREATE TABLE IF NOT EXISTS `distribuye` (
    `cif` int NOT NULL,
    `codigo` int NOT NULL,
    `cantidad` int NOT NULL,
    KEY (`cif`),
    KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE IF NOT EXISTS `fabricante` (
    `id_fab` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `pais` varchar(30) NOT NULL,
    PRIMARY KEY (`id_fab`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `programa`;
CREATE TABLE IF NOT EXISTS `programa` (
    `codigo` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `version` varchar(50) NULL,
    PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `registra`;
CREATE TABLE IF NOT EXISTS `registra` (
    `cif` int NOT NULL,
    `dni` int NOT NULL,
    `codigo` int NOT NULL,
    `medio` varchar(20) NOT NULL,
    KEY (`cif`),
    KEY (`dni`),
    KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `desarrolla`ADD CONSTRAINT `desarrollaTOfabricanteFK` FOREIGN KEY (`id_fab`) REFERENCES `fabricante` (`id_fab`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `desarrollaTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `distribuye`
ADD CONSTRAINT `distribuyeTOcomercioFK` FOREIGN KEY (`cif`) REFERENCES `comercio` (`cif`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `distribuyeTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `registra`
ADD CONSTRAINT `registraTOclienteFK` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `registraTOcomercioFK` FOREIGN KEY (`cif`) REFERENCES `comercio` (`cif`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `registraTOprogramaFK` FOREIGN KEY (`codigo`) REFERENCES `programa` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO fabricante VALUES (1,'Oracle','Estados Unidos');
INSERT INTO fabricante VALUES (2,'Microsoft','Estados Unidos');
INSERT INTO fabricante VALUES (3,'IBM','Estados Unidos');
INSERT INTO fabricante VALUES (4,'Dinamic','España');
INSERT INTO fabricante VALUES (5,'Borland','Estados Unidos');
INSERT INTO fabricante VALUES (6,'Symantec','Estados Unidos');

INSERT INTO programa VALUES (1,'Application Server','9i');
INSERT INTO programa VALUES (2,'Oracle Database','8i');
INSERT INTO programa VALUES (3,'Database','9i');
INSERT INTO programa VALUES (4,'Database','10g');
INSERT INTO programa VALUES (5,'Developer','6i');
INSERT INTO programa VALUES (6,'Access','97');
INSERT INTO programa VALUES (7,'Access','2000');
INSERT INTO programa VALUES (8,'Access','XP');
INSERT INTO programa VALUES (9,'Windows','98');
INSERT INTO programa VALUES (10,'Windows','XP Professional');
INSERT INTO programa VALUES (11,'Windows','XP Home Edition');
INSERT INTO programa VALUES (12,'Windows','2003 Server');
INSERT INTO programa VALUES (13,'Norton Internet Security','2004');
INSERT INTO programa VALUES (14,'Freddy Hardest',NULL);
INSERT INTO programa VALUES (15,'Paradox','2');
INSERT INTO programa VALUES (16,'C++ Builder','5.5');
INSERT INTO programa VALUES (17,'DB/2','2.0');
INSERT INTO programa VALUES (18,'OS/2','1.0');
INSERT INTO programa VALUES (19,'JBuilder','X');
INSERT INTO programa VALUES (20,'La prisión','1.0');

INSERT INTO comercio VALUES (1,'El Corte Inglés','Sevilla');
INSERT INTO comercio VALUES (2,'El Corte Inglés','Madrid');
INSERT INTO comercio VALUES (3,'Jump','Valencia');
INSERT INTO comercio VALUES (4,'Centro Mail','Sevilla');
INSERT INTO comercio VALUES (5,'FNAC','Barcelona');

INSERT INTO cliente VALUES (1,'Pepe Pérez',45);
INSERT INTO cliente VALUES (2,'Juan González',45);
INSERT INTO cliente VALUES (3,'María Gómez',33);
INSERT INTO cliente VALUES (4,'Javier Casado',18);
INSERT INTO cliente VALUES (5,'Nuria Sánchez',29);
INSERT INTO cliente VALUES (6,'Antonio Navarro',58);

INSERT INTO desarrolla VALUES (1,1);
INSERT INTO desarrolla VALUES (1,2);
INSERT INTO desarrolla VALUES (1,3);
INSERT INTO desarrolla VALUES (1,4);
INSERT INTO desarrolla VALUES (1,5);
INSERT INTO desarrolla VALUES (2,6);
INSERT INTO desarrolla VALUES (2,7);
INSERT INTO desarrolla VALUES (2,8);
INSERT INTO desarrolla VALUES (2,9);
INSERT INTO desarrolla VALUES (2,10);
INSERT INTO desarrolla VALUES (2,11);
INSERT INTO desarrolla VALUES (2,12);
INSERT INTO desarrolla VALUES (6,13);
INSERT INTO desarrolla VALUES (4,14);
INSERT INTO desarrolla VALUES (5,15);
INSERT INTO desarrolla VALUES (5,16);
INSERT INTO desarrolla VALUES (3,17);
INSERT INTO desarrolla VALUES (3,18);
INSERT INTO desarrolla VALUES (5,19);
INSERT INTO desarrolla VALUES (4,20);

INSERT INTO distribuye VALUES (1,1,10);
INSERT INTO distribuye VALUES (1,2,11);
INSERT INTO distribuye VALUES (1,6,5);
INSERT INTO distribuye VALUES (1,7,3);
INSERT INTO distribuye VALUES (1,10,5);
INSERT INTO distribuye VALUES (1,13,7);
INSERT INTO distribuye VALUES (2,1,6);
INSERT INTO distribuye VALUES (2,2,6);
INSERT INTO distribuye VALUES (2,6,4);
INSERT INTO distribuye VALUES (2,7,7);
INSERT INTO distribuye VALUES (3,10,8);
INSERT INTO distribuye VALUES (3,13,5);
INSERT INTO distribuye VALUES (4,14,3);
INSERT INTO distribuye VALUES (4,20,6);
INSERT INTO distribuye VALUES (5,15,8);
INSERT INTO distribuye VALUES (5,16,2);
INSERT INTO distribuye VALUES (5,17,3);
INSERT INTO distribuye VALUES (5,19,6);
INSERT INTO distribuye VALUES (5,8,8);

INSERT INTO registra VALUES (1,1,1,'Internet');
INSERT INTO registra VALUES (1,3,4,'Tarjeta postal');
INSERT INTO registra VALUES (4,2,10,'Teléfono');
INSERT INTO registra VALUES (4,1,10,'Tarjeta postal');
INSERT INTO registra VALUES (5,2,12,'Internet');
INSERT INTO registra VALUES (2,4,15,'Internet');


-- 1) Averigua el DNI de todos los clientes.

SELECT dni
FROM cliente;

-- 2) Consulta todos los datos de todos los programas.

SELECT *
FROM programa;

-- 3) Obtén un listado con los nombres de todos los programas.

SELECT nombre
FROM programa;

-- 4) Genera una lista con todos los comercios.

SELECT *
FROM comercio;

-- 5) Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza DISTINCT).

SELECT DISTINCT ciudad
FROM distribuye
GROUP BY ciudad;

-- 6) Obtén una lista con los nombres de programas, sin que aparezcan valores duplicados (utiliza DISTINCT).

SELECT DISTINCT nombre
FROM programa
GROUP BY nombre;

-- 7) Obtén el DNI más 4 de todos los clientes.

SELECT dni + 4 AS "dni+4", nombre
FROM cliente;

-- 8) Haz un listado con los códigos de los programas multiplicados por 7.

SELECT codigo * 7
FROM programa;

-- 9) ¿Cuáles son los programas cuyo código es inferior o igual a 10?

SELECT *
FROM programa
WHERE codigo <= 10;

-- 10) ¿Cuál es el programa cuyo código es 11?

SELECT *
FROM programa
WHERE codigo = 11;

-- 11) ¿Qué fabricantes son de Estados Unidos?

SELECT *
FROM fabricante
WHERE pais LIKE "Estados Unidos";

-- 12) ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.

SELECT *
FROM fabricante
WHERE pais NOT IN("España");

-- 13) Obtén un listado con los códigos de las distintas versiones de Windows.

SELECT codigo, nombre, version
FROM programa
WHERE nombre LIKE "Windows";

-- 14) ¿En qué ciudades comercializa programas El Corte Inglés?

SELECT DISTINCT ciudad
FROM comercio
WHERE nombre LIKE "El Corte Inglés";

-- 15) ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN.

SELECT *
FROM comercio
WHERE nombre NOT IN("El Corte Inglés");

-- 16) Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador IN.

SELECT codigo
FROM programa
WHERE nombre IN("Windows", "Access");

-- 17) Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN y otra sin BETWEEN.

SELECT nombre
FROM cliente
WHERE edad BETWEEN 10 AND 25 OR edad > 50;

-- 18) Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.

SELECT DISTINCT nombre
FROM comercio
WHERE ciudad IN("SEVILLA", "MADRID");

-- 19) ¿Qué clientes terminan su nombre en la letra “o”?

SELECT *
FROM cliente
WHERE nombre LIKE "%o%";

-- 20) ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?

SELECT *
FROM cliente
WHERE nombre LIKE "%o%" AND edad > 30;

-- 21) Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W.

SELECT *
FROM programa
WHERE version LIKE "%I" OR nombre LIKE "A%" OR nombre LIKE "w%"

-- 22) Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.

SELECT *
FROM programa
WHERE version LIKE "%I" OR nombre LIKE "A%S";

-- 23) Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A.

SELECT *
FROM programa
WHERE version LIKE "%I" AND nombre NOT LIKE "A%"

-- 24) Obtén una lista de empresas por orden alfabético ascendente.

SELECT *
FROM empresa
ORDER BY nombre ASC;

-- 25) Genera un listado de empresas por orden alfabético descendente.

SELECT *
FROM empresa
ORDER BY nombre DESC;

-- 26) Obtén un listado de programas por orden de versión

SELECT *
FROM programa
ORDER BY version ASC;

-- 27) Genera un listado de los programas que desarrolla Oracle.

SELECT *
FROM programa
WHERE codigo IN(SELECT codigo
                FROM desarrolla
                WHERE id_fab = (SELECT id_fab 
                                FROM fabricante
                                WHERE nombre LIKE "Oracle"));



-- 28) ¿Qué comercios distribuyen Windows?

SELECT nombre
FROM comercio
WHERE cif IN(SELECT cif
            FROM distribuye
            WHERE codigo IN(SELECT codigo 
                            FROM programa
                            WHERE nombre LIKE "Windows"));



-- 29) Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.

SELECT * 
FROM programa
WHERE codigo IN(SELECT codigo
                FROM distribuye
                WHERE cif = (SELECT cif
                            FROM comercio
                            WHERE nombre LIKE "EL CORTE INGLES" AND ciudad LIKE "Madrid"));

-- 30) ¿Qué fabricante ha desarrollado Freddy Hardest?

SELECT *
FROM fabricante
WHERE id_fab = (SELECT id_fab
                FROM desarrolla 
                WHERE codigo =  (SELECT codigo
                                FROM programa
                                WHERE nombre LIKE "Freddy Hardest"));

-- 31) Selecciona el nombre de los programas que se registran por Internet.

SELECT nombre
FROM programa
WHERE codigo IN(SELECT codigo
                FROM registra
                WHERE medio LIKE "Internet");

-- 32) Selecciona el nombre de las personas que se registran por Internet.

SELECT nombre
FROM cliente
WHERE dni IN(SELECT dni
                FROM registra
                WHERE medio LIKE "Internet");

-- 33) ¿Qué medios ha utilizado para registrarse Pepe Pérez?

SELECT *
FROM registra
WHERE dni = (SELECT dni
            FROM cliente
            WHERE nombre LIKE "PEPE PEREZ");

-- 34) ¿Qué usuarios han optado por Internet como medio de registro?

SELECT nombre
FROM cliente
WHERE dni IN(SELECT dni
                FROM registra
                WHERE medio LIKE "Internet");

-- 35) ¿Qué programas han recibido registros por tarjeta postal?

SELECT *
FROM programa
WHERE codigo IN(SELECT codigo
                FROM registra
                WHERE medio LIKE "TARJETA POSTAL");

-- 36) ¿En qué localidades se han vendido productos que se han registrado por Internet?

SELECT DISTINCT c.ciudad
FROM comercio c
INNER JOIN distribuye d ON c.cif = d.cif
INNER JOIN registra r ON c.cif = r.cif
WHERE r.medio = 'Internet';
SELECT DISTINCT ciudad
FROM comercio
WHERE cif IN(SELECT cif
            FROM registra
            WHERE medio LIKE "INTERNET");

PONEMOS DISTINCT PUES, AUNQUE NO HAYA DOS COMERCIOS DE UNA MISMA CIUDAD QUE VENDA PRODUCTOS REGISTRADOS POR INTERNET, PODRÍA HABERLOS.

-- 37) Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.

SELECT p.nombre programa, c.nombre cliente
FROM cliente c
INNER JOIN registra r ON c.dni = r.dni
INNER JOIN programa p ON r.codigo = p.codigo
WHERE r.medio = 'Internet';

NO SE PUEDE HACER SIN JOINS, PUES CON SUBCONSULTAS, SOLO PODRÍAMOS MOSTRAR LA INFORMACIÓN DE LA TABLA DE LA CONSULTA PRINCIPAL.

-- 38) Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

SELECT c.nombre cliente, p.nombre programa, medio, o.nombre comercio
FROM registra r
INNER JOIN cliente c ON r.dni = c.dni
INNER JOIN comercio o ON r.cif = o.cif
INNER JOIN programa p ON r.codigo = p.codigo;
NO SE PUEDE HACER SIN JOINS, PUES CON SUBCONSULTAS, SOLO PODRÍAMOS MOSTRAR LA INFORMACIÓN DE LA TABLA DE LA CONSULTA PRINCIPAL.

-- 39) Obtén el nombre de los usuarios que han registrado el programa "Paradox" en su versión "2".

SELECT DISTINCT c.ciudad
FROM comercio c
INNER JOIN distribuye d ON c.cif = d.cif
INNER JOIN programa p ON d.codigo = p.codigo
INNER JOIN desarrolla e ON p.codigo = e.codigo 
INNER JOIN fabricante f ON e.id_fab = f.id_fab
WHERE f.nombre = 'Oracle';
SELECT DISTINCT ciudad
FROM comercio
WHERE cif IN(SELECT cif
            FROM distribuye
            WHERE codigo IN(SELECT codigo
                            FROM programa
                            WHERE codigo IN(SELECT codigo
                                            FROM desarrolla
                                            WHERE id_fab = (SELECT id_fab
                                                            FROM fabricante
                                                            WHERE nombre LIKE "ORACLE"))));

-- 40) Nombre de aquellos fabricantes cuyo país es el mismo que 'Oracle'. (Subconsulta).

SELECT c.nombre cliente
FROM cliente c
INNER JOIN registra r ON c.dni = r.dni
INNER JOIN programa p ON r.codigo = p.codigo
WHERE p.nombre = 'Paradox'
AND p.version = '2';


SELECT nombre
FROM cliente
WHERE dni IN(SELECT dni 
            FROM registra
            WHERE codigo = (SELECT codigo 
                            FROM programa
                            WHERE nombre LIKE "PARADOX" AND version = 2));

-- 41) Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta).

SELECT nombre
FROM fabricante
WHERE pais =(SELECT pais
            FROM fabricante
            WHERE nombre = 'Oracle');

-- 42) Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio 'Centro Mail'. (Subconsulta).

SELECT *
FROM cliente
WHERE edad =(SELECT edad
            FROM cliente
            WHERE nombre = 'Pepe Pérez');

-- 43) Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente 'Pepe Pérez'. (Subconsulta).

SELECT *
FROM comercio
WHERE ciudad IN (SELECT ciudad
                FROM comercio
                WHERE nombre = 'Centro Mail');

-- 44) Obtener el número de programas que hay en la tabla programas.

SELECT cliente.nombre
FROM cliente, registra
WHERE cliente.dni = registra.dni AND medio IN(SELECT medio
            FROM registra, cliente
            WHERE registra.dni = cliente.dni AND cliente.nombre = 'Pepe Pérez');

SELECT c.nombre
FROM cliente c 
INNER JOIN registra r ON c.dni = r.dni
WHERE r.medio IN(SELECT medio 
                FROM cliente c2 
                INNER JOIN registra r2 ON c2.dni = r2.dni
                WHERE c2.nombre = 'Pepe Pérez');

SELECT nombre
FROM cliente
WHERE nombre NOT LIKE "PEPE PEREZ" AND dni IN(SELECT dni
                                            FROM registra
                                            WHERE medio IN (SELECT medio
                                                            FROM registra
                                                            WHERE dni = (SELECT dni
                                                                        FROM cliente
                                                                        WHERE nombre LIKE "PEPE PEREZ")));

-- 45) Calcula el número de clientes cuya edad es mayor de 40 años.

SELECT COUNT(*) cuenta
FROM programa;

-- 46)  Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.

SELECT COUNT(*)
FROM cliente
WHERE edad > 40;

-- 47) Calcula la media de programas que se venden cuyo código es 7.

SELECT SUM(d.cantidad)
FROM comercio c
INNER JOIN distribuye d ON c.cif = d.cif
WHERE c.cif = 1;

-- 48) Calcula la mínima cantidad de programas de código 7 que se ha vendido

SELECT AVG(cantidad)
FROM distribuye
WHERE codigo = 7;

-- 49)  Calcula la máxima cantidad de programas de código 7 que se ha vendido.

SELECT MIN(cantidad)
FROM distribuye
WHERE codigo = 7;

-- 50) ¿En cuántos establecimientos se vende el programa cuyo código es 7?

SELECT MAX(cantidad)
FROM distribuye
WHERE codigo = 7;

-- 51) ¿En cuántos establecimientos se vende el programa cuyo código es 7?

SELECT COUNT(*) AS numeroEstablecimientos
FROM distribuye
WHERE codigo = 7;

-- 52) Calcular el número de registros que se han realizado por Internet.

SELECT COUNT(*)
FROM registra
WHERE medio = 'Internet';

-- 53) Obtener el número total de programas que se han vendido en 'Sevilla'.

SELECT COUNT(*)
FROM distribuye 
WHERE ciudad LIKE 'Sevilla';

-- 54) Calcular el número total de programas que han desarrollado los fabricantes cuyo país es 'Estados Unidos'.

SELECT COUNT(*)
FROM fabricante f
INNER JOIN desarrolla d ON f.id_fab = d.id_fab
WHERE f.pais = 'Estados Unidos';

SELECT COUNT(*) AS "NUMERO DE PROGRAMAS DESARROLLADOS EN EEUU"
FROM desarrolla
WHERE codigo IN (SELECT id_fab
                FROM fabricante
                WHERE pais LIKE "ESTADOS UNIDOS");

-- 55) Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la cadena nombre. (USAR UPPER() Y LENGTH())

SELECT UPPER(nombre) cliente, LENGTH(nombre) AS largo
FROM cliente;

-- 56) Con una consulta concatena los campos nombre y versión de la tabla programa. (USAR CONCAT())

SELECT CONCAT(nombre, ' ', version) AS programa
FROM programa;



