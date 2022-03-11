SELECT
	COUNT(DISTINCT m.tracks) AS cancoes,
  COUNT(DISTINCT art.artistName) AS artistas,
  COUNT(DISTINCT alb.title) AS albuns
FROM musics AS m
INNER JOIN albuns AS alb
ON alb.album_id = m.album_id
INNER JOIN artist AS art
ON art.artist_id = alb.artist_id;
