CREATE DATABASE examensql1;

USE examensql1;

CREATE TABLE familiares (
    nombre VARCHAR(55) NOT NULL,
    apellido VARCHAR(55) NOT NULL,
    parentesco ENUM("prima", "madre", "padre") NOT NULL
);

CREATE TABLE sueños (
    tipoSueño ENUM("sueño", "pesadilla") NOT NULL,
    duracionSueño INT(2) NOT NULL,
    protagonistas TINYINT(1) NOT NULL
);

INSERT INTO familiares
VALUES 
("Oana", "Vázquez", "prima"),
("Oana", "Vázquez", "prima"),
("Martin", "Vázquez", "padre"),
("Martin", "Vázquez", "padre"),
("María", "López", "madre"),
("María", "López", "madre");

INSERT INTO sueños
VALUES 
("sueño", 1, 1),
("sueño", 2, 1),
("pesadilla", 1, 0),
("pesadilla", 3, 1),
("sueño", 2, 1),
("pesadilla", 2, 1);

ALTER TABLE familiares
ADD COLUMN id INT(2) AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE sueños
ADD COLUMN id INT(2) AUTO_INCREMENT PRIMARY KEY FIRST;

SELECT*
FROM familiares
WHERE apellido LIKE "_á%ez";

SELECT*
FROM sueños
WHERE protagonistas = 0;

SELECT*
FROM familiares
WHERE parentesco LIKE "madre" or nombre LIKE "Oana";

SELECT*
FROM familiares
WHERE parentesco LIKE "madre";

SELECT*
FROM familiares
WHERE nombre LIKE "Oana";

ALTER TABLE familiares
ADD COLUMN edad INT(3) NOT NULL AFTER apellido;

ALTER TABLE familiares
DROP COLUMN parentesco;

ALTER TABLE sueños
CHANGE COLUMN tipoSueño TO sueñoPesadilla VARCHAR(55) NOT NULL;

SELECT*
FROM sueños
WHERE duracionSueño IN(1, 2, 3, 6) AND protagonistas = 1;

ALTER TABLE sueños
RENAME COLUMN tipoSueño TO sueñoPesadilla;

