SELECT
	usr.userName AS usuario,
  COUNT(rh.user_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(msc.minute_length) / 60, 2) AS total_minutos
FROM users AS usr
INNER JOIN reproductionHistory AS rh
ON rh.user_id = usr.user_id
INNER JOIN musics AS msc
ON rh.track_id = msc.track_id
GROUP BY usuario
ORDER BY usuario ASC;
