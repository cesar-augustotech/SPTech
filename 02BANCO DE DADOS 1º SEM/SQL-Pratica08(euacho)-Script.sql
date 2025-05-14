DROP DATABASE IF EXISTS exercicio08;
CREATE DATABASE exercicio08;
use exercicio08;

/* */
CREATE TABLE grupo(
id		int primary key auto_increment,
nome	varchar(45),
descricao	varchar(300)
);
CREATE TABLE aluno(
ra	   	int primary key,
nome	varchar(45),
email	varchar(100),
fkGrupo int,
FOREIGN KEY (fkGrupo) REFERENCES grupo(id)
);
CREATE TABLE professor(
id 		int primary key auto_increment,
nome 	varchar(45),
disciplina 	varchar(45)
)auto_increment=10000;

CREATE TABLE grupo_professor(
fkProfessor 	int,
fkGrupo			int,
hrAvaliacao 	datetime,
nota 			decimal(2,1),
FOREIGN KEY (fkProfessor) REFERENCES professor(id),
FOREIGN KEY (fkGrupo) REFERENCES grupo(id),
PRIMARY KEY (fkProfessor, fkGrupo)
);

/* */
INSERT INTO grupo(nome, descricao)
	VALUES('Sentinela', 'Monitoramento de temperatura - distribuidoras de carne'),('Umido',"Monitoramento de umidade em plantações");
    
INSERT INTO aluno(ra, nome, email, fkGrupo)
	VALUES	('04251125', 'César Augusto', 'cesar.miguel@sptech.school', 2),
			('04251126', 'Sarah Mayumi', 'sarah.miguel@sptech.school', 2),
            ('04251127', 'Bill Hebert', 'bill.miguel@sptech.school', 1);
            
INSERT INTO professor(nome, disciplina)
	VALUES	('Marcelo Rosim', 'Banco de Dados'),
			('Marcio Santana', 'Introdução a SO');
            
INSERT INTO grupo_professor(fkProfessor, fkGrupo, hrAvaliacao, nota)
	VALUES	(10001,1, '2025-05-09 23:04:17', 7.5),
			(10000,1, '2025-05-09 23:04:17', 8.5),
			(10001,2, '2025-05-10 23:04:17', 9.5),
			(10000,2, '2025-05-10 23:04:17', 9.5);

/* */
select * from grupo;
select * from aluno;
select * from professor;
select * from grupo_professor;

/* */
select * from grupo g INNER JOIN aluno a ON a.fkGrupo = g.id;

/* */
select * from grupo g INNER JOIN aluno a ON a.fkGrupo = g.id WHERE g.nome = 'Umido';

/* */
select g.nome, avg(gp.nota) from grupo_professor gp INNER JOIN grupo g ON g.id = gp.fkGrupo GROUP BY g.nome;

/* */
select 






