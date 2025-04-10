-- **************************************BD – EXERCÍCIOS – PRÁTICA 03*******************************
/*
Crie um banco de dados chamado Sprint2;
Use o banco de dados Sprint2;
*/
CREATE DATABASE Sprint2;
USE Sprint2;
/*
Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40),
qtdMedalha (int, representando a quantidade de medalhas que o atleta possui)
• Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
e pelo menos 5 atletas.
*/
CREATE TABLE atleta (
idAtleta		int primary key auto_increment,
nome 			varchar(40),
modalidade		varchar(40),
qtdMedalha		int
);

INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha)
VALUES
(1, 'Carlos Silva', 'Atletismo', 5),
(2, 'Fernanda Lima', 'Atletismo', 3),
(3, 'João Souza', 'Natação', 8),
(4, 'Paula Costa', 'Natação', 4),
(5, 'Ricardo Pereira', 'Futebol', 7);
 
/*• Criar uma tabela chamada País para conter os dados: idPais (int e chave primária da
tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
• Inserir pelo menos 4 países na tabela país.
*/
CREATE TABLE pais (
idPais		int primary key auto_increment,
nome		varchar(30),
capital		varchar(40)
);

INSERT INTO pais (idPais, nome, capital)
VALUES
(1, 'Brasil', 'Brasília'),
(2, 'Alemanha', 'Berlim'),
(3, 'Japão', 'Tóquio'),
(4, 'França', 'Paris');

/* Escreva e execute os comandos para:
• Criar a chave estrangeira na tabela correspondente conforme modelagem */

ALTER TABLE atleta ADD COLUMN fkPais int;
ALTER TABLE atleta ADD CONSTRAINT fkPais FOREIGN KEY (fkPais) REFERENCES pais(idPais); 

/*Atualizar o país de todos os atletas;
• Exibir os atletas e seu respectivo país;
• Exibir apenas o nome do atleta e o nome do respectivo país;
• Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;*/
UPDATE atleta SET fkPais = 3 WHERE idAtleta = 1 OR idAtleta = 2;
UPDATE atleta SET fkPais = 1 WHERE idAtleta = 3 OR idAtleta = 4;
UPDATE atleta SET fkPais = 2 WHERE idAtleta = 5;

SELECT *
	FROM atleta
		INNER JOIN pais AS p ON idPais = fkPais;
SELECT a.nome, p.nome
	FROM atleta AS a
		INNER JOIN pais AS p ON idPais = fkPais;

SELECT a.nome, a.modalidade, a.qtdMedalha, p.nome
	FROM atleta AS a
		INNER JOIN pais AS p ON idPais = fkPais
        WHERE capital = "Tóquio";
        
-- *********************2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:************
/*Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40),
artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da
tabela.*/
CREATE TABLE musica ( 
idMusica		int primary key auto_increment,
titulo			varchar(40),
artista			varchar(40),
genero			varchar(40)
);
/*Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de
uma música, e um artista, que tenha mais de uma música cadastrada. Procure inserir
pelo menos umas 3 músicas.*/
INSERT INTO Musica (titulo, artista, genero)
VALUES
('Shape of You', 'Ed Sheeran', 'Pop'),
('Perfect', 'Ed Sheeran', 'Pop'),
('Blinding Lights', 'The Weeknd', 'Pop'),
('Smells Like Teen Spirit', 'Nirvana', 'Rock'),
('Come as You Are', 'Nirvana', 'Rock'),
('Bohemian Rhapsody', 'Queen', 'Rock');
/* Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital ou
físico) e dtLancamento (DATE).
• Inserir pelo menos 2 albuns;*/
CREATE TABLE album (
idAlbum 		int primary key auto_increment,
nome 			varchar(20),
tipo			varchar(10) CHECK ( tipo in ("digital", "fisico")),
dtLancamento	DATE
);

INSERT INTO album (nome, tipo, dtLancamento)
VALUES
('Divide', 'digital', '2017-03-03'),
('Thriller', 'fisico', '1982-11-30'),
('Lover', 'digital', '2019-08-23'),
('Abbey Road', 'fisico', '1969-09-26'),
('After Hours', 'digital', '2020-03-20'),
('Back in Black', 'fisico', '1980-07-25');

/* a) Exibir todos os dados das tabelas separadamente;*/
select * from musica; SELECT * FROM album;
/* b) Criar a chave estrangeira na tabela de acordo com a regra de negócio; */
ALTER TABLE musica add fkAlbum int;
ALTER TABLE musica add constraint fkAlbum foreign key (fkAlbum) references album(idAlbum);

/*c) Atualizar os álbuns de cada música;*/
UPDATE musica SET fkAlbum = 1 WHERE idMusica = 1;  -- Associa o álbum com id 1 (Divide) à música com idMusica = 1
UPDATE musica SET fkAlbum = 1 WHERE idMusica = 2;  -- Associa o álbum com id 1 (Divide) à música com idMusica = 2

UPDATE musica SET fkAlbum = 5 WHERE idMusica = 3;  -- Associa o álbum com id 5 (After Hours) à música com idMusica = 3
UPDATE musica SET fkAlbum = 2 WHERE idMusica = 4;  -- Associa o álbum com id 2 (Thriller) à música com idMusica = 4
UPDATE musica SET fkAlbum = 2 WHERE idMusica = 5;  -- Associa o álbum com id 2 (Thriller) à música com idMusica = 5
UPDATE musica SET fkAlbum = 6 WHERE idMusica = 6;  -- Associa o álbum com id 6 (Back in Black) à música com idMusica = 6


/*d) Exibir as músicas e seus respectivos álbuns;*/
SELECT *
	FROM musica
		INNER JOIN album AS a on idAlbum = fkAlbum;
/* e) Exibir somente o título da música e o nome do seu respectivo álbum;*/
SELECT m.titulo Música, a.nome Album
	FROM musica AS m 
		INNER JOIN album AS a on idAlbum = fkAlbum;
/* f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.*/        
SELECT *
	FROM musica 
		INNER JOIN album ON idAlbum = fkAlbum
			WHERE tipo = 'digital';

