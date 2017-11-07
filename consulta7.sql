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





