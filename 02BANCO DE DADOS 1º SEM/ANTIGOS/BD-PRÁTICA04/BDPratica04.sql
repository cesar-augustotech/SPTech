-- BD – EXERCÍCIOS – PRÁTICA 04

-- 1. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
-- Fazer a modelagem lógica e física conforme a regra de negócio:
-- • 1 professor leciona 1 ou muitas disciplinas;
-- • 1 disciplina é lecionada por apenas 1 professor;
CREATE DATABASE sprint2;
USE sprint2;
/* Criar a tabela chamada Professor para conter os dados: idProfessor, nome
(tamanho 50), sobrenome (tamanho 30), especialidade1 (tamanho 40),
especialidade2 (tamanho 40), sendo que idProfessor é a chave primária da tabela.
Inserir pelo menos uns 6 professores.
Criar a tabela chamada Disciplina para conter os dados: idDisc, nomeDisc
(tamanho 45), sendo que idDisc é a chave primária da tabela.*/ 
CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(30),
    especialidade1 VARCHAR(40),
    especialidade2 VARCHAR(40)
);

INSERT INTO Professor (nome, sobrenome, especialidade1, especialidade2) VALUES
('Carlos', 'Silva', 'Matemática', 'Física'),
('Ana', 'Souza', 'História', 'Geografia'),
('João', 'Pereira', 'Química', 'Biologia'),
('Mariana', 'Oliveira', 'Português', 'Literatura'),
('Fernando', 'Costa', 'Física', 'Astronomia'),
('Beatriz', 'Mendes', 'Educação Física', 'Nutrição');

CREATE TABLE Disciplina (
    idDisc INT PRIMARY KEY AUTO_INCREMENT,
    nomeDisc VARCHAR(45),
    idProfessor INT,
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor)
);

INSERT INTO Disciplina (nomeDisc, idProfessor) VALUES
('Matemática', 1),
('História', 2),
('Química', 3);


-- Exibir os professores e suas respectivas disciplinas
SELECT p.idProfessor, p.nome, p.sobrenome, d.nomeDisc 
FROM Professor p
LEFT JOIN Disciplina d ON p.idProfessor = d.idProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor
SELECT d.nomeDisc, p.nome 
FROM Disciplina d
JOIN Professor p ON d.idProfessor = p.idProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome
SELECT p.*, d.nomeDisc 
FROM Professor p
LEFT JOIN Disciplina d ON p.idProfessor = d.idProfessor
WHERE p.sobrenome = 'Souza';

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1
SELECT p.especialidade1, d.nomeDisc 
FROM Professor p
JOIN Disciplina d ON p.idProfessor = d.idProfessor
WHERE p.nome = 'Carlos'
ORDER BY p.especialidade1 ASC;

-- ----------------------------------------------------------------------------------------
-- 2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
-- Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50),
-- sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO Curso (nome, sigla, coordenador) VALUES
('Ciência da Computação', 'CC', 'Dr. Carlos Almeida'),
('Engenharia de Software', 'ES', 'Dra. Ana Bezerra'),
('Sistemas de Informação', 'SI', 'Dr. João Pereira');

-- Crie uma regra de negócio com uma nova tabela a sua escolha.
-- Relacione a tabela que você criou com a tabela curso e insira ou atualize os dados;

CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    idade INT,
    idCurso INT,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

INSERT INTO Aluno (nome, idade, idCurso) VALUES
('Mariana Souza', 22, 1),
('Fernando Lima', 24, 2),
('Beatriz Mendes', 21, 3);


-- b) Faça um JOIN entre as duas tabelas
SELECT a.idAluno, a.nome AS NomeAluno, c.nome AS NomeCurso
FROM Aluno a
JOIN Curso c ON a.idCurso = c.idCurso;

-- c) Faça um JOIN com WHERE entre as duas tabelas
SELECT a.idAluno, a.nome AS NomeAluno, c.nome AS NomeCurso
FROM Aluno a
JOIN Curso c ON a.idCurso = c.idCurso
WHERE c.sigla = 'CC';

-- d) Crie um campo com a restrição (constraint) de CHECK
ALTER TABLE Aluno ADD CONSTRAINT chk_idade CHECK (idade >= 18);

-- Exercício 3----------------------------------------------------------------------------

-- Fazer a modelagem conceitual (DER) de um sistema para um pet shop cadastrar
-- os pets e seus donos (clientes).
-- Cada pet pertence somente a um cliente.
-- Cada cliente pode ter mais de um pet cadastrado.
-- Sobre cada pet, o sistema guarda um identificador que é inicializado com 101 e
-- incrementado de forma automática. Esse identificador é a chave primária que
-- identifica um pet de forma única. Além do identificador, o sistema guarda o
-- tipo do animal (se é cachorro, gato, etc), o nome, a raça e a data de nascimento do pet.
-- Sobre cada cliente, o sistema guarda também um identificador que identifica de
-- forma única cada cliente. Esse identificador começa a partir de 1 e é incrementado
-- de forma automática pelo sistema. Além do código, o sistema guarda o nome, o
-- telefone fixo, o telefone celular e o endereço de cada cliente.

-- Criar um banco de dados Pet no MySQL, selecionar esse banco de dados e
-- executar as instruções relacionadas a seguir.
CREATE DATABASE Pet;

-- Selecionar o banco de dados
USE Pet;

-- Criar as tabelas equivalentes à modelagem.
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone_fixo VARCHAR(15),
    telefone_celular VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    nome VARCHAR(100),
    raca VARCHAR(50),
    data_nascimento DATE,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
) auto_increment = 100;

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal
-- diferente, e que exista algum cliente com mais de um pet cadastrado. Procure
-- inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.
INSERT INTO clientes (nome, telefone_fixo, telefone_celular, endereco)
VALUES
('João Silva', '1234-5678', '9876-5432', 'Rua A, 123'),
('Maria Silva', '2345-6789', '8765-4321', 'Rua A, 123'),
('Carlos Souza', '3456-7890', '7654-3210', 'Rua B, 456');

INSERT INTO pets (tipo, nome, raca, data_nascimento, cliente_id)
VALUES
('Cachorro', 'Rex', 'Labrador', '2015-06-15', 1),
('Cachorro', 'Fido', 'Poodle', '2017-08-10', 2),
('Gato', 'Whiskers', 'Siamês', '2018-05-05', 2),
('Cachorro', 'Bolt', 'Bulldog', '2019-09-09', 3);

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM clientes;
SELECT * FROM pets;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- (Já foi feito na criação da tabela 'pets' através da cláusula FOREIGN KEY.)

-- Altere o tamanho da coluna nome do cliente.
ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(150);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
SELECT * FROM pets WHERE tipo = 'Cachorro';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
SELECT nome, data_nascimento FROM pets;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
SELECT * FROM pets ORDER BY nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
-- (Considerando que o bairro está incluso no campo 'endereco')
SELECT * FROM clientes ORDER BY endereco DESC;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
SELECT * FROM pets WHERE nome LIKE 'R%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
SELECT * FROM clientes WHERE nome LIKE '%Silva';

-- Alterar o telefone de um determinado cliente.
UPDATE clientes SET telefone_fixo = '1111-2222' WHERE cliente_id = 1;

-- Exibir os dados dos clientes para verificar se alterou.
SELECT * FROM clientes WHERE cliente_id = 1;

-- Exibir os dados dos pets e dos seus respectivos donos.
SELECT pets.nome AS Pet, pets.tipo AS Tipo, clientes.nome AS Cliente
FROM pets
JOIN clientes ON pets.cliente_id = clientes.cliente_id;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um
-- determinado cliente.
SELECT pets.nome AS Pet, pets.tipo AS Tipo, clientes.nome AS Cliente
FROM pets
JOIN clientes ON pets.cliente_id = clientes.cliente_id
WHERE clientes.cliente_id = 2;

-- Excluir algum pet.
DELETE FROM pets WHERE pet_id = 1;

-- Exibir os dados dos pets para verificar se excluiu.
SELECT * FROM pets;

-- Excluir as tabelas.
DROP TABLE pets;
DROP TABLE clientes;


-- EXERCICIO 5 -----------------------------------------------------------
-- 5. Fazer a modelagem conceitual (DER) de um sistema para armazenar os gastos
-- individuais das pessoas de sua família.
-- Crie uma entidade Pessoa, com atributos idPessoa, nome, data de nascimento, profissão.
-- Crie uma outra entidade Gasto, com atributos idGasto, data, valor, descrição.


CREATE TABLE pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    profissao VARCHAR(100)
);

CREATE TABLE gasto (
    idGasto INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    valor DECIMAL(10,2),
    descricao VARCHAR(255),
    idPessoa INT,
    FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
);

-- Insira dados nas tabelas.
INSERT INTO pessoa (nome, data_nascimento, profissao)
VALUES
('João da Silva', '1980-05-10', 'Engenheiro'),
('Maria Oliveira', '1985-08-15', 'Professora'),
('Ana Souza', '1990-03-20', 'Médica');

INSERT INTO gasto (data, valor, descricao, idPessoa)
VALUES
('2023-01-15', 100.50, 'Supermercado', 1),
('2023-01-16', 50.75, 'Transporte', 2),
('2023-01-17', 200.00, 'Aluguel', 1),
('2023-01-18', 80.00, 'Lazer', 3);

-- Exiba os dados de cada tabela individualmente.
SELECT * FROM pessoa;
SELECT * FROM gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
SELECT * FROM pessoa WHERE profissao = 'Engenheiro';
SELECT * FROM gasto WHERE valor > 50;

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
SELECT p.nome, p.profissao, g.data, g.valor, g.descricao
FROM pessoa p
LEFT JOIN gasto g ON p.idPessoa = g.idPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
-- (Exemplo: exibir os dados da pessoa com idPessoa = 1)
SELECT p.nome, p.profissao, g.data, g.valor, g.descricao
FROM pessoa p
LEFT JOIN gasto g ON p.idPessoa = g.idPessoa
WHERE p.idPessoa = 1;

-- Atualize valores já inseridos na tabela.
UPDATE gasto SET valor = 60.00 WHERE idGasto = 2;


-- Exclua um ou mais registros de alguma tabela.
-- (Exemplo: excluir o gasto com idGasto = 4)
DELETE FROM gasto WHERE idGasto = 4;


