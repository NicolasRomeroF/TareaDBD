SELECT DISTINCT a.nombre
FROM artista a, artistas_favoritos af
WHERE a.id_artista = af.id_artista;