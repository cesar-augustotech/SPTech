-- EXERCÍCIO DE BANCO DE DADOS MYSQL 


/*Você foi contratado para desenvolver o banco de dados de uma pequena livraria. A
livraria precisa armazenar informações sobre seus livros, autores e vendas
realizadas.
Requisitos:
1. Crie as seguintes tabelas:
 Autores: Deve armazenar o ID do autor, nome completo e
nacionalidade, Brasileiro ou estrangeiro.
 Livros: Deve armazenar o ID do livro, título, gênero, ano de
publicação e o ID do autor (chave estrangeira para a tabela de
autores).
 Vendas: Deve armazenar o ID da venda, data da venda, quantidade
vendida, valor total e o ID do livro (chave estrangeira para a tabela de
livros).
 
 2. Ao criar as tabelas, siga estas instruções:
o Utilize NOT NULL para campos obrigatórios.
o Defina PRIMARY KEY nas tabelas adequadamente.
o Crie um INDEX na coluna de nome do autor.
o Defina uma coluna com UNIQUE (ex.: título do livro).
o Utilize DEFAULT para definir um valor padrão para a quantidade
vendida (ex.: 1).
o Crie uma restrição CHECK para que o valor total da venda seja
maior que zero.
o Estabeleça FOREIGN KEY corretamente nas tabelas de livros e
vendas

 */
 CREATE DATABASE livraria;
 USE livraria;
 
 CREATE TABLE autores(
 idAutor INT AUTO_INCREMENT PRIMARY KEY, 
 autor VARCHAR(40) NOT NULL,
 key ix_autor(autor),
 nacionalidade VARCHAR(15) NOT NULL CHECK( nacionalidade IN ('Brasileiro', 'estrangeiro'))
 );
 CREATE TABLE livros(
 idLivro INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(40) NOT NULL,
 UNIQUE KEY ix_titulo(titulo),
 genero VARCHAR(40) NOT NULL,
 ano_publicacao YEAR NOT NULL,
 fkAutor INT NOT NULL,
 FOREIGN KEY (fkAutor) REFERENCES autores(idAutor)
 );
CREATE TABLE vendas(
idVenda INT AUTO_INCREMENT PRIMARY KEY,
dataVenda DATE NOT NULL,
qtdVendida INT NOT NULL DEFAULT '1',
valorTotal INT NOT NULL,
constraint chkTotal check (valorTotal > 1),
fkLivro INT NOT NULL,
FOREIGN KEY (fkLivro) REFERENCES livros(idLivro)
);
 
 
 INSERT INTO autores (autor, nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Estrangeiro'),
('George Orwell', 'Estrangeiro'),
('Clarice Lispector', 'Brasileiro'),
('Gabriel García Márquez', 'Estrangeiro');

INSERT INTO livros (titulo, genero, ano_publicacao, fkAutor) VALUES
('Dom Casmurro', 'Romance', 1901, 1),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 2),
('1984', 'Distopia', 1949, 3),
('A Hora da Estrela', 'Ficção', 1977, 4),
('Cem Anos de Solidão', 'Realismo Mágico', 1967, 5);

INSERT INTO vendas (dataVenda, qtdVendida, valorTotal, fkLivro) VALUES
('2025-03-01', 3, 89.70, 1),
('2025-03-02', 5, 199.95, 2),
('2025-03-03', 2, 59.80, 3),
('2025-03-04', 1, 34.90, 4),
('2025-03-05', 4, 139.60, 5);

/*
3.Após criar as tabelas e inserir alguns dados de exemplo, execute os
seguintes comandos:
o Adicione uma nova coluna na tabela de vendas para armazenar a
forma de pagamento (com valor padrão 'Dinheiro').
o Crie um CHECK na nova coluna para permitir apenas 'Dinheiro',
'Cartão' ou 'Pix'.
o Crie um INDEX na coluna de gênero da tabela de livros.
o Defina a coluna de nacionalidade na tabela de autores como
UNIQUE (simulando que cada autor tem uma nacionalidade única
para efeito do exercício). 
*/
ALTER TABLE vendas ADD COLUMN pagamento VARCHAR(20) NOT NULL DEFAULT 'Dinheiro';
ALTER TABLE vendas ADD CONSTRAINT chkPagamento check (pagamento in ('Dinheiro', 'Cartão', 'Pix'));
CREATE INDEX ixGenero ON livros(genero);
/*CREATE UNIQUE INDEX ixNacionalidade ON autores(nacionalidade);*/

/*
4. Remover cada uma das restrições e configurações anteriores:
• Remover NOT NULL de uma coluna.
• Excluir PRIMARY KEY de uma tabela.
• Deletar um INDEX existente.
• Remover a restrição UNIQUE de uma coluna.
• Alterar o valor DEFAULT de uma coluna ou removê-lo.
• Eliminar uma restrição CHECK.
• Deletar uma FOREIGN KEY e manter a integridade dos dados.
*/
ALTER TABLE vendas MODIFY pagamento VARCHAR(20) NULL;
ALTER TABLE vendas MODIFY idVenda INT;
ALTER TABLE vendas DROP PRIMARY KEY;
DROP INDEX ixGenero ON livros;
/* ALTER TABLE Autores DROP INDEX unique_nacionalidade; */
ALTER TABLE vendas ALTER COLUMN pagamento SET DEFAULT 'Pix';
ALTER TABLE vendas ALTER COLUMN pagamento DROP DEFAULT;
ALTER TABLE vendas DROP CONSTRAINT chkPagamento;

/* Achar nome da constraint
SELECT * FROM information_schema.referential_constraints
where constraint_schema = 'livraria'
and table_name = 'vendas';
*/
ALTER TABLE vendas DROP FOREIGN KEY vendas_ibfk_1;




 