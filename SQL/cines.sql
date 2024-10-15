INSERT INTO `centroscomerciales` (`id_centroComercial`, `nombre`, `localidad`, `estado`) VALUES
(1, 'Centro Comercial A', 'Madrid', 1),
(2, 'Centro Comercial B', 'Barcelona', 1),
(3, 'Centro Comercial C', 'Valencia', 0),
(4, 'Centro Comercial D', 'Sevilla', 1),
(5, 'Centro Comercial E', 'Málaga', 1),
(6, 'Centro Comercial F', 'Bilbao', 0),
(7, 'Centro Comercial G', 'Zaragoza', 1),
(8, 'Centro Comercial H', 'Granada', 0),
(9, 'Centro Comercial I', 'Córdoba', 1),
(10, 'Centro Comercial J', 'Palma de Mallorca', 1);

INSERT INTO `cines` (`id_cine`, `nombre`, `aforo`, `id_centroComercial`) VALUES
(1, 'Cine A', 200, 1),
(2, 'Cine B', 300, 2),
(3, 'Cine C', 150, 3),
(4, 'Cine D', 250, 4),
(5, 'Cine E', 100, 5),
(6, 'Cine F', 350, 6),
(7, 'Cine G', 200, 7),
(8, 'Cine H', 150, 8),
(9, 'Cine I', 250, 9),
(10, 'Cine J', 100, 10);

INSERT INTO `funciones` (`id_funcion`, `id_pelicula`, `id_cine`, `fecha`, `hora`) VALUES
(1, 1, 1, '2024-03-14', '18:00:00'),
(2, 2, 2, '2024-03-15', '20:00:00'),
(3, 3, 3, '2024-03-16', '18:00:00'),
(4, 4, 4, '2024-03-17', '20:00:00'),
(5, 5, 5, '2024-03-18', '18:00:00'),
(6, 6, 6, '2024-03-19', '20:00:00'),
(7, 7, 7, '2024-03-20', '18:00:00'),
(8, 8, 8, '2024-03-21', '20:00:00'),
(9, 9, 9, '2024-03-22', '18:00:00'),
(10, 10, 10, '2024-03-23', '20:00:00'),
(11, 1, 2, '2024-03-24', '18:00:00'),
(12, 2, 3, '2024-03-25', '20:00:00'),
(13, 3, 4, '2024-03-26', '18:00:00'),
(14, 4, 5, '2024-03-27', '20:00:00'),
(15, 5, 6, '2024-03-28', '18:00:00'),
(16, 6, 7, '2024-03-29', '20:00:00'),
(17, 7, 8, '2024-03-30', '18:00:00'),
(18, 8, 9, '2024-03-31', '20:00:00'),
(19, 9, 10, '2024-04-01', '18:00:00'),
(20, 10, 1, '2024-04-02', '20:00:00'),
(21, 7, 8, '2024-04-07', '18:00:00'),
(22, 8, 9, '2024-04-07', '20:00:00'),
(23, 9, 8, '2024-04-14', '18:00:00'),
(24, 10, 8, '2024-04-14', '20:00:00');

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `genero`, `director`, `duracion`) VALUES
(1, 'Batman', 'Acción', 'Matt Reeves', 180),
(2, 'Spiderman', 'Superhéroes', 'Jon Watts', 148),
(3, 'Doctor Strange', 'Fantasía', 'Sam Raimi', 126),
(4, 'Thor: Love and Thunder', 'Superhéroes', 'Taika Waititi', 119),
(5, 'Jurassic World: Dominion', 'Ciencia ficción', 'Colin Trevorrow', 147),
(6, 'Minions: The Rise of Gru', 'Animación', 'Kyle Balda', 87),
(7, 'Lightyear', 'Animación', 'Angus MacLane', 105),
(8, 'Top Gun: Maverick', 'Acción', 'Joseph Kosinski', 137),
(9, 'Elvis', 'Biopic', 'Baz Luhrmann', 159),
(10, 'Black Panther: Wakanda Forever', 'Superhéroes', 'Ryan Coogler', 161);


