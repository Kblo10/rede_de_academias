USE rede_academias;
-- COMMIT para salvar alteracoes
-- REVOKE para reverter alteracoes

SELECT * FROM acesso ; -- limitado ou ilimitado
SELECT * FROM plano ; -- basico ou premium
SELECT * FROM alunos ; -- nome, cpf, data, tel, email
SELECT * FROM unidade ; -- redes de academia
SELECT * FROM matricula ; -- redes de academia

-- 1 Quantos alunos estão matriculados na rede de academias?
SELECT count(nome) AS total_alunos FROM alunos;

-- 2 Quais unidades estão registradas na rede?
SELECT nome FROM unidade ;

-- 3 Qual aluno tem um plano premium?
SELECT nome FROM alunos
	WHERE id_plano = 1 ;

-- 4 Qual é o telefone da Academia Norte?
SELECT telefone FROM unidade
	WHERE nome = 'Asa Norte';

-- 5 Quantos acessos Jeferson Alan fez na rede?


-- 6 Qual aluno está matriculado na Academia Sul?
SELECT a.nome AS aluno_nome, 
       u.nome AS unidade_nome
FROM alunos a
JOIN matricula m ON a.id = m.id_aluno
JOIN unidade u ON m.id_unidade = u.id
WHERE u.nome = 'Lago Sul';

SELECT CONCAT(ROUND(RAND()*10+1));

-- 7 Liste todos os acessos de Ana Lima.
-- 8 Quais alunos estão matriculados na Academia Centro?
-- 9 Quantos alunos têm plano básico?
-- 10 Qual foi a data de matrícula de Carlos Souza?