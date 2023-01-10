-- Consulta 1
SELECT CONVERT(VARCHAR(5), 
			DATEADD(minute,
				DATEDIFF(MINUTE, '09:00', ins.hr_inspecao)
			,0)
		,114) as total
FROM producao.Inspecao as ins
WHERE hr_inspecao IN (
	SELECT TOP 1 hr_inspecao as last_time
	FROM producao.Inspecao as i
	INNER JOIN producao.Ficha as f ON (i.cd_ficha = f.cd_ficha)
	INNER JOIN producao.Inspetor as p ON (f.cd_matricula = p.cd_matricula)
	WHERE f.dt_inspecao = '20221216' AND p.nm_inspetor = 'Trancoso Da Silva'
	ORDER BY hr_inspecao
	DESC);

-- Professor, não consegui realizar a consulta 2, provavelmente por ter abstraido o modelo de forma errada,
-- o resultado mostra apenas os horarios de trabalho e não o total.
-- Consulta 2
SELECT hr_inspecao as last_time
FROM producao.Inspecao as i
INNER JOIN producao.Ficha as f ON (i.cd_ficha = f.cd_ficha)
INNER JOIN producao.Inspetor as p ON (f.cd_matricula = p.cd_matricula)
WHERE f.dt_inspecao BETWEEN '20221201' and '20221222' AND p.nm_inspetor = 'Trancoso Da Silva';

-- Consulta 3
SELECT cd_avaliacao, COUNT(1) as recorrencia
FROM producao.Inspecao as pi
INNER JOIN producao.Ficha as pf ON (pi.cd_ficha = pf.cd_ficha)
WHERE pf.dt_inspecao BETWEEN CONVERT(datetime, '20221201')
	AND CONVERT(datetime, '20221222')
	AND cd_avaliacao != 'OK'
GROUP BY cd_avaliacao
ORDER BY recorrencia DESC;

-- Consulta 4
SELECT nm_inspetor, COUNT(1) as	produtos_tr
FROM producao.Inspetor as pi
INNER JOIN producao.Ficha as pfi ON (pi.cd_matricula = pfi.cd_matricula)
INNER JOIN producao.Inspecao as pin ON (pfi.cd_ficha = pin.cd_ficha)
WHERE pin.cd_avaliacao = 'TR'
GROUP BY nm_inspetor
ORDER BY produtos_tr DESC;

-- Consulta 5
SELECT CONCAT(cd_produto, '.', linha_produto, '.', aa_produto) as cod_produto
FROM producao.Inspecao
WHERE cd_avaliacao = 'OK' AND cd_produto IN (
    SELECT cd_produto
    FROM producao.Inspecao
    GROUP BY cd_produto
    HAVING COUNT(distinct cd_avaliacao) > 1);