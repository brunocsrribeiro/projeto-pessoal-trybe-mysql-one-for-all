SELECT
	usr.userName AS usuario,
	CASE
		WHEN MAX(YEAR(rh.track_played_on)) = 2021 THEN 'Usuário ativo'
		ELSE 'Usuário inativo'
	END AS condicao_usuario
FROM users AS usr
INNER JOIN reproductionHistory AS rh
ON rh.user_id = usr.user_id
GROUP BY usuario
ORDER BY usuario ASC;
