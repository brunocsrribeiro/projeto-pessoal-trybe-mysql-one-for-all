SELECT
	msc.tracks AS cancoes,
  COUNT(*) AS reproducoes
FROM reproductionHistory AS rh
INNER JOIN musics AS msc
ON msc.track_id = rh.track_id
GROUP BY cancoes
ORDER BY reproducoes DESC, cancoes ASC
LIMIT 2;