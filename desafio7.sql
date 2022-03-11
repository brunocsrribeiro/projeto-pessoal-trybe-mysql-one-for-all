SELECT
	art.artistName AS artista,
	alb.title AS album,
	COUNT(fav.user_id) AS seguidores
FROM artist AS art
INNER JOIN albuns AS alb
ON art.artist_id = alb.artist_id
INNER JOIN favoriteArtist AS fav
ON fav.artist_id = art.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;
