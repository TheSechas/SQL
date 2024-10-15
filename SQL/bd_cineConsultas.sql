-- 1. Directores y actores con más películas (UNION)

SELECT actor AS nombre, COUNT(*) AS numeroPeliculas, "ACTOR" AS tipo
FROM actores_peliculas
GROUP BY actor_id
UNION
SELECT director, COUNT(*), "DIRECTOR"
FROM directores_peliculas
GROUP BY director_id
ORDER BY numeroPeliculas DESC, nombre ASC

-- 2. Películas que han sido producidas por Kathleen Kennedy. Incluir el director y ordenar por año de producción.

SELECT p.titulo, p.produccion, d.director
FROM peliculas p
INNER JOIN peliculas_productores pp ON p.id = pp.pelicula_id
INNER JOIN productores pd ON pp.productor_id = pd.id
INNER JOIN peliculas_directores pdi ON p.id = pdi.pelicula_id
INNER JOIN directores d ON pdi.director_id = d.id
WHERE pd.productor LIKE "Kathleen Kennedy"
ORDER BY p.produccion;

-- 3. Películas realizadas por cualquiera de los actores que trabajaron en "Forrest Gump"

SELECT p.titulo, ap.actor
FROM bd_cine.actores_peliculas ap
INNER JOIN peliculas p USING(id)
WHERE actor_id IN(SELECT actor_id
				FROM bd_cine.actores_peliculas
				INNER JOIN peliculas USING(id)
				WHERE titulo LIKE "FORREST GUMP")
ORDER BY p.titulo;

-- 4. Películas dirigidas por Billy Wilder donde hayan actuado Marilyn Monroe o Jack Lemmon

SELECT P.titulo, P.produccion, AP.actor
FROM bd_cine.actores_peliculas AP
INNER JOIN bd_cine.peliculas P ON P.id = AP.id
INNER JOIN bd_cine.directores_peliculas DP ON P.id = DP.id
WHERE director LIKE "Billy Wilder" AND actor IN("Marilyn Monroe", "Jack Lemmon")
ORDER BY titulo;

-- 5. Géneros de película preferidos del director John Ford

SELECT genero, COUNT(DISTINCT titulo) AS cuenta
FROM bd_cine.generos_peliculas gp
INNER JOIN peliculas_generos pg ON pg.genero_id = gp.genero_id
INNER JOIN peliculas p ON p.id = pg.pelicula_id
INNER JOIN directores_peliculas dp ON dp.id = p.id
WHERE director LIKE "John Ford"
GROUP BY genero
ORDER BY cuenta DESC;

-- 6. Películas de animación o dibujos animados ordenadas de más a menos reciente

SELECT titulo, produccion, genero
FROM bd_cine.generos_peliculas
INNER JOIN peliculas USING(id)
WHERE genero IN("DIBUJOS ANIMADOS", "ANIMACIÓN")
ORDER BY produccion DESC;

-- 7. Películas dónde actúan "Cary Grant" y "Ingrid Bergman"

SELECT DISTINCT p.titulo, p.produccion
FROM bd_cine.peliculas_actores pa
INNER JOIN actores_peliculas ap ON pa.actor_id = ap.actor_id
INNER JOIN peliculas p ON pa.pelicula_id = p.id
WHERE pa.actor_id IN(SELECT pa.actor_id
					FROM bd_cine.peliculas_actores pa
					INNER JOIN actores_peliculas ap ON pa.actor_id = ap.actor_id
					INNER JOIN peliculas p ON pa.pelicula_id = p.id
					WHERE actor IN("Cary Grant", "Ingrid Bergman"));

-- 8. Películas y actores del año 1982 (GROUP_CONCAT)

SELECT p.titulo, GROUP_CONCAT(a.actor) AS actores
FROM bd_cine.actores_peliculas ap
INNER JOIN peliculas p ON ap.id = p.id
INNER JOIN actores a ON a.id = ap.actor_id
WHERE p.produccion = 1982
GROUP BY p.titulo
ORDER BY p.titulo;

-- 9. Películas y actores de la década de los 90 con al menos 2 directores NO HACER (SUBCONSULTA EN SELECT)

-- Primero, crear una vista para obtener películas de los 90 con al menos dos directores
CREATE VIEW peliculas_con_dos_directores AS
SELECT pd.pelicula_id
FROM peliculas_directores pd
INNER JOIN peliculas p ON pd.pelicula_id = p.id
WHERE p.produccion BETWEEN 1990 AND 1999
GROUP BY pd.pelicula_id
HAVING COUNT(pd.director_id) >= 2;

-- Luego, obtener los actores y películas de la vista creada anteriormente
SELECT p.titulo,a.actor
FROM peliculas p
INNER JOIN peliculas_con_dos_directores pcd ON p.id = pcd.pelicula_id
INNER JOIN peliculas_actores pa ON p.id = pa.pelicula_id
INNER JOIN actores a ON pa.actor_id = a.id
ORDER BY p.titulo, a.actor;


-- 10. Películas del director que tenga más películas

SELECT p.titulo, d.director
FROM peliculas p
INNER JOIN peliculas_directores pd ON p.id = pd.pelicula_id
INNER JOIN directores d ON pd.director_id = d.id
WHERE pd.director_id = (SELECT director_id
						FROM (SELECT director_id, COUNT(*) AS num_peliculas
								FROM peliculas_directores
								GROUP BY director_id
								ORDER BY num_peliculas DESC) AS subquery
                                WHERE num_peliculas = (SELECT MAX(num_peliculas)
														FROM (SELECT COUNT(*) AS num_peliculas
                                                        FROM peliculas_directores
														GROUP BY director_id) AS max_subquery))
ORDER BY p.titulo ASC;

-- 11. Actores que también han sido directores y productores

SELECT a.actor
FROM actores a
INNER JOIN directores d ON a.actor = d.director
INNER JOIN productores p ON a.actor = p.productor
ORDER BY actor;

-- 12. Número de películas en cada década

SELECT (produccion DIV 10) * 10 AS decada, COUNT(*) AS cuenta
FROM peliculas
GROUP BY decada
ORDER BY decada;

-- 13. Los tres actores más representativos de los 50 y 60 NO HACER

-- Crear una vista para las películas de los 50 y 60
CREATE VIEW peliculas_50s_60s AS
SELECT p.id AS pelicula_id
FROM peliculas p
WHERE p.produccion BETWEEN 1950 AND 1969;

-- Crear una vista para contar el número de películas en las que ha participado cada actor en los 50 y 60
CREATE VIEW actores_conteo AS
SELECT a.actor, COUNT(pa.pelicula_id) AS num_peliculas
FROM actores a
INNER JOIN peliculas_actores pa ON a.id = pa.actor_id
INNER JOIN peliculas_50s_60s p50s_60s ON pa.pelicula_id = p50s_60s.pelicula_id
GROUP BY a.actor;

-- Obtener el número máximo de películas
CREATE VIEW max_peliculas AS
SELECT MAX(num_peliculas) AS max_peliculas
FROM actores_conteo;

-- Obtener los actores con el número máximo de películas
CREATE VIEW actores_max_peliculas AS
SELECT actor
FROM actores_conteo
WHERE num_peliculas = (SELECT max_peliculas FROM max_peliculas);

-- Obtener los tres actores más representativos de las décadas de 50 y 60 sin usar LIMIT
SELECT ac.actor, ac.num_peliculas
FROM actores_conteo ac
JOIN actores_max_peliculas amp ON ac.actor = amp.actor
ORDER BY ac.num_peliculas DESC;


-- 14. Número de películas por actor encolumnado por década NO HACER

SELECT a.actor,
SUM(CASE WHEN p.produccion BETWEEN 1950 AND 1959 THEN 1 ELSE 0 END) AS Decada_1950,
SUM(CASE WHEN p.produccion BETWEEN 1960 AND 1969 THEN 1 ELSE 0 END) AS Decada_1960,
SUM(CASE WHEN p.produccion BETWEEN 1970 AND 1979 THEN 1 ELSE 0 END) AS Decada_1970,
SUM(CASE WHEN p.produccion BETWEEN 1980 AND 1989 THEN 1 ELSE 0 END) AS Decada_1980,
SUM(CASE WHEN p.produccion BETWEEN 1990 AND 1999 THEN 1 ELSE 0 END) AS Decada_1990,
SUM(CASE WHEN p.produccion BETWEEN 2000 AND 2009 THEN 1 ELSE 0 END) AS Decada_2000,
SUM(CASE WHEN p.produccion BETWEEN 2010 AND 2019 THEN 1 ELSE 0 END) AS Decada_2010,
SUM(CASE WHEN p.produccion BETWEEN 2020 AND 2029 THEN 1 ELSE 0 END) AS Decada_2020
FROM actores a
INNER JOIN peliculas_actores pa ON a.id = pa.actor_id
INNER JOIN peliculas p ON pa.pelicula_id = p.id
GROUP BY a.actor
ORDER BY a.actor;


-- 15. Director y género de las películas interpretadas por Ron Perlman NO HACER (GROUP_CONCAT Y SELECT EN EL SELECT)

SELECT
    pa.actor AS Ron_Perlman,
    GROUP_CONCAT(DISTINCT d.director ORDER BY d.director ASC SEPARATOR ', ') AS Directores,
    GROUP_CONCAT(DISTINCT g.genero ORDER BY g.genero ASC SEPARATOR ', ') AS Generos
FROM
    actores_peliculas pa
INNER JOIN
    peliculas p ON pa.id = p.id
INNER JOIN
    directores_peliculas dp ON p.id = dp.id
INNER JOIN
    directores d ON dp.director_id = d.id
INNER JOIN
    generos_peliculas gp ON p.id = gp.id
INNER JOIN
    generos g ON gp.genero_id = g.id
WHERE
    pa.actor = 'Ron Perlman'
GROUP BY
    pa.actor;


-- 16. Director, nacionalidad y músico de las películas que empiezan por "K"

SELECT p.titulo, p.produccion, d.director, n.nacionalidad, m.musico
FROM peliculas p
INNER JOIN peliculas_directores pd ON p.id = pd.pelicula_id
INNER JOIN directores d ON pd.director_id = d.id
INNER JOIN peliculas_nacionalidades pn ON p.id = pn.pelicula_id
INNER JOIN nacionalidades n ON pn.nacionalidad_id = n.id
INNER JOIN peliculas_musicos pm ON p.id = pm.pelicula_id
INNER JOIN musicos m ON pm.musico_id = m.id
WHERE p.titulo LIKE 'K%'
ORDER BY p.produccion;

-- 17. Películas de Katherine Hepburn cuando actuó junto a Cary Grant o Spencer Tracy (EXISTS)

SELECT p.titulo
FROM peliculas p
WHERE EXISTS (
    SELECT 1
    FROM actores_peliculas ap1
    JOIN actores_peliculas ap2 ON ap1.id = ap2.id
    JOIN actores a1 ON ap1.actor_id = a1.id
    JOIN actores a2 ON ap2.actor_id = a2.id
    WHERE (a1.actor = 'Katherine Hepburn' AND a2.actor = 'Cary Grant')
    OR (a1.actor = 'Katherine Hepburn' AND a2.actor = 'Spencer Tracy')
);


-- 18. Actores de las películas donde actuó Marilyn Monroe ordenado por año de producción

SELECT DISTINCT a.actor
FROM actores_peliculas ap
JOIN peliculas p ON ap.id = p.id
JOIN actores a ON ap.actor_id = a.id
WHERE p.titulo IN (
    SELECT DISTINCT p2.titulo
    FROM actores_peliculas ap2
    JOIN peliculas p2 ON ap2.id = p2.id
    JOIN actores a2 ON ap2.actor_id = a2.id
    WHERE a2.actor = 'Marilyn Monroe'
)
ORDER BY p.duracion;


-- 19. Películas donde actuaron Ava Gardner o Clark Gable y fueron dirigidas por John Ford o John Huston NO HACER



-- 20. Número de películas que empiezan por cada letra del abecedario. Las películas que no empiezan por una letra agruparlas en el grupo asterisco. NO HACER



-- 21. Añadir el número de directores y de actores a la consulta anterior NO HACER



-- 22. Actores con carreras de 30 años en películas de comedia

SELECT a.actor
FROM actores a
JOIN actores_peliculas ap ON a.id = ap.actor_id
JOIN peliculas p ON ap.pelicula_id = p.id
JOIN peliculas_generos pg ON p.id = pg.pelicula_id
JOIN generos g ON pg.genero_id = g.id
WHERE g.genero = 'Comedia'
GROUP BY a.actor
HAVING (MAX(p.produccion) - MIN(p.produccion)) >= 30;


-- 23. Directores con carreras de al menos 30 años que hicieron alguna película del género fantástico o de ciencia ficción.

SELECT d.director
FROM directores d
JOIN peliculas_directores pd ON d.id = pd.director_id
JOIN peliculas p ON pd.pelicula_id = p.id
JOIN peliculas_generos pg ON p.id = pg.pelicula_id
JOIN generos g ON pg.genero_id = g.id
GROUP BY d.director
HAVING (MAX(p.produccion) - MIN(p.produccion)) >= 30
AND g.genero IN ('Fantástico', 'Ciencia ficción');


-- 24. Averiguar cuántas películas tienen puesto el año de producción, y el rango de años de producción.

SELECT 
    COUNT(*) AS cantidad_peliculas,
    MIN(produccion) AS año_minimo,
    MAX(produccion) AS año_maximo
FROM 
    peliculas
WHERE 
    produccion IS NOT NULL;


-- 25. ¿Cuántas películas tienen puesto el título original y en cúantas es diferente del título?

SELECT 
    COUNT(*) AS total_peliculas,
    COUNT(CASE WHEN titulo != titulo_original THEN 1 END) AS diferentes_titulo_original
FROM 
    peliculas
WHERE 
    titulo_original IS NOT NULL;


-- 26. Número de letras y número de palabras del título de las películas NO HACER



-- 27. Obtener 10 películas al azar y un actor al azar de cada una de ellas. Ordenar por título NO HACER



-- 28. Género preferido de los principales actores

SELECT 
    ap.actor_id,
    a.actor,
    g.genero AS genero_preferido,
    COUNT(*) AS cantidad_peliculas
FROM 
    actores_peliculas ap
INNER JOIN actores a ON ap.actor_id = a.id
INNER JOIN peliculas_generos pg ON ap.id = pg.id
INNER JOIN generos g ON pg.genero_id = g.id
WHERE 
    ap.actor_id IN (SELECT actor_id FROM actores_peliculas WHERE id IN (SELECT pelicula_id FROM peliculas_generos))
GROUP BY 
    ap.actor_id, g.genero
ORDER BY 
    ap.actor_id, cantidad_peliculas DESC;


-- 29. Los 25 mejores actores por número de películas realizadas con una película representativa al azar

WITH ActoresRank AS (
    SELECT 
        actor_id,
        actor,
        COUNT(*) AS cantidad_peliculas,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM 
        actores_peliculas
    GROUP BY 
        actor_id, actor
)
SELECT 
    ar.actor,
    ar.cantidad_peliculas,
    FIRST_VALUE(p.titulo) OVER (PARTITION BY ar.actor_id ORDER BY RANDOM()) AS pelicula_representativa
FROM 
    ActoresRank ar
JOIN 
    actores_peliculas ap ON ar.actor_id = ap.actor_id
JOIN 
    peliculas p ON ap.pelicula_id = p.id
WHERE 
    ar.ranking <= 25;


-- 30. Actores con al menos 30 años de carrera. Indicar año de inicio y fin. Mostrar la película inicial y final de su carrera. NO HACER


