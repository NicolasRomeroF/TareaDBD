SELECT count(*)
FROM usuario U, artistas_favoritos AF, genero G, generos_artista GA
WHERE U.pais = 'Chile' AND U.nombre_usuario = AF.nombre_usuario 
AND AF.id_artista = GA.id_artista AND GA.id_genero = G.id_genero
AND G.nombre = 'Rock';