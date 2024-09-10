USE rede_academias;

SHOW TABLES ;

SELECT * FROM acesso ; -- limitado ou ilimitado
SELECT * FROM plano ; -- basico ou premium
SELECT * FROM alunos ; -- nome, cpf, data, tel, email
SELECT * FROM unidade ; -- redes de academia
SELECT * FROM matricula ; -- redes de academia

INSERT INTO unidade (nome, endereco, telefone)
	 VALUES ('Asa Norte','Qd 701','61-3388-6114'),
			('Asa Sul','Qd 708','61-3388-6004'),
            ('Noroeste','Qd 616','61-3388-5588'),
            ('Lago Norte','SHIN Qd 16','61-3388-0000'),
            ('Lago Sul','Qd SHIS Qd 07','61-3388-1010'),
            ('Planaltina','Str Tradicional','61-3388-3074');

INSERT INTO plano (tipo_plano)
	 VALUES ('Premium'),
			('Basico');
            
INSERT INTO alunos (nome, endereco, telefone, cpf, data_nasc, email, id_plano)
	VALUES ('Jeferson Alan','Q11 Cj 02','61-9-9283-6947','043.383.601-59','1994-08-01','alan@alan','1'),
		('Maria Teixeira','Q10 Cj 04','61-9-8147-6943','044.383.601-60','1993-07-01','maria@alan','2'),
            	('Cristiano Ronaldo','Q09 Cj 08','61-9-9955-6945','055.383.601-57','1992-06-01','cris@alan','1'),
            	('Marie Jane','Q07 Cj 01','61-9-8852-6984','061.383.601-56','1991-05-01','marie@alan','2'),
            	('Ana Maria','Q24 Cj 12','61-9-9128-6969','032.383.601-55','1990-10-01','ana@alan','2'),
            	('Jessica Alba','Q11 Cj 06','61-9-9998-6923','021.383.601-54','1989-11-01','jess@alan','1'),
            	('Marilia Mendonca','Q09 Cj 02','61-9-9149-6921','043.383.601-53','1994-03-01','mendonca@alan','2'),
            	('Maiara Souza','Q03 Cj 02','61-9-9249-6790','041.383.601-52','1993-12-01','mamai@alan','2'),
            	('Maraisa Souza','Q01 Cj 02','61-9-9255-6847','084.383.601-51','1992-08-01','mara@alan','2'),
            	('Patricia Poeta','Q08 Cj 10','61-9-9281-6587','099.383.601-50','1991-08-01','paty@alan','1');
            
INSERT INTO matricula (data_matricula, id_aluno, id_unidade)
	 VALUES ('2024-01-13','1','6'),
		('2024-03-17','2','5'),
		('2024-02-19','3','4'),
            	('2024-04-24','4','3'),
            	('2024-06-27','5','2'),
            	('2024-05-03','6','1'),
            	('2024-07-07','7','6'),
            	('2024-04-13','8','5'),
            	('2024-08-15','9','4'),
            	('2024-05-20','10','3');

INSERT INTO acesso (data_acesso, id_aluno, id_unidade)
	VALUES ('2024-09-10','1','6'),
		('2024-09-10','2','5'),
                ('2024-09-10','3','4'),
                ('2024-09-10','4','3'),
                ('2024-09-10','5','2'),
                ('2024-09-10','6','1'),
                ('2024-09-10','7','6'),
                ('2024-09-10','8','5'),
                ('2024-09-10','9','4'),
                ('2024-09-10','10','3');
