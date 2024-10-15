

-- ENTREGA TAREA


-- 1 - Muestra el nombre de los actores y de los directores que hayan participado en "Fight Club"



-- 2 - Muestra el nombre de los actores que hayan participado en la película "Fight Club"

SELECT nombre
FROM actores
WHERE id IN (SELECT id_actor
            FROM actores_peliculas
            WHERE id_pelicula = 1);

-- 3 - Muestra el nombre de los directores que hayan dirigido películas en las que actuaron 2 o más actores.

SELECT director
FROM peliculas
WHERE id IN (SELECT id_actor
            FROM actores_peliculas
            WHERE id_pelicula IN(SELECT id_pelicula
                                FROM actores_peliculas
                                HAVING COUNT(id_pelicula) >= 2));

-- 4 - Muestra los actores que nacieron en los meses de junio, julio, agosto, septiembre, noviembre o diciembre.

SELECT nombre, fecha_nacimiento
FROM actores
WHERE MONTH(fecha_nacimiento) IN (6, 7, 8, 9, 10, 11, 12);
