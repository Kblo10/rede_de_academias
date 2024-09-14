USE rede_academias;

ALTER TABLE unidade RENAME COLUMN telefone TO tel;

SELECT * FROM acesso ; -- limitado ou ilimitado
SELECT * FROM plano ; -- basico ou premium
SELECT * FROM alunos ; -- nome, cpf, data, tel, email
SELECT * FROM unidade ; -- redes de academia
SELECT * FROM matricula ; -- redes de academia


-- 1 Quais alunos foram matriculados após 1º de setembro de 2024?
SELECT alunos.nome, matricula.data_matricula FROM matricula
	JOIN alunos ON alunos.id = matricula.id_aluno
	WHERE matricula.data_matricula > '2024-09-01';

-- 2 Qual foi a última data de acesso registrada para cada aluno?
SELECT alunos.nome, MAX(data_acesso) FROM acesso
	INNER JOIN alunos ON alunos.id = acesso.id_aluno
    GROUP BY alunos.nome;

-- 3 Quantos dias se passaram desde a última matrícula de cada aluno?
SELECT alunos.nome, DATEDIFF(curdate(), MAX(matricula.data_matricula)) AS diferenca_dias
	FROM matricula
    JOIN alunos ON alunos.id = matricula.id_aluno
    GROUP BY alunos.nome ;

-- 4 Quais unidades foram adicionadas após 1º de setembro de 2024?
-- ?

-- 5 Qual foi a primeira data de matrícula para cada unidade?
SELECT unidade.nome, MIN(data_matricula) FROM matricula
	JOIN unidade ON unidade.id = matricula.id_unidade
    GROUP BY unidade.nome;

-- 6 Quais alunos possuem acessos em mais de uma unidade e qual foi o primeiro acesso registrado?
SELECT a.id, a.nome, MIN(ac.data_acesso) AS primeiro_acesso FROM alunos a
	JOIN acesso ac ON a.id = ac.id_aluno
	JOIN unidade u ON ac.id_unidade = u.id
		GROUP BY a.id, a.nome
			HAVING COUNT(DISTINCT ac.id_unidade) > 1; -- DISTINCT nao traz valores dubplicados

-- 7 Quantos dias desde a última matrícula até a data atual para o aluno com CPF ''043.383.601-59''

SELECT alunos.nome, alunos.cpf, DATEDIFF(CURDATE(), MAX(matricula.data_matricula)) AS dias_desde_ultima_matricula FROM matricula
	INNER JOIN alunos ON alunos.id = matricula.id_aluno
	WHERE alunos.cpf = '043.383.601-59'
		GROUP BY alunos.nome, alunos.cpf;

-- 8 Qual a data de matrícula do aluno que foi matriculado na unidade com nome 'Asa Norte'?
SELECT alunos.nome, matricula.data_matricula FROM alunos
	JOIN matricula ON alunos.id = matricula.id_aluno
	JOIN unidade ON matricula.id_unidade = unidade.id
	WHERE unidade.nome = 'Asa Norte';

-- 9 Quais unidades não tiveram matrículas registradas no último mês?
SELECT unidade.nome FROM unidade
	LEFT JOIN matricula ON unidade.id = matricula.id_unidade
		AND matricula.data_matricula >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
		AND matricula.data_matricula < CURDATE()
	WHERE matricula.id_unidade IS NULL;

-- 10 Qual é a diferença em dias entre o primeiro e o último acesso de cada aluno?
SELECT alunos.nome, DATEDIFF(MAX(acesso.data_acesso), MIN(acesso.data_acesso)) AS diferenca_dias
	FROM alunos
	JOIN acesso ON alunos.id = acesso.id_aluno
GROUP BY alunos.id, alunos.nome;
