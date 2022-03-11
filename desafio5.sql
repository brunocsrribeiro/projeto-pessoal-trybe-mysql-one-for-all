SELECT
	msc.tracks AS cancao,
  COUNT(*) AS reproducoes
FROM reproductionHistory AS rh
INNER JOIN musics AS msc
ON msc.track_id = rh.track_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;