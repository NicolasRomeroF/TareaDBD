--CONSULTA 1

SELECT ars.id_sello, count(*)
FROM artista_sello ars, artista a, generos_artista ga, genero g
WHERE ars.id_artista = a.id_artista AND ars.fecha_termino > '01-01-2017' AND ga.id_genero = g.id_genero AND ga.id_artista = a.id_artista AND g.nombre = 'Indie'
GROUP BY ars.id_sello;

--CONSULTA 2

DROP VIEW IF EXISTS sello_cantidad;
DROP VIEW IF EXISTS sellos_2017;

CREATE VIEW sellos_2017 AS SELECT id_sello, id_artista
FROM ARTISTA_SELLO AR
WHERE fecha_termino > '01-01-2017';

CREATE VIEW sello_cantidad AS SELECT id_sello, count(*)
FROM sellos_2017 
GROUP BY id_sello;

SELECT id_sello
FROM sello_cantidad
WHERE count=(SELECT max(count)
FROM sello_cantidad);

--CONSULTA 3

DROP VIEW IF EXISTS lista_cantidad;
DROP VIEW IF EXISTS artistas_considerados_favoritos;

CREATE VIEW artistas_considerados_favoritos AS SELECT DISTINCT a.nombre, c.nombre AS nombre_cancion
FROM artista a, artistas_favoritos af, album al, cancion c
WHERE a.id_artista = af.id_artista AND a.id_artista = al.id_artista AND c.id_album = al.id_album;


CREATE VIEW lista_cantidad AS SELECT nombre, count(*)
FROM artistas_considerados_favoritos
GROUP BY nombre;

SELECT *
FROM lista_cantidad
WHERE count=(SELECT min(count)
FROM lista_cantidad);

--CONSULTA 5

SELECT DISTINCT LR.nombre_usuario
FROM LISTA_COMPARTIDA LC, LISTA_REPRODUCCION LR
WHERE LC.id_lista = LR.id_lista;

--CONSULTA 7

DROP VIEW IF EXISTS artista_cantidad;
DROP VIEW IF EXISTS artista_2017;

CREATE VIEW artista_2017 AS SELECT id_sello, id_artista
FROM ARTISTA_SELLO AR
WHERE fecha_inicio < '01-01-2017';

CREATE VIEW artista_cantidad AS SELECT id_artista, count(*)
FROM artista_2017 
GROUP BY id_artista;

SELECT id_artista
FROM artista_cantidad
WHERE count=(SELECT max(count)
FROM artista_cantidad);

--CONSULTA 8

DROP VIEW IF EXISTS lista_cantidad;
DROP VIEW IF EXISTS lista_compartida_cancion;

CREATE VIEW lista_compartida_cancion AS SELECT DISTINCT LC.id_lista, CL.id_cancion
FROM LISTA_COMPARTIDA LC, LISTA_REPRODUCCION LR, CANCIONES_LISTA CL
WHERE LC.id_lista = LR.id_lista AND CL.id_lista = LC.id_lista
GROUP BY LC.id_lista, CL.id_cancion;

CREATE VIEW lista_cantidad AS SELECT id_lista, count(*)
FROM lista_compartida_cancion
GROUP BY id_lista;

SELECT id_lista
FROM lista_cantidad
WHERE count=(SELECT max(count)
FROM lista_cantidad);

--CONSULTA 9

SELECT count(*)
FROM usuario U, artistas_favoritos AF, genero G, generos_artista GA
WHERE U.pais = 'Chile' AND U.nombre_usuario = AF.nombre_usuario 
AND AF.id_artista = GA.id_artista AND GA.id_genero = G.id_genero
AND G.nombre = 'Rock';

--CONSULTA 10

SELECT DISTINCT a.nombre
FROM artista a, artistas_favoritos af
WHERE a.id_artista = af.id_artista;