SELECT
	tracks AS nome_musica,
    CASE
		WHEN tracks LIKE '%Streets' THEN REPLACE(tracks, 'Streets', 'Code Review')
        WHEN tracks LIKE '%Her O%' THEN REPLACE(tracks, 'Her Own', 'Trybe')
        WHEN tracks LIKE '%Inner%' THEN REPLACE(tracks, 'Inner Fire', 'Project')
        WHEN tracks LIKE '%Silly' THEN REPLACE(tracks, 'Silly', 'Nice')
        WHEN tracks LIKE '%Circus' THEN REPLACE(tracks, 'Circus', 'Pull Request')
        ELSE 'Dados não encontrados'
	END AS novo_nome
FROM musics
WHERE tracks LIKE '%Streets'
OR tracks LIKE '%Her O%'
OR tracks LIKE '%Inner%'
OR tracks LIKE '%Silly'
OR tracks LIKE '%Circus'
ORDER BY nome_musica;
