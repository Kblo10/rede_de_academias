CREATE DATABASE IF NOT EXISTS rede_academias ;

USE rede_academias;

CREATE TABLE IF NOT EXISTS unidade (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
endereco VARCHAR(45) NOT NULL,
telefone VARCHAR(15) NOT NULL, 
PRIMARY KEY(id)
); 

CREATE TABLE IF NOT EXISTS plano (
id INT NOT NULL AUTO_INCREMENT,
tipo_plano VARCHAR(10) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS alunos (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
endereco VARCHAR(45) NOT NULL,
telefone VARCHAR(15) NOT NULL,
cpf VARCHAR(14) NOT NULL,  
data_nasc DATE NOT NULL,
email VARCHAR (30) NOT NULL,
id_plano INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_plano) REFERENCES plano(id)
);

CREATE TABLE IF NOT EXISTS matricula (
id INT NOT NULL AUTO_INCREMENT,
data_matricula DATETIME NOT NULL,
id_aluno INT NOT NULL,
id_unidade INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_aluno) REFERENCES alunos(id),
FOREIGN KEY (id_unidade) REFERENCES unidade(id)
 );
 
CREATE TABLE IF NOT EXISTS acesso (
id INT NOT NULL AUTO_INCREMENT,
data_acesso DATETIME NOT NULL,
id_aluno INT NOT NULL,
id_unidade INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_aluno) REFERENCES alunos(id),
FOREIGN KEY (id_unidade) REFERENCES unidade(id)
 );
