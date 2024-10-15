1. Queremos diseñar una base de datos por encargo de la FOFA. A la FOFA le interesa 
guardar información acerca de las distintas federaciones de cada país. Estas federaciones, serán
las encargadas de organizar las distintas ligas, las cuales, tendrán distintas divisiones de los 
diferentes campeonatos nacionales.
Habrá torneos intercontinentales que no organizarán las federaciones nacionales, de la organización
de estos torneos se encargarán otras federaciones organizadas por continentes.
Las distintas divisiones contendrán varios equipos, como mínimo, 5 equipos. Estos equipos, jugarán
como locales en un estadio, pudiendo ser más de un equipo local en un mismo estadio (por ejemplo,
Milán e Inter de Milán). 
Es conocido por todos que cada equipo de fútbol tiene un único grupo de ultras, de los que también
interesará guardar infomación.
De las federaciones interesará guardar:
- nombre NOT NULL.
- pais NULL.
- ligas (numero de ligas).

De las divisiones interesará guardar:
- nombre NOT NULL.
- numEquipos NOT NULL.

De las ligas interesará guardar:
- nombre NOT NULL
- pais NOT NULL

De los torneos internacionales interesará guardar:
- nombre NOT NULL.
- numEquipos.
- premio.

De los estadios nos interesará guardar: 
- nombre NOT NULL.
- patrocinador.
- olimpico ("si" o "no")

De los ultras:

- nombreBanda NOT NULL.
- violencia ("baja", "media", "alta").

De los equipos:

- nombre NOT NULL
- division NOT NULL
- presupuesto
- grupoUltra NOT NULL
- estadio NOT NULL

1. Crear MER.
2. Crear la BBDD que se llame futbolInternacional.
3. Crear las estructuras que creas convenientes para almacenar toda la información.
4. Inserta la siguiente información:

federaciones:
Federacion española ESPAÑA 3
The Football Association INGLATERRA 2
Federazione Italiana Giuoco Calcio ITALIA 2
UEFA
CONMEBOL

divisiones:
primera 20 -> relacionada con liga BBVA 
segunda 22 -> liga Santader 
segundaB 64 -> liga Federación 
premier 20 -> premier 
first 22 -> EFL Championship 
serieA 20 -> Serie A TIM 
serieB 22 -> Serie B TIM 

ligas: 
liga BBVA -> federacion española
liga Santader -> federacion española
liga Federación -> federacion española
premier -> The Football Association
EFL Championship -> The Football Association
Serie A TIM -> Federazione Italiana Giuoco Calcio
Serie B TIM -> Federazione Italiana Giuoco Calcio

(LAS CANTIDADES DE LOS PREMIOS DEL TORNEO ESTÁN SEPARADAS POR FACILITAR LA LECTURA)
torneos:
UEFA ChampionsLeague 32  100 000 000.00-> UEFA
Europa League 64  25 000 000.00-> UEFA
Libertadores 32 25 000 000.00-> CONMEBOL

estadios:
Riazor ABANCA "NO"
Camp Nou RAKUTEN "NO"
Wembley NULL "SI"
San Siro NULL "NO"
Dean Court NULL "NO"
Old Trafford NULL "NO"
Stamford Bridge NULL "NO"
Emirates Stadium EMIRATES STADIUM "NO"
Santiago Bernabeu NULL "NO"

grupoUltra:
Riazor Blues "MEDIA"
Boixos Nois "ALTA"
Yid Army "ALTA"
Curva Sud "ALTA"
Curva Nod "ALTA"
Hooligans "ALTA"
The Red Army "ALTA"
The Chelsea Headhunters "ALTA"
Gooners "ALTA"
Ultrasur "ALTA"
Herri Norte "MEDIA"


(LAS CANTIDADES DE LOS PRESUPUESTOS DE LOS EQUIPOS ESTÁN SEPARADAS POR FACILITAR LA LECTURA)
Equipos:
- Deportivo de La Coruña | segundaB | 100 | riazor blues | riazor
- Barcelona | primera | 100 000 000.00 | boixos nois | camp nou
- Milán FC | serieA | 50 000 000.00 | curva sud | san siro
- Inter de Milán | serieA | 55 000 000.00 | curva nod | san siro
- Tottenham | premier | 500 000 000.00 | yid army | wembley
- Bournemouth | first | 50 000 000.00 | hooligans | dean court
- Manchester United | premier | 888 000 000.00 | the red army | old trafford
- Chelsea FC | premier | 888 000 000.00 | the chelsea headhunters | stamford bridge
- Arsenal | premier | 700 000 000.00 | gooners | emirates stadium
- Real Madrid | primera | 999 000 000.00 | ultrasur | santiago bernabeu
- Athletic de Bilbao | primera | 80 000 000.00 | herri norte | estadio de san mamés

5. Establece las relaciones entre las tablas creando las claves primarias y claves foráneas que 
creáis convenientes.
6. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones.

SELECT *
FROM "equipos"
WHERE presupuesto BETWEEN 50000000 AND 100000000;

7. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n".

SELECT *
FROM "equipos"
WHERE presupuesto BETWEEN 50000000 AND 100000000 AND nombre LIKE "_A%N_";

8.  Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n", o que simplemente se llame Deportivo 
de La Coruña.

SELECT *
FROM "equipos"
WHERE presupuesto BETWEEN 50000000 AND 100000000 AND nombre LIKE "_A%N_" OR nombre LIKE "Deportivo 
de La Coruña"

9. Muestra la información de los estadios que NO tengan patrocinador.

SELECT *
FROM "equipos"
WHERE patrocinador IS NULL;

10. Muestra la información de los estadios que tengan patrocinador.

SELECT *
FROM "equipos"
WHERE patrocinador IS NOT NULL;

11. Muestra la información de las ligas que tengan 20 o 22 equipos.

-- VERSION AVANZADA --
SELECT *
FROM "divisones" INNER JOIN ligas ON divisiones.idLiga = ligas.id
WHERE numEquipos IN(20,22);

-- VERSION BASICA --
SELECT *
FROM "divisones"
WHERE numEquipos IN(20,22);

12. Muestra la información de los grupos ultras cuyo nombre NO contenga la palabra "CURVA".

SELECT *
FROM "ultras"
WHERE nombreBanda NOT LIKE "%curva%";

13. Muestra la información de los grupos ultras cuyo nivel de violencia sea "BAJA".

SELECT *
FROM "ultras"
WHERE violencia LIKE "BAJA";

14. Muestra cuántos estadios son olímpicos y cuántos no lo son.



15. Muestra cuántos equipos hay de cada liga (que NO federación).



16. Muestra cuánto presupuesto tienen en total los equipos de cada liga y cuál es el presupuesto medio de cada liga.



17. Muestra las ligas cuyos equipos tienen un presupuesto mayor de media a 150 000 000.00



