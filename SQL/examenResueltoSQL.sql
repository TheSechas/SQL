-- 1.	Crea la base de datos que corresponde a la imagen superior (inserta el diagrama del diseñador de tu phpMyAdmin). --

/* 2.	Inserta la información proporcionada (si da problemas, copiar los inserts abriendo el documento “.sql” en el Visual Studio)
(Inserta una imagen de cada resultado del SELECT * de cada tabla).*/

-- 3.	Muestra las películas que tengan una duración superior a 130 minutos y género “Superhéroes” (0.75 puntos). --
SELECT *
FROM peliculas
WHERE duracion > 130 AND genero LIKE "SUPERHEROES";

/* 4.	Muestra las películas que tengan una duración superior a 120 minutos y género “Fantasía” ó que cumpla que el título contenga una uve “v”
 y sea del género “Biopic” (1 punto).*/
 SELECT *
 FROM peliculas
 WHERE (duracion > 120 AND genero LIKE "FANTASIA") OR (titulo LIKE "%V%" AND genero LIKE "BIOPIC"); 
/* 5.	Muestra los centros comerciales pertenecientes a la comunidad autónoma de Andalucía (Almería, Granada, Málaga, Jaén, Córdoba, Sevilla, Cádiz y Huelva)
 y que proyecten alguna función a las 20 horas. (1.5 puntos).*/
 SELECT *
 FROM centroscomerciales
 WHERE localidad IN ("ALMERIA","GRANADA", "MALAGA", "JAEN", "CORDOBA", "SEVILLA", "CADIZ","HUELVA") AND id_centroComercial IN (SELECT id_centroComercial
																																FROM cines
																																WHERE id_cine IN ( SELECT id_cine
																																					FROM funciones
																																					WHERE HOUR(hora) = 20));

-- 6.	¿Cuántas películas hay de “Animación” que superen los 90 minutos? haz que la columna resultado ponga “Número de películas de animación” (1 punto) --
SELECT COUNT(*) AS "Número de películas de animación"
FROM peliculas
WHERE genero LIKE "ANIMACION" AND duracion > 90;

-- 7.	Muestra la película de mayor duración. (1 punto). --
SELECT *
FROM peliculas
WHERE duracion = (SELECT MAX(duracion)
					FROM peliculas);

-- 8.	Muestra la información de los centros comerciales donde se proyecten más de 2 películas después de Marzo de 2024 (1 punto). --
SELECT *
FROM centroscomerciales
WHERE id_cine IN (SELECT id_cine
					FROM cines
                    WHERE id_cine IN (SELECT id_cine
										FROM funciones
										WHERE MONTH(fecha) > 3 AND YEAR(fecha) >= 2024
										GROUP BY id_cine
										HAVING COUNT(*) > 2));


-- 9.	Muestra cuantas veces se ha proyectado cada película, contando solamente las proyecciones que sean posteriores al día 15 de cada mes. (1 punto). --
SELECT COUNT(*) AS "NUMERO DE VECES PROYECTADA", id_pelicula
FROM funciones
WHERE DAY(fecha) > 15
GROUP BY id_pelicula;

-- 10.	Muestra la información del centro comercial cuyo cine tenga el mayor aforo (tiene que funcionar siempre, en caso de insertar un cine de aforo 1500). (1 punto). --
SELECT *
FROM centroscomerciales
WHERE id_centrocomercial IN (SELECT id_centroComercial
							FROM cines
							WHERE aforo = (SELECT MAX(aforo)
											FROM cines));


-- 11.	Actualiza el título de la película con id 3 por el de “SiCopioMeEngañoYSoyBobo” y haz que tenga una duración de 1 minuto en una única consulta. (1 punto). --
UPDATE peliculas
SET titulo = "SiCopioMeEngañoYSoyBobo",
duracion = 1
WHERE id = 3;

/* 12.	Calcula la media de la duración de las películas en una columna y en otra muestra la duración máxima y en otra la duración mínima, la media debe mostrar 
un redondeo a la baja de una única décima de aproximación. (0.75 puntos) */
SELECT ROUND(AVG(duracion),1), MAX(duracion), MIN(duracion)
FROM peliculas

-- ROUND(columna)      6,7 => > ,5 => 7  // permite aproximacion de decimales ROUND(columna, numeroDecimales)--  
-- FLOOR(columna)      6,7 => > ,5 => 6  --

/*Hay centros comerciales que estarán abiertos o cerrados al público, en cada centro comercial habrá un cine almacenado en la tabla cines. 
En los cines se proyectarán películas en distintas funciones, obviamente en un cine, podrán proyectarse varias películas y una películas, 
podrá ser proyectada en varios cines. Es un dato a tener en cuenta que una película puede ser reproducida en un cine más de una vez en funciones 
distintas a lo largo del tiempo.*/

