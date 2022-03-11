SELECT
	COUNT(rh.user_id) AS quantidade_musicas_no_historico
FROM users AS usr
INNER JOIN reproductionHistory AS rh
ON rh.user_id = usr.user_id
WHERE userName = 'Bill';
