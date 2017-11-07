SELECT ars.id_sello, count(*)
FROM artista_sello ars, artista a, generos_artista ga, genero g
WHERE ars.id_artista = a.id_artista AND ars.fecha_termino > '01-01-2017' AND ga.id_genero = g.id_genero AND ga.id_artista = a.id_artista AND g.nombre = 'Indie'
GROUP BY ars.id_sello;