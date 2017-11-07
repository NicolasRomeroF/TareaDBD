INSERT INTO USUARIO (nombre_usuario, nombre, apellido, pais)
	VALUES ('Polaris', 'Nicolas', 'Romero' , 'Chile'),
	('FrankoElMejorXD95', 'Franco', 'Leal', 'Chile'),
	('feliponk', 'Luis', 'Abello', 'Argentina'),
	('riruriru', 'Isaac', 'Espinoza', 'Haiti'),
	('ElBarto', 'Bar', 'Sinso', 'Estados Unidos');

INSERT INTO SELLO_DISCOGRAFICO (nombre)
	VALUES ('El sello'),
	('Record label'),
	('DijoElVarsinso'),
	('LaPolla'),
	('Musi-k');

INSERT INTO ARTISTA (nombre)
	VALUES ('Bad Bunny'),
	('Misfits'),
	('Ed Sheeran'),
	('Selena Gomez'),
	('Alegria'),
	('Grupo RED'),
	('Pantera'),
	('Planta carnivora'),
('Die Antwoord');

INSERT INTO GENERO (nombre)
	VALUES ('Trap'),
	('Punk'),
	('Pop'),
	('Cumbia'),
	('Rave'),
	('Groove Metal');

INSERT INTO ALBUM (id_artista, nombre, descripcion, genero, id_sello, fecha_año)
	VALUES (1, 'KeYoMeSeTuhPosehFavoritah', 'KUSH KUSH KUSH', 1, 1, '2020'),
	(2, 'American Psycho', 'Dig up her booooooooooooones', 2, 2, '1950'),
	(3, 'NoLoConozco+-/', 'The Shape of You', 3, 3, '2000'),
	(4, 'When the sun goes down', 'Aparecio en Barney', 3, 4, '1995'),
	(5, 'Grandes Exitos', 'El americo negrito', 4, 5, '1998'),
    (6, 'Grandes Exitos', 'El rusio que salta', 4, 1, ' 2000'),
    (7, 'Vulgar display of power', 'Puño en la cara', 6, 2, '1992'),
    (8, 'La plantita', 'te come y te asesina y nunca te paga el iva', 1, 3, '2010'),
    (9, '$O$', 'El mejor rap rave de la vida', 5, 4, ' 2009');


INSERT INTO ARTISTA_SELLO (id_sello, id_artista, fecha_inicio, fecha_termino)
	VALUES (1, 1, '2015-05-15', '2020-05-15'),
	(2, 2, '2014-05-15', '2020-05-15'),
(3, 3, '2013-05-15', '2021-05-15'),
(4, 4, '2012-05-15', '2022-05-15'),
(5, 5, '2011-05-15', '2023-05-15'),
(1, 6, '2010-05-15', '2023-05-15'),
(2, 6, '2010-05-15', '2023-05-15'),
(2, 7, '2016-05-15', '2022-05-15'),
(3, 8, '2017-05-15', '2021-05-15'),
(4, 9, '2011-05-15', '2014-05-15');


INSERT INTO ARTISTAS_SIMILARES(id_artista, id_artista_similar)
	VALUES (3, 4),
	(5, 6),
(8,9),
(8,1),
(9,1),
(2,7);
	
INSERT INTO ARTISTAS_FAVORITOS (nombre_usuario, id_artista)
	VALUES ('Polaris', 1),
	('Polaris',3),
	('Polaris',5),
	('Polaris',9),
	('FrankoElMejorXD95',2),
	('FrankoElMejorXD95',6),
	('feliponk',4),
	('feliponk',1),
	('riruriru',4),
	('riruriru',8),
	('ElBarto',9);

INSERT INTO CANCION (id_album, nombre, duracion)
	VALUES (1, 'Krippy Kush', '4:00'),
	(2, 'Dig up her bones', '3:20'),
	(3, 'Shape of you', '3:30'),
	(4, 'Love you like a love song', '3:45'),
	(6, 'Amor adolescente','4:20'),
	(5, 'Mujeres y cerveza', '4:00'),
(9,  'Enter the ninja', '5:08'),
(7, 'Walk', '5:00'),
(8, 'Jaina with tooth','2:00'),
(1, 'El regueton lento', '3:30');

INSERT INTO ARTISTA_INVITADO_CANCION (id_cancion, id_artista_invitado)
	VALUES (1,9),
	(8,9),
	(3,4),
	(1,7),
	(5,6);

INSERT INTO GENEROS_ARTISTA (id_artista, id_genero)
	VALUES (1,1),
	(2,2),
	(3,3),
	(4,3),
	(5,4),
	(6,4),
	(7,6),
	(8,1),
	(9,5);

INSERT INTO LISTA_REPRODUCCION (nombre_lista, nombre_usuario)
	VALUES ('ROCK (?) + minions', 'riruriru'),
	('Emo/Math Rock', 'Polaris'),
	('Cumbiwi', 'FrankoElMejorXD95'),
	('TMEO', 'ElBarto'),
	('regueton y ponceo', 'feliponk');


INSERT INTO CANCIONES_LISTA (id_lista,id_cancion)
	VALUES (1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(2,2),
(2,3),
(3,6),
(3,5),
(4,6),
(5,1),
(5,10);

INSERT INTO LISTA_COMPARTIDA (id_lista, nombre_usuario)
	VALUES (1, 'riruriru'),
	(1, 'Polaris'),
	(1, 'feliponk'),
	(1, 'FrankoElMejorXD95'),
	(3, 'feliponk'),
	(3, 'FrankoElMejorXD95');
	




