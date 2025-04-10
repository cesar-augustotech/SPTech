/*
					BD – EXERCÍCIOS – PRÁTICA 04 
1. No MySQL Workbench, utilizando o banco de dados ‘sprint2’: 
Fazer a modelagem lógica e física conforme a regra de negócio:  
• 1 professor leciona 1 ou muitas disciplinas; 
• 1 disciplina é lecionada por apenas 1 professor; 

*/
create database sprint2;
use sprint2;

/* Criar a tabela chamada Professor para conter os dados: idProfessor, nome 
(tamanho 50), sobrenome (tamanho 30), especialidade1 (tamanho 40), 
especialidade2 (tamanho 40), sendo que idProfessor é a chave primária da tabela. 
Inserir pelo menos uns 6 professores.  */
CREATE TABLE Professor (
    idProfessor 	INT PRIMARY KEY,
    nome 			VARCHAR(50),
    sobrenome 		VARCHAR(30),
    especialidade1 	VARCHAR(40),
    especialidade2 	VARCHAR(40)
);

INSERT INTO Professor (idProfessor, nome, sobrenome, especialidade1, especialidade2) 
VALUES 
(1, 'Carlos', 'Silva', 'Matemática', 'Física'),
(2, 'Ana', 'Oliveira', 'Química', 'Biologia'),
(3, 'Lucas', 'Pereira', 'Filosofia', 'Sociologia'),
(4, 'Mariana', 'Costa', 'História', 'Geografia'),
(5, 'Ricardo', 'Almeida', 'Literatura', 'Redação'),
(6, 'Juliana', 'Ferreira', 'Geografia', 'História');


/* Criar a tabela chamada Disciplina para conter os dados: idDisc, nomeDisc 
(tamanho 45), sendo que idDisc é a chave primária da tabela. 
Inserir pelo menos 3 disciplinas. */

CREATE TABLE Disciplina (
	idDisc int primary key auto_increment,
    nomeDisc varchar(45)
);
INSERT INTO Disciplina (idDisc, nomeDisc) 
VALUES 
(1, 'Matemática'),
(2, 'Física'),
(3, 'Química'),
(4, 'Biologia');


/*
Escreva e execute os comandos para: 
• Configurar a chave estrangeira na tabela conforme sua modelagem (Pode 
fazer no comando CREATE TABLE); 
• Exibir os professores e suas respectivas disciplinas; 
• Exibir apenas o nome da disciplina e o nome do respectivo professor; 
• Exibir os dados dos professores, suas respectivas disciplinas de um 
determinado sobrenome; 
• Exibir apenas a especialidade1 e o nome da disciplina, de um determinado 
professor, ordenado de forma crescente pela especialidade1; 
*/

alter table Professor add column fkDisc int;
UPDATE Professor SET fkDisc = (1 + (RAND() * 3));
alter table Professor add constraint fk_Professor_Disciplina foreign key (fkDisc) REFERENCES Disciplina(idDisc);

select * 
FROM Professor p 
INNER JOIN Disciplina d ON idDisc = fkDisc;

SELECT p.nome, d.nomeDisc
FROM Professor p
INNER JOIN Disciplina d ON idDisc = fkDisc; 

SELECT *
	FROM Professor p 
		INNER JOIN Disciplina d ON idDisc = fkDisc
			WHERE p.sobrenome = 'Silva';
            
SELECT * 
	FROM Professor p
		INNER JOIN Disciplina d ON idDisc= fkDisc
		WHERE p.idProfessor = 1	ORDER BY p.especialidade1;
        
/* *************************************************************************************** */

/*
2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’: 
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), 
sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela. 
*/
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

/*Inserir dados na tabela, procure inserir pelo menos 3 cursos.*/
INSERT INTO Curso (idCurso, nome, sigla, coordenador) 
VALUES 
(1, 'Ciência da Computação', 'CCO', 'Dr. Ana Souza'),
(2, 'Engenharia Civil', 'ENG', 'Prof. Marcos Silva'),
(3, 'Administração', 'ADM', 'Profa. Juliana Costa');

/* Crie uma regra de negócio com uma nova tabela a sua escolha. Relacione a 
tabela que você criou com a tabela curso e insira ou atualize os dados; */
CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY,
    nome VARCHAR(50),
    idCurso INT,
    dataNascimento DATE,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

INSERT INTO Aluno (idAluno, nome, idCurso, dataNascimento) 
VALUES 
(1, 'Pedro Lima', 1, '2000-03-15'),
(2, 'Joana Pereira', 2, '1999-07-25'),
(3, 'Carlos Silva', 3, '1998-11-30');




/*
Execute os comandos para: 
a) Crie a Modelagem Lógica; 
b) Faça um JOIN entre as duas tabelas; 
c) Faça um JOIN com WHERE entre as duas tabelas; 
d) Crie um campo com a restrição (constraint) de CHECK;
*/

SELECT *
FROM Aluno a
JOIN Curso c ON a.idCurso = c.idCurso;


SELECT a.idAluno, a.nome AS aluno_nome, c.nome AS curso_nome
FROM Aluno a
JOIN Curso c ON a.idCurso = c.idCurso
WHERE c.nome = 'Ciência da Computação';

ALTER TABLE Curso
ADD COLUMN quantidadeVagas INT,
ADD CONSTRAINT check_quantidadeVagas CHECK (quantidadeVagas > 0);



