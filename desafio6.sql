SELECT
	MIN(acc.price) AS faturamento_minimo,
  MAX(acc.price) AS faturamento_maximo,
	ROUND(
		AVG(acc.price) *
        (SELECT COUNT(user_id) FROM users) / 
        (SELECT COUNT(user_id) FROM users), 2
	) AS faturamento_medio,
  SUM(acc.price) AS faturamento_total
FROM userAccount AS acc
INNER JOIN users AS usr
ON acc.account_id = usr.account_id;
