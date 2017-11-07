DROP VIEW IF EXISTS lista_compartida_cancion;

CREATE VIEW lista_compartida_cancion AS SELECT DISTINCT LC.id_lista, CL.id_cancion
FROM LISTA_COMPARTIDA LC, LISTA_REPRODUCCION LR, CANCIONES_LISTA CL
WHERE LC.id_lista = LR.id_lista AND CL.id_lista = LC.id_lista
GROUP BY LC.id_lista, CL.id_cancion;

DROP VIEW IF EXISTS lista_cantidad;

CREATE VIEW lista_cantidad AS SELECT id_lista, count(*)
FROM lista_compartida_cancion
GROUP BY id_lista;

SELECT id_lista
FROM lista_cantidad
WHERE count=(SELECT max(count)
FROM lista_cantidad);