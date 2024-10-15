-- conectar con el servidor de bases de datos--
mysql -u root -p -- donde "-u" es user y "-p" es password -- 

-- VER BASES DE DATOS --
SHOW DATABASES; 
-- CREAR BASE DE DATOS --
-- CREATE DATABASE nombreBaseDeDatos --
CREATE DATABASE aviones;
-- SELECCIONAR BASE DE DATOS --
-- USE nombreBaseDeDatos --
USE aviones;
-- CREAR TABLA --
/*
CREATE TABLE nombreTabla (
    nombreColumna1 tipoDeDato [opcional(por ejemplo si es clave primaria o si acepta valores nulos)],
    nombreColumna2 tipoDeDato [opcional],
    .... ,
    nombreColumnaN tipoDeDato [opcional]

);
*/
CREATE TABLE aviones (
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(25) NOT NULL,
    fechaCreacion INT(4) NULL,
    asientos INT(3) NULL
);
-- VER TABLAS CREADAS DE LA BASE DE DATOS --
SHOW TABLES;
-- VER ESTRUCTURA (es decir, cómo está creada) DE LA TABLA --
-- DESCRIBE nombreTabla --
DESCRIBE aviones;

-- CREAMOS OTRA TABLA --
CREATE TABLE pilotos (
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    apellido1 VARCHAR(55) NOT NULL,
    apellido2 VARCHAR(55) NULL,
    telefono INT(13) NULL,
    email VARCHAR(255) NOT NULL
);

-- ACTUALIZAR ALGUNA ESTRUCTURA DE UNA TABLA --
-- ALTER TABLE--
-- Añadir una columna a la tabla --
ALTER TABLE pilotos
ADD COLUMN tipoPiloto BOOLEAN NOT NULL;

-- Eliminar una columna de la tabla --
ALTER TABLE pilotos
DROP COLUMN tipoPiloto;

-- Modificar una columna USANDO MODIFY --
ALTER TABLE pilotos
MODIFY COLUMN telefono INT(13) NOT NULL;

-- Modificar una columna USANDO CHANGE --

-- Renombrar una columna --
ALTER TABLE pilotos
RENAME COLUMN telefono TO tlfno

-- INSERTAR DATOS EN UNA TABLA --
-- INSERT INTO nombreTabla (columna1, columna2, ..., columnaN) --
-- VALUES (valor1, valor2, ..., valorN); --
/*
VARCHAR -> USO DE COMILLAS, VALEN "" Y ''
INT -> NUMEROS SIN COMILLAS , SOLO ALCANZA HASTA 11 DIGITOS, a partir de ahi hay que usar BIGINT
NULL -> NULL SIN COMILLAS
TYNIINT -> SOLO ACEPTA 1 Y 0 (FUNCIONA COMO BOOLEAN, 1 PARA TRUE Y 0 PARA FALSE)
*/
INSERT INTO pilotos (nombre, apellido1, apellido2, tlfno, email)
    VALUES ("Alberto", "Silva", NULL, 0034697765453, "albertito@gmail.com");


-- VER LOS DATOS INTRDUCIDOS DE UNA TABLA --
-- SELECT * --
-- FROM nombreTabla --
-- WHERE condicionACumplir --
SELECT *
FROM pilotos;

/*COMO PODEMOS APRECIAR, EL TELEFONO NO SE PUEDE GUARDAR BIEN A PESAR DE ESTAR
CONFIGURADO CON UNA LONGITUD DE 13 DIGITOS, ESTO OCURRE PORQUE EL TIPO DE DATO
INT TAN SOLO ALCANZA VALORES PARA EL INTERVALO [-2147483648 a 2147483647], LA 
SOLUCIÓN SERÁ CAMBIAR EL TIPO DE DATO INT POR UN BIGINT*/
ALTER TABLE pilotos
MODIFY COLUMN tlfno BIGINT NOT NULL;

-- ACTUALIZAR DATOS--
--UPDATE nombreTabla --
--SET columna=valor --
--WHERE id=valor--
UPDATE pilotos
SET tlfno= 0034697765534
WHERE id = 1;

-- hacemos más INSERTS --
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Juan Manuel", "Pérez", "González", 0034565666765, "lococonalas@gmail.com");
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Marcos", "Caamaño", "Pérez", 0034676543223, "caamaño@hotmail.com");

-- INSERCIONES MÚLTIPLES --
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Pedro", "González", "García", 0034678787765, "losgarcia@gmail.com"),
           ("Jesús", "Nazaret", NULL, 0034687765666, "HEAVENSdoor@gmail.com"),
           ("Mario", "Bros", NULL, 0034655436678, "fontaneriamario@nintendo.com");

-- BORRAR REGISTROS DE UNA TABLA --
-- DELETE 
-- FROM nombreTabla --
-- WHERE col=valor; --
DELETE 
FROM pilotos
WHERE id = 5;

INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Satán", "Lucifer", NULL, 0034657987666, "calentitoelinfierno@hotmail.com");


ALTER TABLE pilotos
MODIFY COLUMN id INT(3) PRIMARY KEY AUTO_INCREMENT; -- este cambio, por ser clave primaria, no funcionará, tendremos que omitir la parte de "PRIMARY KEY AUTO_INCREMENT" --

ALTER TABLE pilotos
MODIFY COLUMN id INT(3);

/* 1
    Crear una tabla aviones formada por las siguientes columnas:
    id INT(3) PK AI,
    nombre VARCHAR(25) NN,
    reaccion TINYINT(1) NN,
    combate TINYINT(1) NN,
    velocidadMaxima DECIMAL(5,2) NN;
*/

/* 2
    Inserta los siguientes aviones:
    BOEING 747 , 1, 0, 777.20
    F 55, 1, 1, 999.99
    EURO FIGHTER, 1, 1, 999.99
    Avion de papel, 0, 0 , 1.00
    AIRBUS 333, 1, 0, 566.77
*/

/* 3
    BORRAR EL AVION DE PAPEL
*/

/* 4 
    AÑADIR UNA COLUMNA A LA TABLA QUE SEA coste DECIMAL (10,2) NN
    MUESTRA LOS DATOS DE LA TABLA, ¿QUÉ PASÓ CON LA COLUMNA QUE ACABAMOS DE CREAR?
*/

/* 5
    borra la columna velocidadMaxima
*/


-- USANDO LA BBDD asir23bd --

-- CONSULTAS DE SELECCION 1 TABLA--

----------------------------------
-------------SELECT---------------
----------------------------------

SELECT * -- con el asterisco indicamos que queremos todas las columnas de la tabla --
FROM nombreTabla
WHERE filtrosAaplicar -- los filtros son normalmente nombreColumna operador valor --

SELECT *
FROM alumnos
WHERE id >= 1; -- "id" es nombreColumna. ">=" es el operador. "1" es el valor

-- Podemos seleccionar en el SELECT qué columnas queremos ver o incluso mostrar columnas --
-- calculadas por nosotros --
-- Vamos a ver un ejemplo para ver solamente el id del alumno, su edad y calcularemos su año de nacimiento --
SELECT id, edad, (2023 - edad)
FROM alumnos;

-- Como vemos, la tercera columna de la consulta anterior no deja del todo claro qué datos muestra--
-- En estos casos podemos poner "ALIAS" a las columnas con la palabra reservada "AS" --
SELECT id, edad, (2023 - edad) AS "fecha de nacimiento"
FROM alumnos;

-- Los alias se los podemos aplicar a cualquier columna --
SELECT id AS "numero de alumno", edad, (2023 - edad) AS "fecha de nacimiento"
FROM alumnos;

----------------------------------
-------------WHERE----------------
----------------------------------

/*
En el WHERE como vimos antes, se podrán realizar filtrados de información. 
Para cada filtro hay que seguir la estructura "columna" "operador" "valor"--
Hay dos tipos de operadores:
    - Aritméticos. = , <, >, >=, <=, distinto de (2 formas) != ó <>
    - Reservados. IN , LIKE , NOT, BETWEEN

También encontraremos palabras lógicas para concatenar los filtros del WHERE.
*/

-- Queremos ver los alumnos de edad 20 años --
SELECT *
FROM alumnos
WHERE edad = 20;
-- Queremos ver los alumnos que NO tengan 20 años --
SELECT *
FROM alumnos
WHERE edad != 20;

SELECT *
FROM alumnos
WHERE edad <> 20;

-- Queremos ver los alumnos que NO tengan 20 años y que a su vez, tengan como colegio el Liceo La Paz --
SELECT *
FROM alumnos
WHERE edad != 20 AND centro LIKE "Liceo La Paz" ;

-- Queremos ver los alumnos que NO tengan 20 años y que a su vez,NO tengan como colegio el Liceo La Paz --

SELECT *
FROM alumnos
WHERE edad != 20 AND centro NOT LIKE "Liceo La Paz" ;

-- Queremos ver los alumnos con edades comprendidas entre 19 y 25 años, que tengan como apellido1 O apellido2 "FERNANDEZ" --
SELECT *
FROM alumnos
WHERE edad BETWEEN 19 AND 25 AND (apellido1 LIKE "FERNÁNDEZ" OR apellido2 LIKE "FERNÁNDEZ");

-- Si no ponemos los paréntesis, estaríamos evaluando realmente, si los alumnos tienen entre 19 y 25 años y apellido1 fernández, --
-- ó que tengan como segundo apellido fernandez, sin importar su edad --

-- Para relacionar tablas utilizamos FK--
/*
 Las FK (claves foraneas) eran columnas (claves) pertenecientes a una tabla 
 siendo PK (claves primarias) en otra tabla distinta.
*/

-- trabajando con la base de datos asir23bd --
-- profesores -> centros --
-- 1º paso: ¿Cardinalidad? => 1 profesor pertenece a 1 centro, 1 centro tiene N profesores --
/*
    PARA LAS RELACIONES DE CARDINALIDAD 1:N, TENDREMOS QUE CREAR UNA COLUMNA.
    ESTA COLUMNA SERÁ LA FK DE LA RELACIÓN. 
    HAY QUE PENSAR EN CUÁL DE LAS 2 TABLAS TENEMOS QUE CREARLA
    SE CREARÁ LA COLUMNA EN LA TABLA CON CARDINALIDAD MÁXIMA 1 (un profesor puede pertenecer
     como máximo a 1 centro => creamos la columna en la tabla profesores).
*/

-- 2º paso: escribir los comandos --
ALTER TABLE profesores
ADD COLUMN idCentro INT(2) NOT NULL,
ADD CONSTRAINT profesoresToCentrosFK FOREIGN KEY(idCentro) REFERENCES profesores(id);
--Lo que quiere decir la línea 21, literalmente es: --
-- + ADD CONSTRANINT profesoresToCentrosFK => AÑADE UNA RESTRICCIÓN DE NOMBRE profesoresToCentrosFK --
-- + FOREIGN KEY(idCentro) => ESTABLECER QUE LA COLUMNA DE LA TABLA PROFESORES idCentro es CLAVE FORANEA --
-- + REFERENECES profesores(id) => APUNTA A LA TABLA PROFESORES, EN CONCRETO, A SU COLUMNA id QUE ES PK --


/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`asir23bd`.`#sql-3518_4d2`, CONSTRAINT `profesoresToCentrosFK` FOREIGN KEY (`idCentro`) 
REFERENCES `profesores` (`id`))

ESTO QUIERE DECIR QUE EN LA COLUMNA QUE ES FK ESTAMOS INTRODUCIENDO UN VALOR NO VÁLIDO.
LOS VALORES NO VÁLIDOS SON DE VARIOS TIPOS:
   + QUE NO SE CORRESPONDE EL TIPO DE DATO.
   + QUE ES NULL CUANDO LA FK NO ACEPTA NULOS.
   + QUE ES UN VALOR QUE NO CONTIENE LA COLUMNA DONDE ES CLAVE PRIMARIA. 
*/

-- Para relacionar tablas utilizamos FK--
/*
 Las FK (claves foraneas) eran columnas (claves) pertenecientes a una tabla 
 siendo PK (claves primarias) en otra tabla distinta.
*/

-- trabajando con la base de datos asir23bd --
-- profesores -> centros --
-- 1º paso: ¿Cardinalidad? => 1 profesor pertenece a 1 centro, 1 centro tiene N profesores --
/*
    PARA LAS RELACIONES DE CARDINALIDAD 1:N, TENDREMOS QUE CREAR UNA COLUMNA.
    ESTA COLUMNA SERÁ LA FK DE LA RELACIÓN. 
    HAY QUE PENSAR EN CUÁL DE LAS 2 TABLAS TENEMOS QUE CREARLA
    SE CREARÁ LA COLUMNA EN LA TABLA CON CARDINALIDAD MÁXIMA 1 (un profesor puede pertenecer
     como máximo a 1 centro => creamos la columna en la tabla profesores).
*/

-- 2º paso: escribir los comandos --
ALTER TABLE profesores
ADD COLUMN idCentro INT(2) NOT NULL,
ADD CONSTRAINT profesoresToCentrosFK FOREIGN KEY(idCentro) REFERENCES profesores(id);
--Lo que quiere decir la línea 21, literalmente es: --
-- + ADD CONSTRANINT profesoresToCentrosFK => AÑADE UNA RESTRICCIÓN DE NOMBRE profesoresToCentrosFK --
-- + FOREIGN KEY(idCentro) => ESTABLECER QUE LA COLUMNA DE LA TABLA PROFESORES idCentro es CLAVE FORANEA --
-- + REFERENECES profesores(id) => APUNTA A LA TABLA PROFESORES, EN CONCRETO, A SU COLUMNA id QUE ES PK --


/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`asir23bd`.`#sql-3518_4d2`, CONSTRAINT `profesoresToCentrosFK` FOREIGN KEY (`idCentro`) 
REFERENCES `profesores` (`id`))

ESTO QUIERE DECIR QUE EN LA COLUMNA QUE ES FK ESTAMOS INTRODUCIENDO UN VALOR NO VÁLIDO.
LOS VALORES NO VÁLIDOS SON DE VARIOS TIPOS:
   + QUE NO SE CORRESPONDE EL TIPO DE DATO.
   + QUE ES NULL CUANDO LA FK NO ACEPTA NULOS.
   + QUE ES UN VALOR QUE NO CONTIENE LA COLUMNA DONDE ES CLAVE PRIMARIA. 
*/

-- Entendemos que una asignatura puede ser impartida por varios profesores y que un profesor puede impartir varias asignaturas --
-- Por lo tanto, estaremos hablando de una relación N:M --
-- En caso de relaciones N:M creamos una tabla que contiene las FK de las tablas que une --

CREATE TABLE profesoresAsignaturas (
   idProfesor INT(2) NOT NULL,
   idAsignatura INT(2) NOT NULL,
   PRIMARY KEY (idProfesor, idAsignaturas)
);

-- El siguiente paso será definir las CONSTRAINT y las FOREIGN KEY --
ALTER TABLE profesoresAsignaturas
ADD CONSTRAINT idProfesorToProfesoresFK FOREIGN KEY(idProfesor) REFERENCES profesores(id), 
ADD CONSTRAINT idAsignaturasToProfesoresFK FOREIGN KEY(idAsignatura) REFERENCES asignaturas(id); 

-- INSERTAMOS LOS PROFESORES DE DAM --
INSERT INTO profesores (nombre, apellido1, apellido2, edad, correoelectronico, especialidad, idCentro)
VALUES ("Jesús", "Pérez", "Roca", 42, "jesusroca@gmail.com", "INFORMATICA",1 ),
("Eva", "Castro", "Pedreira", 40, "evacastro@gmail.com", "DERECHO",1);

-- INSERTAMOS LAS ASIGNATURAS DE DAM --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad)
VALUES("Programacion", "PROG", 90, "ALTA"),
("Entornos de Desarrollo", "ENTD", 76, "MEDIA"),
("Sistemas", "SIS", 80, "BAJA");
-- METEMOS FUNDAMENTOS HARDWARE --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad)
VALUES("Fundamentos Hardware", "FH", 66, "BAJA");
-- INSERTAMOS LA TABLA INTERMEDIA --
INSERT INTO profesoresAsignaturas (idProfesor, idAsignatura)
VALUES(1,1),
(2,7),
(3,4),
(4,5),
(4,11),
(5,12),
(5,10),
(6,3),
(9,9),
(9,4),
(10,3);

---------------------------------------------------------------------------------------

--- FUNCIONES AGRUPAMIENTO ---

---------------------------------------------------------------------------------------

-- FUNCIONES AGRUPAMIENTO => MAX(), MIN(), AVG(), COUNT()--
-- Por lo de ahora las usaremos en el SELECT y especificaremos sobre qué columna las vamos a usar --

-- MAX() => devuelve el valor más alto de que contiene la columna--
-- MIN() => devuelve el valor más bajo ... --
-- SUM() => suma los valores de una columna --
-- AVG() => devuelve la media de los datos de una columna --
-- COUNT() => según su uso, puede hacer varias cosas: --
    -- COUNT(*) => cuenta el número de filas de una tabla RESULTADO --
    -- COUNT(nombreColumna) => cuenta el número de valores NO NULOS --
    -- COUNT(DISTINCT()) => cuenta el número de valores NO repetidos --

-- Cuando utilizamos funciones, lo normal, es usar ALIAS para las columnas resultado --
-- Los alias los utilizamos con la palabra "AS" --
-- Si queremos usar algún espacio en blanco en un alias, tendremos que usar doble comilla --

-- Ejemplos trabajados sobre la base de datos alumnosdam23bd --
-- 1. Dime cuál es la edad más alta de los alumno. --
SELECT MAX(edad) AS "edad mayor"
FROM alumnos;

SELECT MAX(edad) AS edad_mayor
FROM alumnos;
-- 2. Dime cuál es el alumno con la edad más alta. --

-- Ojo con cometer error de mezclar funciones de agrupamiento con columnas normales --
SELECT MAX(edad), nombre, apellido1
FROM alumnos;
-- Esta consulta está mal, nos da un registro para la edad con valor 33 y completa con el primer alumno de la tabla--
SELECT *
FROM alumnos
WHERE edad = (SELECT MAX(edad)
            FROM alumnos
            );

--3. Dime cuál es la media de edad de los alumnos --
SELECT AVG(edad) AS "Media de edad de los alumnos"
FROM alumnos;

--4. Dime cuántos alumnos en la tabla alumnos --
SELECT COUNT(*) AS "NUMERO DE ALUMNOS"
FROM alumnos;

-- a veces se comete el error de contar registros usando alguna columna --
SELECT COUNT(id) 
FROM alumnos;

SELECT COUNT(apellido2)
FROM alumnos;
-- al usar la columna cuenta el número de valores NO NULOS de esa columna, si existe alguno, no lo contará dando un resultado erróneo --

-- 5. Muestra cuántos nombres tienen los alumnos --
SELECT COUNT(nombre) 
FROM alumnos;

-- 6. Muestra cuántos nombre DISTINTOS tienen los alumnos --
SELECT COUNT(DISTINCT(nombre)) AS "Numero de nombres distintos"
FROM alumnos;

--7 Dime el total de años que acumulan las edades de los alumnos --
SELECT SUM(edad) AS "AÑOS TOTALES DE LOS ALUMNOS"
FROM alumnos;


-- Hay más funciones que pueden sernos muy útiles, NO SON de agrupamiento --
-- LENGTH()=> devuelve el número de BYTES de una cadena --
-- CHAR_LENGTH() O CHARACTER_LENGTH=> devuelve el número de caracteres de una cadena --
-- DAY(), MONTH(), YEAR() => devuelven el dia,mes y año de una fecha --
-- CONCAT() => DEVUELVE los valores de distintas columnas concatenados --
-- CONCAT_WS() => lo mismo que el anterior, "WS" significa with separator, es decir, podemos incluir un separador entre valores--
-- LCASE() Y/o LOWER() => pasa una cadena a minúsculas
-- UCASE() y/o UPPER() => pasa una cadena a mayúsculas
-- FLOOR() => redondea decimal un número hacia abajo--
-- ROUND() => redondea un número decimal ,5 para abajo pasa a 0, y ,5 para arriba pasa a 1 --


    1. Muestra todos los alumnos con edades comprendidas entre 21 y 23 años.

SELECT*
FROM alumnos 
WHERE edad BETWEEN 21 AND 23;

    2. Muestra los alumnos más veteranos de la tabla.

SELECT*
FROM alumnos
WHERE edad = (SELECT MAX(edad) 
                FROM alumnos);

    3. Muestra los profesores más jóvenes de la tabla.

SELECT*
FROM profesores
WHERE edad (SELECT MIN(edad)
            FROM profesores);

    4. Muestra los alumnos que se apelliden “Vázquez” y su media de edad.

SELECT alumnos.*, AVG(edad) AS "MEDIA DE EDAD"
FROM alumnos 
WHERE apellido1 LIKE "Vazquez" OR apellido2 LIKE "Vazquez"

    5. Muestra los alumnos que tengan las asignaturas de “Programación” y “Bases de datos”.

SELECT*
FROM alumnosasignaturas
WHERE idasignatura IN (SELECT id 
                    FROM asignaturas
                    WHERE nombre IN ("PROGRAMACIÓN", "BASE DE DATOS"));

SELECT *
FROM alumnos
WHERE id IN (SELECT idAlumno
            FROM alumnosasignaturas)

    6. Muestra los centros públicos.

SELECT*
FROM alumnos
WHERE centro LIKE "PUBLICO";

    7. Muestra los alumnos que tengan más de 20 años pero que no tengan más de 25 años, 
    con alguna letra “e” en su nombre y que cumpla que sean de “A Coruña”, mostrando también a 
    los alumnos que simplemente tengan un email “Hotmail”.

SELECT *
FROM alumnos
WHERE edad (BETWEEN edad 20 LIKE 25 AND nombre LIKE "%E%" AND lugar LIKE "A CORUÑA") OR email LIKE %Hotmail%


    8. Muestra los alumnos cuyo apellido tenga más de 9 caracteres.

SELECT *
FROM alumnos
WHERE CHAR_LENGTH(apellido1) > 9 OR CHAR_LENGTH(apellido2) > 9;


    9. Muestra los profesores que impartan “Bases de datos”.

SELECT *
FROM 


    10. Muestra los alumnos que con menos de 28 años que estudien en un centro concertado y se llamen “Diego”.


SELECT *
FROM alumnos
WHERE
