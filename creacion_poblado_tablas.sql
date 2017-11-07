--CREACION DE TABLAS

DROP TABLE IF EXISTS SELLO_DISCOGRAFICO CASCADE;
DROP TABLE IF EXISTS ARTISTA_SELLO CASCADE;
DROP TABLE IF EXISTS ARTISTA CASCADE;
DROP TABLE IF EXISTS ARTISTAS_SIMILARES CASCADE;
DROP TABLE IF EXISTS ALBUM CASCADE;
DROP TABLE IF EXISTS CANCION CASCADE;
DROP TABLE IF EXISTS ARTISTA_INVITADO_CANCION CASCADE;
DROP TABLE IF EXISTS GENEROS_ARTISTA CASCADE;
DROP TABLE IF EXISTS GENERO CASCADE;
DROP TABLE IF EXISTS USUARIO CASCADE;
DROP TABLE IF EXISTS ARTISTAS_FAVORITOS CASCADE;
DROP TABLE IF EXISTS LISTA_REPRODUCCION CASCADE;
DROP TABLE IF EXISTS CANCIONES_LISTA CASCADE;
DROP TABLE IF EXISTS LISTA_COMPARTIDA CASCADE;

CREATE TABLE SELLO_DISCOGRAFICO (
id_sello SERIAL NOT NULL,
nombre VARCHAR(127) NOT NULL,
CONSTRAINT PK_SELLO_DISCOGRAFICO PRIMARY KEY (id_sello)
);

CREATE TABLE ARTISTA_SELLO (
id_sello INT4 NOT NULL,
id_artista INT4 NOT NULL,
fecha_inicio DATE NULL,
fecha_termino DATE  NULL,
CONSTRAINT PK_ARTISTA_SELLO PRIMARY KEY (id_sello, id_artista)
);

CREATE TABLE ARTISTA(
id_artista SERIAL NOT NULL,
nombre VARCHAR(127) NOT NULL,
CONSTRAINT PK_ARTISTA PRIMARY KEY (id_artista)
);

CREATE TABLE ARTISTAS_SIMILARES(
	id_artista INT4 NOT NULL,
	id_artista_similar INT4 NOT NULL,
	CONSTRAINT PK_ARTISTAS_SIMILARES PRIMARY KEY (id_artista, id_artista_similar)
);

CREATE TABLE ALBUM(
	id_album SERIAL NOT NULL,
	id_artista INT4 NOT NULL,
	nombre VARCHAR(127) NOT NULL,
	descripcion VARCHAR(255) NULL,
	genero INT4 NOT NULL,
	id_sello INT4 NOT NULL,
	fecha_año VARCHAR(5) NOT NULL,
	CONSTRAINT PK_ALBUM PRIMARY KEY (id_album)
);

CREATE TABLE CANCION (
	id_cancion SERIAL NOT NULL,
	id_album INT4 NOT NULL,
	nombre VARCHAR(127) NOT NULL,
	duracion VARCHAR(10) NULL,
	CONSTRAINT PK_CANCION PRIMARY KEY (id_cancion)
);


CREATE TABLE ARTISTA_INVITADO_CANCION(
	id_cancion INT4 NOT NULL,
	id_artista_invitado INT4 NOT NULL,
	CONSTRAINT PK_ARTISTA_INVITADO_CANCION PRIMARY KEY (id_cancion, id_artista_invitado)
);


CREATE TABLE GENEROS_ARTISTA(
	id_artista INT4 NOT NULL,
	id_genero INT4 NOT NULL,
	CONSTRAINT PK_GENEROS_ARTISTA PRIMARY KEY (id_artista, id_genero)
);

CREATE TABLE GENERO(
	id_genero SERIAL NOT NULL,
	nombre VARCHAR(127) NOT NULL,
    CONSTRAINT PK_GENERO PRIMARY KEY (id_genero)
);


CREATE TABLE USUARIO (
	nombre_usuario VARCHAR(20) NOT NULL,
	nombre VARCHAR(127) NOT NULL,
	apellido VARCHAR(127) NOT NULL,
	pais VARCHAR(127) NOT NULL,
	CONSTRAINT PK_USUARIO PRIMARY KEY (nombre_usuario)
);

CREATE TABLE ARTISTAS_FAVORITOS(
	nombre_usuario VARCHAR(20) NOT NULL,
	id_artista INT4 NOT NULL,
	CONSTRAINT PK_ARTISTAS_FAVORITOS PRIMARY KEY (nombre_usuario, id_artista)
);

CREATE TABLE LISTA_REPRODUCCION(
	id_lista SERIAL NOT NULL,
	nombre_lista VARCHAR(127) NOT NULL,
	nombre_usuario VARCHAR(20) NOT NULL,
    CONSTRAINT PK_LISTA_REPRODUCCION PRIMARY KEY (id_lista)
);

CREATE TABLE CANCIONES_LISTA (
	id_lista INT4 NOT NULL,
	id_cancion INT4 NOT NULL,
	CONSTRAINT PK_CANCIONES_LISTA PRIMARY KEY (id_lista, id_cancion)
);

CREATE TABLE LISTA_COMPARTIDA(
	id_lista INT4 NOT NULL,
	nombre_usuario VARCHAR(20) NOT NULL,
	CONSTRAINT PK_LISTA_COMPARTIDA PRIMARY KEY (id_lista, nombre_usuario)
);


ALTER TABLE ARTISTA_SELLO
	ADD CONSTRAINT FK_SELLO_TIENE_ARTISTAS FOREIGN KEY (id_artista)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ARTISTAS_SIMILARES
	ADD CONSTRAINT FK_SON_ARTISTAS_SIMILARES FOREIGN KEY (id_artista)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;
		
ALTER TABLE ARTISTAS_SIMILARES
	ADD CONSTRAINT FK_TIENE_ARTISTA_SIMILAR FOREIGN KEY (id_artista_similar)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE ALBUM 
	ADD CONSTRAINT FK_ARTISTA_TIENE_ALBUMES FOREIGN KEY (id_artista)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ALBUM 
	ADD CONSTRAINT FK_ALBUM_TIENE_GENERO FOREIGN KEY (genero)
		REFERENCES GENERO (id_genero)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CANCION
	ADD CONSTRAINT FK_ALBUM_TIENE_CANCIONES FOREIGN KEY (id_album)
		REFERENCES ALBUM (id_album)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ARTISTA_INVITADO_CANCION 
	ADD CONSTRAINT FK_CANCION_TIENE_ARTISTA_INVITADO FOREIGN KEY (id_cancion)
		REFERENCES CANCION (id_cancion)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GENEROS_ARTISTA
	ADD CONSTRAINT FK_ARTISTA_TIENE_GENERO FOREIGN KEY (id_artista)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GENEROS_ARTISTA
	ADD CONSTRAINT FK_GENERO_TIENE_ARTISTA FOREIGN KEY (id_genero)
		REFERENCES GENERO (id_genero)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ARTISTAS_FAVORITOS
	ADD CONSTRAINT FK_USUARIO_TIENE_ARTISTA_FAVORITO FOREIGN KEY (nombre_usuario)
		REFERENCES USUARIO (nombre_usuario)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ARTISTAS_FAVORITOS
	ADD CONSTRAINT FK_ARTISTAS_GUARDADOS_POR_USUARIO FOREIGN KEY (id_artista)
		REFERENCES ARTISTA (id_artista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE LISTA_REPRODUCCION
	ADD CONSTRAINT FK_USUARIO_TIENE_LISTA FOREIGN KEY (nombre_usuario)
		REFERENCES USUARIO (nombre_usuario)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CANCIONES_LISTA
	ADD CONSTRAINT FK_CANCION_ESTA_EN_LISTA FOREIGN KEY (id_cancion)
		REFERENCES CANCION (id_cancion)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE LISTA_COMPARTIDA
	ADD CONSTRAINT FK_LISTA_COMPARTIDA_CON_USUARIOS FOREIGN KEY (id_lista)
		REFERENCES LISTA_REPRODUCCION (id_lista)
		ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE LISTA_COMPARTIDA
	ADD CONSTRAINT FK_USUARIOS_COMPARTEN_LISTA FOREIGN KEY (nombre_usuario)
		REFERENCES USUARIO (nombre_usuario)
		ON DELETE RESTRICT ON UPDATE RESTRICT;

--POBLADO DE TABLAS

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
	('Die Antwoord'),
	('Led Zeppelin'),
	('El comodo');

INSERT INTO GENERO (nombre)
	VALUES ('Trap'),
	('Punk'),
	('Pop'),
	('Cumbia'),
	('Rave'),
	('Groove Metal'),
	('Rock'),
	('Indie');

INSERT INTO ALBUM (id_artista, nombre, descripcion, genero, id_sello, fecha_año)
	VALUES (1, 'KeYoMeSeTuhPosehFavoritah', 'KUSH KUSH KUSH', 1, 1, '2020'),
	(2, 'American Psycho', 'Dig up her booooooooooooones', 2, 2, '1950'),
	(3, 'NoLoConozco+-/', 'The Shape of You', 3, 3, '2000'),
	(4, 'When the sun goes down', 'Aparecio en Barney', 3, 4, '1995'),
	(5, 'Grandes Exitos', 'El americo negrito', 4, 5, '1998'),
    (6, 'Grandes Exitos', 'El rusio que salta', 4, 1, ' 2000'),
    (7, 'Vulgar display of power', 'Puño en la cara', 6, 2, '1992'),
    (8, 'La plantita', 'te come y te asesina y nunca te paga el iva', 1, 3, '2010'),
    (9, '$O$', 'El mejor rap rave de la vida', 5, 4, ' 2009'),
    (10, 'Led Zeppelin II', 'Rockanroll', 7, 4, ' 1974'),
    (11, 'Run run', 'Wena loh cabroh', 8, 3, '2016');


INSERT INTO ARTISTA_SELLO (id_sello, id_artista, fecha_inicio, fecha_termino)
	VALUES (1, 1, '2015-05-15', '2020-05-15'),
	(2, 2, '2014-05-15', '2020-05-15'),
(3, 3, '2013-05-15', '2021-05-15'),
(4, 4, '2012-05-15', '2022-05-15'),
(5, 5, '2011-05-15', '2023-05-15'),
(1, 6, '2010-05-15', '2023-05-15'),
(2, 10, '2010-05-15', '2023-05-15'),
(2, 7, '2016-05-15', '2022-05-15'),
(3, 8, '2017-05-15', '2021-05-15'),
(4, 9, '2011-05-15', '2014-05-15'),
(3, 11, '2015-03-13', '2025-09-18'),
(2, 11, '2015-03-13', '2025-09-18');


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
	('Polaris',10),
	('FrankoElMejorXD95',2),
	('FrankoElMejorXD95',6),
	('FrankoElMejorXD95',10),
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
(1, 'El regueton lento', '3:30'),
(10, 'Stairway to Heaven', '20:00'),
(11, 'Jardines','5:00');

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
	(7,8),
	(8,1),
	(9,5),
	(10,7),
	(11,8);

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