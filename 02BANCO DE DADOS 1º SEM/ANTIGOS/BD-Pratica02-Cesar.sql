/* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:*/
create database sprint1;
use sprint1;
/*Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
• Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
e pelo menos 5 atletas*/
create table atleta(
idAtleta	int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);

insert into atleta(idAtleta, nome, modalidade, qtdMedalha)
	   value (1, 'Carlos Silva', 'Futebol', 3),
			 (2, 'Ana Pereira', 'Natação', 5),
			 (3, 'João Souza', 'Atletismo', 2),
			 (4, 'Mariana Oliveira', 'Ginástica', 4),
			 (5, 'Lucas Santos', 'Vôlei', 6),
			 (6, 'Fernanda Costa', 'Tênis', 1),
			 (7, 'Ricardo Almeida', 'Boxe', 3),
			 (8, 'Patrícia Lima', 'Ciclismo', 2),
			 (9, 'Gabriel Rocha', 'Judô', 7),
			 (10, 'Juliana Martins', 'Futebol', 0);

-- Escreva e execute os comandos para:
-- Exibir todos os dados da tabela.
select * from atleta;
-- Atualizar a quantidade de medalhas do atleta com id=1;
update atleta set qtdMedalha= 10 where idAtleta=1;
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update atleta set qtdMedalha=20 where idAtleta = 2 or idAtleta=3;
-- Atualizar o nome do atleta com o id=4;
update atleta set nome='César Augusto' where idAtleta = 4;
-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table atleta add dtNasc date;
-- Atualizar a data de nascimento de todos os atletas;
update atleta set dtNasc='2006-04-21';
-- Excluir o atleta com o id=5;
delete from atleta where idAtleta=5;
-- Exibir os atletas onde a modalidade é diferente de natação;
select * from atleta where modalidade != 'Natação';
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from atleta where qtdMedalha >= 3;
-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify column modalidade varchar(60);
-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc atleta;
-- Limpar os dados da tabela;
truncate table atleta;



-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
 */
create table Musica (
    idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

insert into Musica(idMusica, titulo, artista, genero)
values
    (1, 'Bohemian Rhapsody', 'Queen', 'Rock'),
    (2, 'Imagine', 'John Lennon', 'Pop'),
    (3, 'Billie Jean', 'Michael Jackson', 'Pop'),
    (4, 'Shape of You', 'Ed Sheeran', 'Pop'),
    (5, 'Smells Like Teen Spirit', 'Nirvana', 'Rock'),
    (6, 'Hotel California', 'Eagles', 'Rock'),
    (7, 'Like a Rolling Stone', 'Bob Dylan', 'Rock');

-- a) Exibir todos os dados da tabela.
select * from Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table Musica add curtidas int;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
update Musica set curtidas = 1000;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table Musica modify column artista varchar(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
update Musica set curtidas = 2000 where idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update Musica set curtidas = 1500 where idMusica = 2 or idMusica = 3;

-- g) Atualizar o nome da música com o id=5;
update Musica set titulo = 'Smells Like Teen Spirit (Reworked)' where idMusica = 5;

-- h) Excluir a música com o id=4;
delete from Musica where idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
select * from Musica where genero != 'Funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica where curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
desc Musica;

-- l) Limpar os dados da tabela;
truncate table Musica;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 3 No MySQL Workbench, utilizando o banco de dados ‘sprint1’: */
use sprint1;

/* Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/
create table Filme (
    idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
);

insert into Filme (idFilme, titulo, genero, diretor)  
values 
    (1, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola'),
    (2, 'Interestelar', 'Ficção Científica', 'Christopher Nolan'),
    (3, 'Pulp Fiction', 'Crime', 'Quentin Tarantino'),
    (4, 'Batman: O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan'),
    (5, 'Forrest Gump', 'Drama', 'Robert Zemeckis'),
    (6, 'Clube da Luta', 'Suspense', 'David Fincher'),
    (7, 'A Origem', 'Ficção Científica', 'Christopher Nolan');

/* Exibir todos os dados da tabela */
select * from Filme;

/* Adicionar o campo protagonista do tipo varchar(50) na tabela */
alter table Filme add protagonista varchar(50);

/* Atualizar o campo protagonista de todos os filmes inseridos */
update Filme set protagonista = 
    case 
        when idFilme = 1 then 'Marlon Brando'
        when idFilme = 2 then 'Matthew McConaughey'
        when idFilme = 3 then 'John Travolta'
        when idFilme = 4 then 'Christian Bale'
        when idFilme = 5 then 'Tom Hanks'
        when idFilme = 6 then 'Edward Norton'
        when idFilme = 7 then 'Leonardo DiCaprio'
    end;

/* Modificar o campo diretor do tamanho 40 para o tamanho 150 */
alter table Filme modify column diretor varchar(150);

/* Atualizar o diretor do filme com id=5 */
update Filme set diretor = 'Steven Spielberg' where idFilme = 5;

/* Atualizar o diretor dos filmes com id=2 e id=7 */
update Filme set diretor = 'Denis Villeneuve' where idFilme = 2 or idFilme = 7;

/* Atualizar o título do filme com o id=6 */
update Filme set titulo = 'Se7en: Os Sete Crimes Capitais' where idFilme = 6;

/* Excluir o filme com o id=3 */
delete from Filme where idFilme = 3;

/* Exibir os filmes em que o gênero é diferente de drama */
select * from Filme where genero != 'Drama';

/* Exibir os dados dos filmes que o gênero é igual a ‘suspense’ */
select * from Filme where genero = 'Suspense';

/* Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor */
desc Filme;

/* Limpar os dados da tabela */
truncate table Filme;
             
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*4 No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
*/

create table Professor (
    idProfessor int primary key,
    nome varchar(50),
    especialidade varchar(40),
    dtNasc date
);

insert into Professor(idProfessor, nome, especialidade, dtNasc)
values
    (1, 'Carlos Silva', 'Matemática', '1980-02-20'),
    (2, 'Ana Pereira', 'Física', '1985-06-15'),
    (3, 'João Souza', 'Química', '1975-09-10'),
    (4, 'Mariana Oliveira', 'Biologia', '1990-12-30'),
    (5, 'Ricardo Almeida', 'Literatura', '1982-11-01'),
    (6, 'Fernanda Costa', 'Geografia', '1978-03-25');

-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
-- ‘assistente’ ou ‘titular’;
alter table Professor add funcao varchar(50);

-- c) Atualizar os professores inseridos e suas respectivas funções;
update Professor set funcao = 'monitor' where idProfessor = 1;
update Professor set funcao = 'titular' where idProfessor = 2;
update Professor set funcao = 'assistente' where idProfessor = 3;
update Professor set funcao = 'titular' where idProfessor = 4;
update Professor set funcao = 'monitor' where idProfessor = 5;
update Professor set funcao = 'assistente' where idProfessor = 6;

-- d) Inserir um novo professor;
insert into Professor(idProfessor, nome, especialidade, dtNasc, funcao)
values (7, 'Juliana Martins', 'História', '1987-07-22', 'titular');

-- e) Excluir o professor onde o idProfessor é igual a 5;
delete from Professor where idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
select nome from Professor where funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from Professor where funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
update Professor set dtNasc = '1979-05-10' where idProfessor = 3;

-- i) Limpar a tabela Professor;
truncate table Professor;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*5. /* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
Inserir dados na tabela, procure inserir pelo menos 3 cursos.
Execute os comandos para:
*/

create table Curso (
    idCurso int primary key,
    nome varchar(50),
    sigla varchar(3),
    coordenador varchar(50)
);

insert into Curso(idCurso, nome, sigla, coordenador)
values
    (1, 'Ciência da Computação', 'CCO', 'Carlos Silva'),
    (2, 'Engenharia Elétrica', 'EE', 'Ana Pereira'),
    (3, 'Medicina', 'MED', 'João Souza');

-- a) Exibir todos os dados da tabela.
select * from Curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'CCO';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem
-- decrescente.
select * from Curso order by coordenador desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'C%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%a';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
-- determinada letra.
select * from Curso where nome like '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from Curso where nome like '%i_';

-- j) Elimine a tabela.
drop table Curso;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 6. /* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
Escreva e execute os comandos para:
• Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
pelo sistema.
• Inserir 4 registros na tabela, mas sem informar a categoria.
*/

create table Revista (
    idRevista int auto_increment primary key,
    nome varchar(40),
    categoria varchar(30)
);

insert into Revista(nome) 
values 
    ('Veja'),
    ('Isto é'),
    ('Época'),
    ('Quatro Rodas');

-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'Notícias' where idRevista = 1;
update Revista set categoria = 'Notícias' where idRevista = 2;
update Revista set categoria = 'Atualidades' where idRevista = 3;

-- Exibir os dados da tabela novamente.
select * from Revista;

-- Inserir mais 3 registros completos.
insert into Revista(nome, categoria) 
values
    ('Cláudia', 'Moda'),
    ('Superinteressante', 'Ciência'),
    ('Caras', 'Celebridades');

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria.
desc Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop column periodicidade;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 7  No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Escreva e execute os comandos para:
• Criar a tabela chamada Serie para conter os campos: idSerie (int e chave primária da
tabela), nome (varchar, tamanho 40), qtdTemporadas (int), status (varchar, tamanho
40). Onde o status só pode ser em andamento, finalizada ou não assistida. Os valores
de idSerie devem iniciar com o valor 100 e ser incrementado automaticamente pelo
sistema.
• Inserir 4 registros na tabela.
*/

create table Serie (
    idSerie int auto_increment primary key,
    nome varchar(40),
    qtdTemporadas int,
    status varchar(40) check (status in ('em andamento', 'finalizada', 'não assistida'))
);

insert into Serie(nome, qtdTemporadas, status) 
values
    ('Stranger Things', 4, 'em andamento'),
    ('Breaking Bad', 5, 'finalizada'),
    ('Game of Thrones', 8, 'finalizada'),
    ('The Witcher', 2, 'em andamento');

-- Exibir todos os dados da tabela.
select * from Serie;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------


/* 8  /* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Carro para conter os dados: idCarro int, nome (tamanho 70), placa
(tamanho 7), marca (tamanho 20), sendo que idCarro é a chave primária da tabela.
Inserir dados na tabela, procurando colocar uma marca de carro que tenha mais de um
carro. Procure inserir pelo menos 5 carros.
O campo marca (tamanho 20) está muito pequeno. É necessário aumentar o número de
caracteres para 40.
*/

create table Carro (
    idCarro int primary key,
    nome varchar(70),
    placa varchar(7),
    marca varchar(20)
);

insert into Carro(idCarro, nome, placa, marca)
values
    (1, 'Fusca', 'ABC1234', 'Volkswagen'),
    (2, 'Gol', 'XYZ5678', 'Volkswagen'),
    (3, 'Civic', 'LMN4321', 'Honda'),
    (4, 'Fiesta', 'PQR8765', 'Ford'),
    (5, 'Corolla', 'STU5432', 'Toyota');

-- Alterar o tamanho do campo marca de 20 para 40
alter table Carro modify column marca varchar(40);

-- 1) Exibir todos os campos da tabela.
select * from Carro;

-- 2) Exibir apenas os nomes e as placas dos carros.
select nome, placa from Carro;

-- 3) Exibir apenas os dados dos carros de uma determinada marca.
select * from Carro where marca = 'Volkswagen';

-- 4) Exibir apenas os dados dos carros de uma determinada placa.
select * from Carro where placa = 'XYZ5678';

-- 5) Exibir os dados da tabela ordenados pela marca do carro.
select * from Carro order by marca;

-- 6) Exibir os dados da tabela ordenados pelo nome em ordem decrescente.
select * from Carro order by nome desc;

-- 7) Exibir os dados da tabela, dos carros cujo nome termine com uma determinada letra.
select * from Carro where nome like '%a';

-- 8) Exibir os dados da tabela, dos carros cujo marca comece com uma determinada letra.
select * from Carro where marca like 'V%';

-- 9) Exibir os dados da tabela, dos carros cuja placa tenha como segunda letra uma
-- determinada letra.
select * from Carro where placa like '_A%';

-- 10) Exibir os dados da tabela, dos carros cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from Carro where nome like '%a_';

-- 11) Atualize uma placa de algum carro. Exiba novamente os dados da tabela após a
-- atualização.
update Carro set placa = 'ZZZ0000' where idCarro = 1;
select * from Carro;

-- 12) Exclua algum carro da tabela. Exiba novamente os dados da tabela após a exclusão.
delete from Carro where idCarro = 2;
select * from Carro;

-- 13) Elimine a tabela.
drop table Carro;

/* 9 No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Restaurante para conter os dados: idRest, nome (tamanho 40), CEP
(tamanho 9), exemplo: '01515-999', tipo (tamanho 30), sendo que idRest tem um valor
numérico inteiro e é a chave primária da tabela. O tipo do restaurante é o tipo da comida que é
servida (churrascaria, italiana, japonesa, fast-food, etc)
Inserir dados na tabela, procurando colocar um tipo de restaurante que tenha mais de um
restaurante. Procure inserir pelo menos 5 restaurantes.
O campo tipo (tamanho 30) está muito pequeno. É necessário aumentar os caracteres para o
tamanho 50.
Execute os comandos para:
1) Exibir todos os dados da tabela.
2) Exibir apenas os nomes e os tipos dos restaurantes.
3) Exibir apenas os dados dos restaurantes de um determinado tipo.
4) Exibir apenas os dados dos restaurantes de um determinado CEP.
5) Exibir os dados da tabela ordenados pelo nome do restaurante.
6) Exibir os dados da tabela ordenados pelo tipo em ordem decrescente.
7) Exibir os dados da tabela, dos restaurantes cujo nome comece com uma determinada letra.
8) Exibir os dados da tabela, dos restaurantes cujo CEP termine com um determinado número.
9) Exibir os dados da tabela, dos restaurantes cujo tipo tenha como segunda letra uma
determinada letra.
10) Exibir os dados da tabela, dos restaurantes cujo nome tenha como penúltima letra uma
determinada letra.
11) Atualize o CEP de algum restaurante. Exiba novamente os dados da tabela após a
atualização.
12) Exclua algum restaurante da tabela. Exiba novamente os dados da tabela após a
exclusão.
13) Elimine a tabela. */

create table Restaurante (
    idRest int primary key,
    nome varchar(40),
    CEP varchar(9),
    tipo varchar(30)
);

insert into Restaurante(idRest, nome, CEP, tipo)
values
    (1, 'Churrascaria Gaúcha', '01515-999', 'Churrascaria'),
    (2, 'Sushi Express', '02020-888', 'Japonesa'),
    (3, 'Pizzaria Bella', '03030-777', 'Italiana'),
    (4, 'McDonalds', '04040-666', 'Fast-food'),
    (5, 'Outback', '05050-555', 'Churrascaria');

-- Alterar o tamanho do campo tipo de 30 para 50
alter table Restaurante modify column tipo varchar(50);

-- 1) Exibir todos os dados da tabela.
select * from Restaurante;

-- 2) Exibir apenas os nomes e os tipos dos restaurantes.
select nome, tipo from Restaurante;

-- 3) Exibir apenas os dados dos restaurantes de um determinado tipo.
select * from Restaurante where tipo = 'Churrascaria';

-- 4) Exibir apenas os dados dos restaurantes de um determinado CEP.
select * from Restaurante where CEP = '02020-888';

-- 5) Exibir os dados da tabela ordenados pelo nome do restaurante.
select * from Restaurante order by nome;

-- 6) Exibir os dados da tabela ordenados pelo tipo em ordem decrescente.
select * from Restaurante order by tipo desc;

-- 7) Exibir os dados da tabela, dos restaurantes cujo nome comece com uma determinada letra.
select * from Restaurante where nome like 'C%';

-- 8) Exibir os dados da tabela, dos restaurantes cujo CEP termine com um determinado número.
select * from Restaurante where CEP like '%999';

-- 9) Exibir os dados da tabela, dos restaurantes cujo tipo tenha como segunda letra uma
-- determinada letra.
select * from Restaurante where tipo like '_h%';

-- 10) Exibir os dados da tabela, dos restaurantes cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from Restaurante where nome like '%a_';

-- 11) Atualize o CEP de algum restaurante. Exiba novamente os dados da tabela após a
-- atualização.
update Restaurante set CEP = '06060-444' where idRest = 3;
select * from Restaurante;

-- 12) Exclua algum restaurante da tabela. Exiba novamente os dados da tabela após a exclusão.
delete from Restaurante where idRest = 4;
select * from Restaurante;

-- 13) Elimine a tabela.
drop table Restaurante;


/* ***************************** EXCLUIR O BANCO DE DADOS SPRINT1***************************** */
drop database sprint1;