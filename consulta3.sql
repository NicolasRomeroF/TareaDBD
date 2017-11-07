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