SELECT
	art.artistName AS artista,
	alb.title AS album
FROM artist AS art
INNER JOIN albuns AS alb
ON alb.artist_id = art.artist_id
LIMIT 2;
