
DROP DATABASE IF EXISTS AlunoProjeto;

/* Fazer a modelagem lógica de um sistema para cadastrar os alunos da
faculdade, seus projetos e seus acompanhantes que eles poderão
trazer no dia da apresentação final do projeto.
- Cada aluno participa apenas de um projeto.
- Cada projeto pode ter a participação de um ou mais alunos.
- Cada aluno pode trazer zero ou mais acompanhantes.
- Há alguns alunos que atuam como representantes de outros alunos.
Qualquer problema ou queixa que os alunos tiverem, devem falar com o
aluno que os representa. O aluno representante, por sua vez, reporta os
problemas/queixas à equipe de socioemocional.
- Cada aluno é representado apenas por um aluno*/

/* Criar um banco de dados AlunoProjeto no MySQL, selecionar esse
banco de dados e executar as instruções relacionadas a seguir.*/
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

/*- Criar as tabelas equivalentes à modelagem. */
CREATE TABLE projeto (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	descricao VARCHAR(200)
);

CREATE TABLE aluno (
	ra INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	telefone BIGINT, 
	fkProjeto INT,
	fkRepresentante INT,
	CONSTRAINT fk_aluno_projeto FOREIGN KEY (fkProjeto) REFERENCES projeto(id),
	CONSTRAINT fk_aluno_representante FOREIGN KEY (fkRepresentante) REFERENCES aluno(ra)
)AUTO_INCREMENT = 1000;

CREATE TABLE acompanhante (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	parentesco VARCHAR(45),
	fkAluno INT,
	CONSTRAINT fk_acompanhante_aluno FOREIGN KEY (fkAluno) REFERENCES aluno(ra)
);

/* Inserir dados nas tabelas.*/
INSERT INTO projeto (nome, descricao)
	   VALUES		('Sentinela', 'Monitoramento de temperatura na cadeia de frio da carne'),
					('Umido','Monitoramento de umidade no plantio para prevenção de queimadas')
;

INSERT INTO aluno (nome, telefone, fkProjeto, fkRepresentante)
	   VALUES	('César Augusto','11910788879',2,null),
				('Leonardo Tanaka','11910101010',2,1000),
                ('Sarah Mayumi','11910101010',2,1000),
                ('Ana Clara','11910101010',1,1002);
             
INSERT INTO acompanhante	(nome, parentesco, fkAluno)
				VALUES		('Caio Augusto', 'irmão', 1000),
							('Fabio Shimada', 'pai', 1002);
                            
                            
/* Exibir todos os dados de cada tabela criada, separadamente. */
SELECT * FROM projeto; SELECT * FROM aluno; SELECT * FROM acompanhante;

/*Exibir os dados dos alunos e dos projetos correspondentes.*/
SELECT * FROM aluno a INNER JOIN projeto p ON p.id = a.fkProjeto; 

/*Exibir os dados dos alunos e dos seus acompanhantes.*/
SELECT * FROM acompanhante acom INNER JOIN aluno al ON al.ra = acom.fkAluno; 

/*Exibir os dados dos alunos e dos seus representantes.*/
SELECT * FROM aluno a LEFT JOIN aluno a2 ON a2.ra = a.fkRepresentante;

/*Exibir os dados dos alunos e dos projetos correspondentes, mas somente
de um determinado projeto (indicar o nome do projeto na consulta). Projeto Umido*/
SELECT a.* , p.* FROM aluno a INNER JOIN projeto p ON p.id = a.fkProjeto WHERE p.nome = 'Umido';

/* Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.*/
SELECT * FROM acompanhante acom INNER JOIN aluno a ON a.ra = acom.fkAluno INNER JOIN projeto p ON p.id = a.fkProjeto;



/* 
2. Fazer a modelagem lógica de um sistema para cadastrar as campanhas de
doações que surgiram devido ao Covid-19 e os organizadores dessas
campanhas
- Cada organizador organiza mais de uma campanha de doação.
- Cada campanha de doação é organizada por apenas um organizador.
- Sobre cada organizador, o sistema guarda um identificador, que identifica de
forma única cada organizador. Esse identificador começa com o valor 30 e é
inserido de forma automática. Além desse identificador, o sistema guarda o
nome, o endereço (composto pelo nome da rua e bairro) e o e-mail do
organizador. - Sobre cada campanha de doação, o sistema guarda um identificador, que
identifica de forma única cada campanha. Esse identificador começa com o valor
500 e é inserido de forma automática. O sistema também guarda a categoria da
doação (ex: alimento ou produto de higiene, ou máscaras de proteção, etc), a
instituição para a qual será feita a doação (pode haver até 2 instituições) e a data
final da campanha.
- Um organizador mais experiente orienta outros organizadores novatos. Cada
organizador novato é orientado apenas por um organizador mais experiente.
*/
DROP DATABASE IF EXISTS campanha;
CREATE DATABASE campanha;
use campanha;

CREATE TABLE organizador(
id 					int primary key auto_increment,
nome	            varchar(45),
endereco			varchar(200),
email				varchar(45),
fkOrientador 		int,
CONSTRAINT fk_organizador_orientador FOREIGN KEY (fkOrientador) REFERENCES organizador(id)
)auto_increment = 30;

CREATE TABLE campanha(
id					int primary key auto_increment,
categoria			varchar(45),
instituicao			varchar(45),
dataFinal			date,
fkOrganizador		int,
CONSTRAINT fk_campanha_organizador FOREIGN KEY (fkOrganizador) REFERENCES organizador(id)
)auto_increment=500;

/* 
d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para
algum organizador, e mais de um organizador novato sendo orientado por algum
organizador mais experiente.
*/
INSERT INTO organizador (nome, endereco, email, fkOrientador)
		VALUES 			('César Augusto', 'Rua Ana ventura nitão, bairro pirapora', 'cesar@sptech.school', null),
						('Sarah Mayumi', 'Rua Ana ventura nitão, bairro pirapora', 'sarah@sptech.school', 30),
						('Leonardo Tanaka', 'Rua Ana ventura nitão, bairro pirapora', 'leonardo@sptech.school', 30),
                        ('Ana Clara', 'Rua Ana ventura nitão, bairro pirapora', 'ana@sptech.school', 31);
                        
INSERT INTO campanha 	(categoria, instituicao, dataFinal, fkOrganizador)
		VALUES			('Higiene', 'Ajuda-19', '2025-04-15', 30),
						('Proteção', 'Batatinha-19', '2025-05-15',30),
						('Proteção', 'Ajuda-19', '2025-05-15', 31),
                        ('Saúde', 'Ajuda-19', '2025-05-15', 32),
                        ('Saúde', 'Batatinha-19', '2025-05-15', 33)
;

/* e) Exibir todos os dados de cada tabela criada, separadamente.*/
SELECT * FROM organizador;
 SELECT * FROM campanha;
 
 /* g) Exibir os dados dos organizadores e os dados de suas respectivas
campanhas.*/
SELECT * FROM campanha c INNER JOIN organizador o ON o.id = c.fkOrganizador;

/* h) Exibir os dados de um determinado organizador (informar o nome do
organizador na consulta) e os dados de suas respectivas campanhas.*/
SELECT * FROM campanha c INNER JOIN organizador o ON o.id = c.fkOrganizador WHERE o.nome = 'César Augusto';

/* i) Exibir os dados dos organizadores novatos e os dados dos respectivos
organizadores orientadores. */
SELECT * FROM organizador o LEFT JOIN organizador ori ON ori.id = o.fkOrientador;

/* J) Exibir os dados dos organizadores novatos e os dados dos respectivos
organizadores orientadores, porém somente de um determinado organizador
orientador (informar o nome do organizador orientador na consulta).*/
SELECT * FROM organizador o LEFT JOIN organizador ori ON ori.id = o.fkOrientador WHERE ori.nome = 'César Augusto';

/* l) Exibir os dados dos organizadores novatos, os dados das respectivas
campanhas organizadas e os dados dos respectivos organizadores
orientadores.*/
SELECT * FROM campanha c INNER JOIN organizador o ON o.id = c.fkOrganizador INNER JOIN organizador ori ON ori.id = o.fkOrientador;

/*m) Exibir os dados de um organizador novato (informar o seu nome na consulta),
os dados das respectivas campanhas em que trabalha e os dados do seu
organizador orientador.*/
SELECT * FROM campanha c INNER JOIN organizador o ON o.id = c.fkOrganizador INNER JOIN organizador ori ON ori.id = o.fkOrientador WHERE o.nome = 'Sarah Mayumi';



