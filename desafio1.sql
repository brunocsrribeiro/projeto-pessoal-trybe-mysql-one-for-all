DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

/* TABELA - ARTIST */
CREATE TABLE SpotifyClone.artist (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
	artistName VARCHAR(100) NOT NULL
) engine = InnoDB;

/* TABELA - USERACCOUNT */
CREATE TABLE SpotifyClone.userAccount (
	account_id INT PRIMARY KEY AUTO_INCREMENT,
	accountType VARCHAR(100),
	price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

/* TABELA - RELEASEYEAR */
CREATE TABLE SpotifyClone.releaseYear (
	release_id INT PRIMARY KEY AUTO_INCREMENT,
	releaseOfYear INT(4) NOT NULL
) engine = InnoDB;

/* TABELA - USERS */
CREATE TABLE SpotifyClone.users (
	`user_id` INT PRIMARY KEY AUTO_INCREMENT,
	userName VARCHAR(100) NOT NULL,
	age INT(3) NOT NULL,
	create_date DATE NOT NULL,
	account_id INT NOT NULL,
	FOREIGN KEY (account_id) REFERENCES SpotifyClone.userAccount(account_id)
) engine = InnoDB;

/* TABELA - FAVORITEARTIST */
CREATE TABLE SpotifyClone.favoriteArtist (
	`user_id` INT NOT NULL,
	artist_id INT NOT NULL,
	CONSTRAINT PK_favorite PRIMARY KEY (`user_id`, artist_id),
	FOREIGN KEY (`user_id`) REFERENCES SpotifyClone.users(`user_id`),
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

/* TABELA - ALBUNS */
CREATE TABLE SpotifyClone.albuns (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	artist_id INT NOT NULL,
	release_id INT NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id),
	FOREIGN KEY (release_id) REFERENCES SpotifyClone.releaseYear(release_id)
) engine = InnoDB;

/* TABELA - MUSICS */
CREATE TABLE SpotifyClone.musics (
	track_id INT PRIMARY KEY AUTO_INCREMENT,
	tracks VARCHAR(100) NOT NULL,
	minute_length SMALLINT UNSIGNED NOT NULL,
  album_id INT NOT NULL,
	artist_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

/* TABELA - REPRODUCTIONHISTORY */
CREATE TABLE SpotifyClone.reproductionHistory (
	music_track VARCHAR(100) NOT NULL,
	track_played_on DATETIME NOT NULL,
	track_id INT NOT NULL,
	`user_id` INT NOT NULL,
	CONSTRAINT PK_historic PRIMARY KEY (`user_id`, track_id),
	FOREIGN KEY (track_id) REFERENCES SpotifyClone.musics(track_id),
	FOREIGN KEY (`user_id`) REFERENCES SpotifyClone.users(`user_id`)
) engine = InnoDB;

/* POPULANDO TABELAS */
INSERT INTO SpotifyClone.artist(artistName) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

INSERT INTO SpotifyClone.userAccount(accountType, price) VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO SpotifyClone.releaseYear(releaseOfYear)VALUES
(1990),
(1993),
(1995),
(1998),
(2001),
(2003),
(2007),
(2012),
(2017);

INSERT INTO SpotifyClone.users(userName, age, create_date, account_id) VALUES
('Thati', 23, '2019-10-20', 1),
('Cintia', 35, '2017-12-30', 2),
('Bill', 20, '2019-06-05', 3),
('Roger', 45, '2020-05-13', 4),
('Norman', 58, '2017-02-17', 4),
('Patrick', 33, '2017-01-06', 2),
('Vivian', 26, '2018-01-05', 3),
('Carol', 19, '2018-02-14', 3),
('Angelina', 42, '2018-04-29', 2),
('Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.favoriteArtist(`user_id`, artist_id) VALUES
(1, 1),(1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4), (5, 5), (5, 6),
(6, 6), (6, 3), (6, 1), (7, 2), (7, 5), (8, 1), (8, 5), (9, 6), (9,4), (9, 3),
(10, 2), (10, 6);

INSERT INTO SpotifyClone.albuns(title, artist_id, release_id) VALUES
('Envious',  1, 1),
('Exuberant', 1, 2),
('Hallowed Steam', 2, 3),
('Incandescent', 3, 4),
('Temporary Culture', 4, 5),
('Library of liberty', 4, 6),
('Chained Down', 5, 7),
('Cabinet of fools', 5, 8),
('No guarantees', 5, 9),
('Apparatus', 6, 9);

INSERT INTO SpotifyClone.musics(tracks,  album_id, artist_id, minute_length) VALUES
('Soul For Us', 1, 1, 200),
('Reflections Of Magic', 1, 1, 163),
('Dance With Her Own', 1, 1, 116),
('Troubles Of My Inner Fire', 2, 1, 203),
('Time Fireworks', 2, 1, 152),
('Magic Circus', 3, 4, 105),
('Honey, So Do I', 3, 4, 207),
("Sweetie, Let's Go Wild", 3, 4, 139),
('She Knows', 3, 4, 244),
('Fantasy For Me', 4, 3, 100),
('Celebration Of More', 4, 3, 146),
('Rock His Everything', 4, 3, 223),
('Home Forever', 4, 3, 231),
('Diamond Power', 4, 3, 241),
("Let's Be Silly", 4, 3, 132),
('Thang Of Thunder', 5, 2, 240),
('Words Of Her Life', 5, 2, 185),
('Without My Streets', 5, 2, 176),
('Need Of The Evening', 6, 2, 190),
('History Of My Roses', 6, 2, 222),
('Without My Love', 6, 2, 111),
('Walking And Game', 6, 2, 123),
('Young And Father', 6, 2, 197),
('Finding My Traditions', 7, 5, 179),
('Walking And Man', 7, 5, 229),
('Hard And Time', 7, 5, 135),
("Honey, I'm A Lone Wolf", 7, 5, 150),
("She Thinks I Won't Stay Tonight", 8, 5, 166),
("He Heard You're Bad For Me", 8, 5, 154),
("He Hopes We Can't Stay", 8, 5, 210),
('I Know I Know', 8, 5, 117),
("He's Walking Away", 9, 5, 159),
("He's Trouble", 9, 5, 138),
('I Heard I Want To Bo Alone', 9, 5, 120),
('I Ride Alone', 9, 5, 151),
('Honey', 10, 6, 79),
('You Cheated On Me', 10, 6, 95),
("Wouldn't It Be Nice", 10, 6, 213),
('Baby', 10, 6, 136),
('You Make Me Feel So..', 10, 6, 83);

INSERT INTO SpotifyClone.reproductionHistory(`user_id`, music_track, track_played_on, track_id) VALUES
(1, 'Honey', '2020-02-28 10:45:55', 36),
(1, 'Walking And Man', '2020-02-28 10:45:55', 25),
(1, 'Young And Father', '2020-03-06 11:22:33', 23),
(1, 'Diamond Power ', '2020-08-05 08:05:17', 14),
(1, "Let's Be Silly", '2020-09-14 16:32:22', 15),
(2, 'I Heard I Want To Bo Alone', '2020-01-02 07:40:33', 34),
(2, 'Finding My Traditions', '2020-05-16 06:16:22', 24), 
(2, 'Without My Love', '2020-10-09 12:27:48', 21),
(2, 'Baby', '2020-09-21 13:14:46', 39),
(3, 'Magic Circus', '2020-11-13 16:55:13', 6),
(3, 'Dance With Her Own', '2020-12-05 18:38:30', 3),
(3, 'Hard And Time', '2020-07-30 10:00:00', 26),
(4, 'Reflections Of Magic', '2021-08-15 17:10:10', 2),
(4, 'I Ride Alone', '2021-07-10 15:20:30', 35),
(4, "Honey, I'm A Lone Wolf", '2021-01-09 01:44:33', 27),
(5, 'Honey, So Do I', '2020-07-03 19:33:28', 7),
(5, 'Rock His Everything', '2017-02-24 21:14:22', 12),
(5, 'Diamond Power', '2020-08-06 15:23:43', 14),
(5, 'Soul For Us', '2020-11-10 13:52:27', 1),
(6, "Wouldn't It Be Nice", '2019-02-07 20:33:48', 38),
(6, "He Heard You're Bad For Me", '2017-01-24 00:31:17', 29),
(6, "He Hopes We Can't Stay", '2017-10-12 12:35:20', 30),
(6, 'Walking And Game', '2018-05-29 14:56:41', 22),
(7, 'Time Fireworks', '2018-05-09 22:30:49', 5),
(7, 'Troubles Of My Inner Fire', '2020-07-27 12:52:58', 4),
(7, 'Celebration Of More', '2018-01-16 18:40:43', 11),
(8, 'Baby', '2018-03-21 16:56:40', 39),
(8, 'You Make Me Feel So..', '2020-10-18 13:38:05', 40),
(8, "He's Walking Away", '2019-05-25 08:14:03', 32),
(8, "He's Trouble", '2021-08-15 21:37:09', 33),
(9, 'Thang Of Thunder', '2021-05-24 17:23:45', 16),
(9, 'Words Of Her Life', '2018-12-07 22:48:52', 17),
(9, "Sweetie, Let's Go Wild", '2021-03-14 06:14:26', 8),
(9, 'She Knows', '2020-04-01 03:36:00', 9),
(10, 'History Of My Roses', '2017-02-06 08:21:34', 20),
(10, 'Without My Love', '2017-12-04 05:33:43', 21),
(10, 'Rock His Everything', '2017-07-27 05:24:49', 12),
(10, 'Home Forever', '2017-12-25 01:03:57', 13);
