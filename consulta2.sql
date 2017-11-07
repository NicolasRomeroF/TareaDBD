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
