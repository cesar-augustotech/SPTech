/* ****** PRÁTICA 08 ********* */ 
/*
Abra no MySQL Workbench uma nova aba para fazer os comandos SQL.
Escrever os comandos do MySQL para:
*/
-- a) Criar um banco de dados chamado Venda.
CREATE DATABASE venda;

-- b) Selecionar esse banco de dados.
USE venda;

-- c) Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(200),
    fkIndicador INT,
    FOREIGN KEY (fkIndicador) REFERENCES cliente(idCliente)
);

CREATE TABLE produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(5, 2)
);

CREATE TABLE venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    data DATE,
    total DECIMAL(5, 2),
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE venda_produto (
    idVenda INT,
    idProduto INT,
    quantidade INT,
    desconto DECIMAL(5,2),
    PRIMARY KEY (idVenda, idProduto),
    FOREIGN KEY (idVenda) REFERENCES venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

-- d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
-- cliente, e mais de um cliente sendo indicado por outro cliente.
INSERT INTO cliente (nome, email, endereco) VALUES
(' Bob Batatinha', 'bob@email.com', 'Rua Aleatória 1'),
('Ana Banana', 'ana@email.com', 'Rua Aleatória 2'),
('João Goiaba', 'joao@email.com', 'Rua Aleatória 3');

UPDATE cliente SET fkIndicador = 1 WHERE idCliente IN (2, 3);

INSERT INTO produto (nome, descricao, preco) VALUES
('Produto 1', 'Descrição do Produto 1', 10.00),
('Produto 2', 'Descrição do Produto 2', 20.00);

INSERT INTO venda (idCliente, data, total) VALUES
(1, '2024-05-01', 30.00),
(1, '2024-05-02', 40.00),
(2, '2024-05-03', 50.00),
(3, '2024-05-04', 60.00);

INSERT INTO venda_produto (idVenda, idProduto, quantidade, desconto) VALUES
(1, 1, 2, 0.00),
(1, 2, 1, 2.00),
(2, 2, 2, 0.00),
(3, 1, 3, 1.00),
(4, 1, 1, 0.00),
(4, 2, 1, 0.00);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM venda;
SELECT * FROM venda_produto;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
-- das tabelas.

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
SELECT * FROM cliente
INNER JOIN venda ON cliente.idCliente = venda.idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
-- e os dados de suas respectivas vendas.
SELECT * FROM cliente
INNER JOIN venda ON cliente.idCliente = venda.idCliente
WHERE cliente.nome = 'Bob Batatinha';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT c.nome AS Indicador, cl.nome AS Indicado
FROM cliente c
JOIN cliente cl ON c.idCliente = cl.fkIndicador;

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta).
SELECT c.nome AS Indicador, cl.nome AS Indicado
FROM cliente c
JOIN cliente cl ON c.idCliente = cl.fkIndicador
WHERE c.nome = 'Bob Batatinha';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos.
SELECT c.nome AS Cliente, ci.nome AS Indicador, v.idVenda, p.nome AS Produto
FROM cliente c
LEFT JOIN cliente ci ON c.fkIndicador = ci.idCliente
JOIN venda v ON c.idCliente = v.idCliente
JOIN venda_produto vp ON v.idVenda = vp.idVenda
JOIN produto p ON vp.idProduto = p.idProduto;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
-- numa determinada venda.
SELECT v.data, p.nome, vp.quantidade
FROM venda v
INNER JOIN venda_produto vp ON v.idVenda = vp.idVenda
INNER JOIN produto p ON vp.idProduto = p.idProduto
WHERE v.idVenda = 1;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
-- produtos vendidos agrupados pelo nome do produto.
SELECT p.nome, p.preco, SUM(vp.quantidade) AS total_vendido
FROM produto p
INNER JOIN venda_produto vp ON p.idProduto = vp.idProduto
GROUP BY p.nome, p.preco;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
-- vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO cliente (nome, email, endereco) VALUES
('Lucas Cenoura', 'lucas@email.com', 'Rua Aleatória 4');

SELECT c.*, v.idVenda
FROM cliente c
LEFT JOIN venda v ON c.idCliente = v.idCliente;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
SELECT MIN(preco) AS menor_preco, MAX(preco) AS maior_preco
FROM produto;

-- q) Exibir a soma e a média dos preços dos produtos;
SELECT SUM(preco) AS soma, AVG(preco) AS media
FROM produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
SELECT COUNT(*) AS acima_media
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);

-- s) Exibir a soma dos preços distintos dos produtos;
SELECT SUM(DISTINCT preco) 'preços distintos'
FROM produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT v.idVenda, SUM(p.preco * vp.quantidade - vp.desconto) AS total
FROM venda v
INNER JOIN venda_produto vp ON v.idVenda = vp.idVenda
INNER JOIN produto p ON vp.idProduto = p.idProduto
GROUP BY v.idVenda;
