1.	Inserta la prisión “Isla del diablo” en la Guayana Francesa con 650m y
 seguridad máxima.
INSERT INTO prisiones (nombre, dimensiones, seguridad) VALUES
("ISLA DEL DIABLO", 650, "MAXIMA");

2.	Inserta los valores en la columna “edad” de los asesinos según aparezca en Google.
UPDATE asesinos
SET edad = 78
WHERE id = 1

UPDATE asesinos
SET edad = 50   
WHERE id = 2

UPDATE asesinos
SET edad = 140
WHERE id = 3

UPDATE asesinos
SET edad = 51
WHERE id = 4

UPDATE asesinos
SET edad = 55
WHERE id = 5

UPDATE asesinos
SET edad = 23
WHERE id = 6

3.	Añade la columna fecha en la tabla víctimas.

ALTER TABLE victimas
ADD COLUMN fecha DATE;

4.	Inserta una víctima llamada Manuel Rico López 38 años. 
¿Se puede hacer esto? En caso de que pueda hacerse, 
¿qué información aportaría este dato al estudio del criminólogo?

INSERT INTO victimas (nombre, edad) VALUES 
("MANUEL RICO", 38)

Podría hacerse sin problema, podríamos estar describiendo, por ejemplo,
que hay una víctima de asesinato sin haber encontrado a su asesino.

5.	¿Cuántos asesinos hubo en Teixeiro?

SELECT COUNT(*) AS "NUMERO DE ASESINOS QUE HUBO EN TEIXEIRO"
FROM traslados
WHERE idPrision = (SELECT id
                    FROM prisiones
                    WHERE nombre LIKE "TEIXEIRO")

SELECT COUNT(DISTINCT idAsesino) AS "NUMERO DE ASESINOS QUE PASARON POR TEIXEIRO"
FROM traslados
WHERE idPrision = (SELECT id
                    FROM prisiones
                    WHERE nombre LIKE "TEIXEIRO")

6.	¿Cuántos asesinos hay en la prisión que menos asesinos alberga a lo 
largo de nuestro registro?
SELECT COUNT(DISTINCT idAsesino) AS numeroAsesinos, idPrision
FROM traslados
GROUP BY idPrision
HAVING numeroAsesinos <= ALL (SELECT COUNT(DISTINCT idAsesino)
                                FROM traslados
                                GROUP BY idPrision)


7.	¿Cuántos asesinos hay en prisiones con más de 650 metros cuadrados 
en nuestro registro?

SELECT COUNT(DISTINCT idAsesino) AS "NUMERO DE ASESINOS"
FROM traslados 
WHERE idAsesino IN (SELECT id
                    FROM prisiones
                    WHERE dimensiones > 650)

8.	¿Cuál es la media de edad de las víctimas de “El demonio con vestido”?
SELECT AVG(edad) AS "EDAD MEDIA VICTIMAS DEL DEMONIO CON VESTIDO"
FROM victimas
WHERE id IN (SELECT idVictima
            FROM crimenes
            WHERE idAsesino  = (SELECT id
                                FROM asesinos
                                WHERE apodo LIKE "EL DEMONIO CON VESTIDO"))


9.	¿Quién asesinó a Heitor? (descubridlo y le damos un premio)
SELECT *
FROM asesinos
WHERE id IN (SELECT idAsesino
            FROM crimenes 
            WHERE idVictima = (SELECT id
                                FROM victimas
                                WHERE nombre LIKE "HEITOR"))

10.	¿Qué encarcelado como asesino es inocente? (aún no sabréis hacerla, creo ;) 

SELECT *
FROM asesinos 
WHERE id NOT IN (SELECT idAsesino
                FROM crimenes)

11.	¿Qué asesino tiene más víctimas en su expediente?

SELECT *
FROM asesinos
WHERE id IN (SELECT idAsesino
            FROM crimenes
            GROUP BY idAsesino
            HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                                    FROM crimenes
                                    GROUP BY idAsesino))

12.	¿Qué asesinos acaban con sus víctimas usando veneno?

SELECT id
FROM asesinos
WHERE idModus = (SELECT id
                FROM modusOperandi
                WHERE modus LIKE "VENENO")

13.	¿Qué asesino/s femenino/s es/son lo/s que menos víctimas tiene/n?

SELECT *
FROM asesinos
WHERE id IN (SELECT  idAsesino
                FROM crimenes
                WHERE idAsesino IN (SELECT id
                                    FROM asesinos
                                    WHERE sexo LIKE "f")
                GROUP BY idAsesino
                HAVING COUNT(*) <= ALL (SELECT COUNT(*)
                                        FROM crimenes
                                        WHERE idAsesino IN (SELECT id
                                                            FROM asesinos
                                                            WHERE sexo LIKE "f")
                                        GROUP BY idAsesino));
14.	Tras pasar por la puerta de San Pedro, Adrián González cansó a este pobre 
hombrecillo que lo mandó directo al infierno para no aguantarlo, Satanás, tras 
torturarlo con incesante placer acabó cogiendo baja por depresión tras escuchar 
todos los lamentos de Adrián, entre cielo e infierno acordaron hacerlo inmortal
 por lo que tendremos que actualizar los valores de la base de datos 
 (la frase anterior es trampa), borrando a Adrián González de lista de víctimas.
 -- habria que hacer un DELETE con una subconsulta, NO OS VA A DEJAR --

DELETE 
FROM victimas
WHERE id = ( SELECT id
                FROM victimas
                WHERE nombre LIKE "ADRIAN" AND apellidos LIKE "GONZALEZ")


15.	Actualizar la tabla víctimas para que aquellas víctimas que tengan como 
penúltima letra del nombre una “a”, cuyo campo apellidos acaba en “o” y tenga 21 
años se llamen “Cristiano” y se apelliden “Ronaldo”.

UPDATE victimas
SET nombre = "CRISTIANO",
apellidos = "RONALDO"
WHERE nombre LIKE "%A_" AND apellidos LIKE "%o" AND edad = 21

16.	Muestra los datos de las víctimas de asesinos encarcelados en Robben Island.
SELECT *
FROM victimas
WHERE id IN (SELECT idVictima
            FROM crimenes
            WHERE idAsesino IN (SELECT idAsesino
                                FROM traslados
                                WHERE idPrision = (SELECT id
                                                    FROM prisiones
                                                    WHERE nombre LIKE "ROBBEN ISLAND")) )


17.	Muestra un listado de las víctimas por empezando por las más recientes 
y acabando por las que lleven más tiempo fallecidas.
SELECT *
FROM victimas
ORDER BY fecha DESC;






