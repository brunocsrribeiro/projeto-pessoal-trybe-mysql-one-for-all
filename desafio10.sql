SELECT
	msc.tracks AS nome,
  COUNT(*) AS reproducoes
FROM reproductionHistory AS rh
INNER JOIN users AS usr
ON rh.user_id = usr.user_id
INNER JOIN userAccount AS ua
ON ua.account_id = usr.account_id
INNER JOIN musics AS msc
ON msc.track_id = rh.track_id
WHERE
	ua.accountType = 'gratuito' OR ua.accountType = 'pessoal'
GROUP BY nome
ORDER BY nome ASC;
