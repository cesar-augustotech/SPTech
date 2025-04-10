/*
Banco de Dados - Pratica 01 - 12/02 - César Augusto Araujo Miguel 1CCOB
*/
-- ------------------------------------EXERCÍCIO 1------------------------------------

-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
create database sprint1;

use sprint1;

-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da 
-- tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha 
-- (int, representando a quantidade de medalhas que o atleta possui)
CREATE TABLE atleta (
    idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade

insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (1, 'GIOVANNA', 'Volei', 1); 

insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (2, 'ISABELA', 'Volei', 1); 

insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (3, 'GUILHERME', 'Natacao', 2),
       (4, 'PAULO', 'Basquete', 1),
       (5, 'LUCAS', 'Basquete', 3),
       (6, 'GUSTAVO', 'Basquete', 0),
       (7, 'BIANCA', 'Volei de Praia', 1),
       (8, 'ANA', 'Volei de Praia', 1),
       (9, 'AMANDA', 'Volei', 2),
       (10, 'PEDRO', 'Futebol', 0),
       (11, 'CARLOS', 'Tenis', 1),
       (12, 'MARCOS', 'Tenis', 2),
       (13, 'RENATA', 'Ginastica', 3),
       (14, 'LARISSA', 'Ginastica', 2),
       (15, 'FERNANDA', 'Natação', 1),
       (16, 'RODRIGO', 'Atletismo', 0),
       (17, 'CAMILA', 'Atletismo', 1),
       (18, 'TATIANA', 'Volei', 3),
       (19, 'RAFAEL', 'Futebol', 0),
       (20, 'GABRIEL', 'Basquete', 1);
-- Exibir todos os dados da tabela.
select * from atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from atleta where modalidade = 'volei';

-- Exibir os dados da tabela ordenados pela modalidade.
select * from atleta order by  modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from atleta order by  qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from atleta where nome like '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from atleta where nome like 'a%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from atleta where nome like '%o';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from atleta where nome like '%r_';

-- Eliminar a tabela.
drop table atleta;





-- ------------------------------------EXERCÍCIO 2------------------------------------


-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
 
 use sprint1;
/*
 Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
*/
create table Musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);



insert into Musica(idMusica, titulo, artista, genero) 
values (1,'A','SARAH', 'Rock'),
       (2,'DONA','LUCAS', 'Rock'),
       (3,'ARANHA','GUSTAVO', 'Rock'),
       (4,'SUBIU','LEONARDO', 'K-pop'),
       (5,'PELA','ANA', 'K-pop'),
       (6,'PAREDE','MATHEUS', 'K-pop'),
       (7,'VEIO', 'PEDRO', 'K-pop'),
       (8,'A','BILL', 'Funk'),
       (9,'CHUVA','ENZO', 'Funk'),
       (10,'FORTE','CESAR', 'Funk'),
       (11,'E','SARAH', 'Rock'),
       (12,'A','LUCAS', 'Rock'),
       (13,'DERRUBOU','GUSTAVO', 'Rock'),
       (14,'JÁ','LEONARDO', 'Funk'),
       (15,'PASSOU','ANA', 'Funk'),
       (16,'A','MATHEUS', 'Funk'),
       (17,'CHUVA','PEDRO', 'Rap'),
       (18,'O','BILL', 'Rap'),
       (19,'SOL','ENZO', 'Rap'),
	   (20,'ESTÁ','CÉSAR', 'Rap');

-- a) Exibir todos os dados da tabela
select * from Musica;       
-- b) Exibir apenas os títulos e os artistas das músicas
select titulo, artista from Musica;
-- c) Exibir apenas os dados das músicas de um determinado gênero. 
select * from Musica where genero = 'K-pop';
-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from Musica where artista = 'César';
-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;
-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente. 
select * from Musica order by artista desc;
-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
select * from Musica where titulo like 'a%';
-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
select * from Musica where artista like '%a';
-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
select * from Musica where genero like '_a%';
-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
select * from Musica where titulo like '%h_';
-- k) Elimine a tabela
drop table Musica;




-- ------------------------------------EXERCÍCIO 3------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/*
 Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero 
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela. 
*/
create table Filme(
idFilme    int primary key,
titulo    varchar(50),
genero    varchar(40),
diretor    varchar(40)
);

/* Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um 
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos 
uns 7 filmes.*/

insert into Filme(idFilme, titulo, genero, diretor) 
  values (1, 'Pulp Fiction', 'Comédia', 'Quentin Tarantino'), 
  (2, 'The Godfather', 'Crime', 'Francis Ford Coppola'), 
  (3, 'The Shawshank Redemption', 'Drama', 'Frank Darabont'), 
  (4, 'Forrest Gump', 'Drama', 'Robert Zemeckis'), 
  (5, 'The Dark Knight', 'Ação', 'Christopher Nolan'),
  (6, 'Inception', 'Ficção Científica', 'Christopher Nolan'),
  (7, 'The Matrix', 'Ficção Científica', 'Lana Wachowski, Lilly Wachowski'), 
  (8, 'The Lord of the Rings: The Return of the King', 'Aventura', 'Peter Jackson'),
  (9, 'Gladiator', 'Ação', 'Ridley Scott'), 
  (10, 'The Silence of the Lambs', 'Suspense', 'Jonathan Demme'),
  (11, 'Schindler\'s List', 'História', 'Steven Spielberg'),
  (12, 'Fight Club', 'Drama', 'David Fincher'), 
  (13, 'The Empire Strikes Back', 'Ficção Científica', 'Irvin Kershner'), 
  (14, 'Inglourious Basterds', 'Guerra', 'Quentin Tarantino'), 
  (15, 'Interstellar', 'Ficção Científica', 'Christopher Nolan'),
  (16, 'Goodfellas', 'Crime', 'Martin Scorsese'),
  (17, 'Avatar', 'Ficção Científica', 'James Cameron'),
  (18, 'The Prestige', 'Mistério', 'Christopher Nolan'),
  (19, 'Parasite', 'Drama', 'Bong Joon-ho'), 
  (20, 'Citizen Kane', 'Drama', 'Orson Welles'); 


-- a) exibir todos os dados da tabela.
select * from filme;

-- b) exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from filme;

-- c) exibir apenas os dados dos filmes de um determinado gênero.
select * from filme where genero = 'Drama';

-- d) exibir apenas os dados dos filmes de um determinado diretor.
select * from filme where diretor = 'James Cameron';

--  e) exibir os dados da tabela ordenados pelo título do filme.
select * from filme order by titulo;

-- f) exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from filme order by diretor desc;

-- g) exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from filme where titulo like 'a%';

-- h) exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select * from filme where diretor like '%a';

-- i) exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from filme where genero like '_a%';

-- j) exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from filme where titulo like '%a_';

-- k) elimine a tabela.
drop table filme;




-- ------------------------------------EXERCÍCIO 4 -----------------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’: 
  use sprint1;
  
  /*Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50), 
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da 
tabela*/
  create table Professor(
  idProfessor   int primary key,
  nome    varchar(40),
  especialidade   varchar(40),
  dtNasc DATE );
  
  /* Inserir dados na tabela, procurando colocar uma especialista para mais de um professor. 
Procure inserir pelo menos uns 6 professores.*/
  
  insert into Professor (idProfessor, nome, especialidade, dtNasc) values
(1, 'Ana Silva', 'Matemática', '1980-05-15'),
(2, 'Carlos Oliveira', 'Física', '1975-11-23'),
(3, 'Maria Souza', 'Biologia', '1982-02-10'),
(4, 'João Lima', 'História', '1970-06-18'),
(5, 'Fernanda Alves', 'Química', '1987-09-30'),
(6, 'Rafael Cardoso', 'Matemática', '1985-12-05'),
(7, 'Juliana Ferreira', 'Física', '1989-03-25'),
(8, 'Bruno Rocha', 'História', '1978-07-19'),
(9, 'Patrícia Costa', 'Biologia', '1984-04-12'),
(10, 'Lucas Mendes', 'Química', '1981-08-22'),
(11, 'Renata Barros', 'Matemática', '1977-01-05'),
(12, 'Eduardo Almeida', 'Física', '1983-10-09'),
(13, 'Vivian Martins', 'História', '1979-05-28'),
(14, 'Paulo Moreira', 'Biologia', '1986-11-15'),
(15, 'Carolina Santos', 'Química', '1990-03-06'),
(16, 'Diego Nunes', 'Matemática', '1988-07-01'),
(17, 'Luciana Ribeiro', 'Física', '1982-09-17'),
(18, 'Gustavo Teixeira', 'História', '1976-12-21'),
(19, 'Camila Antunes', 'Biologia', '1985-04-03'),
(20, 'André Castro', 'Química', '1987-06-13');
  
  
  -- a) Exibir todos os dados da tabela.
select * from professor;

-- b) Exibir apenas as especialidades dos professores.
select especialidade from professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from professor where especialidade = 'determinada_especialidade';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from professor order by nome;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from professor order by dtNasc desc;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from professor where nome like 'letra%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from professor where nome like '%letra';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from professor where nome like '_letra%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from professor where nome like '%letra_';

-- j) Elimine a tabela.
drop table professor;




-- ----------------------------------------------- EXERCÍCIO 5 -- -----------------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’: 
  use sprint1;
  
  /*Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla 
  (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.*/
  
  create table Curso(
  idCurso  int primary key,
  nome varchar(50),
  sigla varchar(50),
  coordenador varchar(40));
  
  
insert into curso (idCurso, nome, sigla, coordenador) values
(1, 'Engenharia Civil', 'ECV', 'Dr. Ana Silva'),
(2, 'Medicina', 'MED', 'Dra. Maria Souza'),
(3, 'Direito', 'DIR', 'Dr. João Lima'),
(4, 'Administração', 'ADM', 'Dra. Fernanda Alves'),
(5, 'Psicologia', 'PSI', 'Dra. Juliana Ferreira'),
(6, 'Engenharia Civil', 'ECV', 'Dr. Ana Silva'),
(7, 'Medicina', 'MED', 'Dra. Maria Souza'),
(8, 'Direito', 'DIR', 'Dr. João Lima'),
(9, 'Administração', 'ADM', 'Dra. Fernanda Alves'),
(10, 'Psicologia', 'PSI', 'Dra. Juliana Ferreira'),
(11, 'Engenharia Civil', 'ECV', 'Dr. Ana Silva'),
(12, 'Medicina', 'MED', 'Dra. Maria Souza'),
(13, 'Direito', 'DIR', 'Dr. João Lima'),
(14, 'Administração', 'ADM', 'Dra. Fernanda Alves'),
(15, 'Psicologia', 'PSI', 'Dra. Juliana Ferreira'),
(16, 'Engenharia Civil', 'ECV', 'Dr. Ana Silva'),
(17, 'Medicina', 'MED', 'Dra. Maria Souza'),
(18, 'Direito', 'DIR', 'Dr. João Lima'),
(19, 'Administração', 'ADM', 'Dra. Fernanda Alves'),
(20, 'Psicologia', 'PSI', 'Dra. Juliana Ferreira');


-- a) Exibir todos os dados da tabela.
select * from curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla = 'ADM';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from curso order by coordenador desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where nome like 'e%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where nome like '%a';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where nome like '_d%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from curso where nome like '%i_';

-- j) Elimine a tabela.
drop table Curso;


-- ------------------------------------------------ EXERCÍCIO 6 ------------------------------------------------- 
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’: 
  use sprint1;
  
  -- Criar a tabela chamada Revista
create table revista (
    idRevista int auto_increment primary key,
    nome varchar(40),
    categoria varchar(30)
);

-- Inserir 4 registros na tabela, sem informar a categoria
insert into revista (nome) values ('Veja');
insert into revista (nome) values ('Isto é');
insert into revista (nome) values ('Epoca');
insert into revista (nome) values ('Quatro Rodas');


-- Exibir todos os dados da tabela.
select * from revista;
-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update revista set categoria = 'beleza' where nome = 'Veja';
update revista set categoria = 'Notícia' where nome = 'Isto é';
update revista set categoria = 'História' where nome = 'Epoca';
update revista set categoria = 'Auto-mobilística' where nome = 'Quatro Rodas';
select * from revista;

-- Insira mais 3 registros completos.
insert into revista (nome, categoria) values ('Claudia', 'Moda');
insert into revista (nome, categoria) values ('Superinteressante', 'Ciência');
insert into revista (nome, categoria) values ('Casa e Jardim', 'Decoração');

-- Exibir novamente os dados da tabela.
select * from revista;
-- Exibir a descrição da estrutura da tabela.
describe revista;
-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revista modify categoria varchar(40);
-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria.
describe revista;
-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revista add column periodicidade varchar(15);
-- Exibir os dados da tabela.
select  * from revista;
-- Excluir a coluna periodicidade da tabela.
alter table revista drop column periodicidade;  
  
 --  *************************************************************** EXCLUIR O BANCO DE DADOS SPRINT1******************************************************** 
  drop database sprint1;
  