create database game_store;

use game_store;
create table jogo(
id int primary key auto_increment,
nome varchar(30),
diretor varchar (30),
gênero varchar (30),
dia date,
nota int(2),
qtd int
);

select * from jogo;

-- Insira pelo menos 5 registros para a tabela
insert jogo (nome, diretor, gênero, dia, nota, qtd)
	value ("Valorant", "Riot Games","Shooter","2019-06-15", "8", "20"),
		  ("League of Legends", "Riot Games", "MOBA", "2009-10-27", "9", "10"),
		("Fortnite", "Epic Games", "Battle Royale", "2017-09-26", "8", "100"),
		("Minecraft", "Mojang", "Sandbox", "2011-11-18", "10", "50"),
		("Overwatch", "Blizzard Entertainment", "Shooter", "2016-05-24", "0", "12"),
		("Apex Legends", "Respawn Entertainment", "Battle Royale", "2019-02-04", "8", "0");
       
       
-- Altere a tabela para inserir uma coluna que represente o tipo de mídia que
-- deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
alter table jogo add midia varchar(10) default("física");
alter table jogo add check( midia = "física" or "digital");

-- Atualize os registros dos jogos inseridos anteriormente.
update jogo set midia="física";

-- Exiba apenas os jogos com data de lançamento a partir de 2015.
select * from jogo where dia >= 2015;

-- Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
select * from jogo where nome like "%a%" and midia = "física";

-- Exiba os jogos onde o nome do diretor não contenha a letra “e”
select * from jogo where nome not like "%e%";

-- Altere a tabela para criar uma checagem na inserção da nota, onde o valor
-- não pode ser menor que 0 e nem maior que 10.
alter table jogo add check (nota >= 0 and nota <= 10);

/* Teste 
insert into jogo (nome, diretor, gênero, dia, nota, qtd)
			value("JOGO", "Fulano", "Legal", "2025-02-19", "11", "1000");
*/
-- Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
select * from jogo where gênero="shooter" and qtd > 0;

-- Exclua os jogos que não têm mais unidades disponíveis em estoque.
delete from jogo where qtd = 0;

-- Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela. 
alter table jogo rename column diretor to criador;
select * from jogo;

drop table jogo;

-- --------------------------------2 – Esportes Olímpicos -----------------------------------

/* No MySQL Workbench, crie o banco de dados "olimpiadas".
Crie a tabela chamada "esporte" para armazenar informações sobre os esportes praticados nas Olimpíadas. A tabela deve conter os seguintes campos:
id (número inteiro e chave primária que se autoincrementa),
nome (varchar, tamanho 40),
categoria (varchar, tamanho 20, valores possíveis: "Individual" ou "Coletivo"),
numero_jogadores (int, número de jogadores por equipe),
estreia (date, data de estreia do esporte nas Olimpíadas),
pais_origem (varchar, tamanho 30, nome do país de origem do esporte).

/* 1. Criar o banco de dados e a tabela */
create database olimpiadas;
use olimpiadas;

create table esporte (
    id int primary key auto_increment,
    nome varchar(40),
    categoria varchar(20) check (categoria in ('Individual', 'Coletivo')),
    numero_jogadores int,
    estreia date,
    pais_origem varchar(30)
);

/* 2. Inserir 5 registros na tabela */
insert into esporte (nome, categoria, numero_jogadores, estreia, pais_origem)
values
    ('Futebol', 'Coletivo', 11, '1900-01-01', 'Reino Unido'),
    ('Natação', 'Individual', 1, '1896-04-06', 'Grécia'),
    ('Vôlei', 'Coletivo', 6, '1964-10-10', 'Japão'),
    ('Atletismo', 'Individual', 1, '1896-04-06', 'Grécia'),
    ('Basquete', 'Coletivo', 5, '1936-08-07', 'Estados Unidos');

/* 3. Adicionar a coluna popularidade */
alter table esporte add column popularidade decimal(3,2) check (popularidade between 0 and 10.0);

/* Exibir a estrutura da tabela após a alteração */
desc esporte;

/* 4. Atualizar os registros para definir a popularidade */
update esporte set popularidade = 9.5 where id = 1;
update esporte set popularidade = 8.0 where id = 2;
update esporte set popularidade = 7.0 where id = 3;
update esporte set popularidade = 9.5 where id = 4;
update esporte set popularidade = 9.0 where id = 5;

/* 5. Exibir os esportes ordenados por popularidade em ordem crescente */
select * from esporte order by popularidade asc;

/* 6. Exibir apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000 */
select * from esporte where estreia >= '2000-01-01';

/* 7. Criar a checagem para não permitir datas inválidas na coluna estreia */
alter table esporte add constraint check_estreia check (estreia >= '1896-04-06' and estreia <= '2025-02-05');

/* 8. Alterar a tabela para excluir a restrição de categoria */
alter table esporte modify column categoria varchar(20);

/* 9. Exibir apenas os esportes cujo nome do país de origem tenha "a" na segunda letra */
select * from esporte where pais_origem like '_a%';

/* 10. Exibir os dados onde o número de jogadores por equipe esteja entre 4 e 11 */
select * from esporte where numero_jogadores between 4 and 11;

/* 11. Remover os registros onde id seja 1, 3 e 5 */
delete from esporte where id in (1, 3, 5);

-- --------------------------------3 – Desenhos Animados -----------------------------------
/* No MySQL Workbench, crie o banco de dados "desenho". */
create database desenho;
use desenho;

/* Criar a tabela chamada desenho para conter os dados: 
id (inteiro, chave primária, autoincrementa a partir do 10), 
titulo (varchar, tamanho 50), 
dataLancamento (date), 
emissoraOriginal (varchar, tamanho 50), 
classificacao (int), 
status (varchar, tamanho 15), 
nota (int) que armazena a avaliação do desenho entre 1 a 5. */
create table desenho(
id int primary key auto_increment,
titulo varchar(50),
dataLancamento date,
emissoraOriginal varchar(50),
classificacao int,
status varchar(15),
nota int
);
/* 5 Inserts para popular a tabela com dados de exemplo */
insert into desenho (titulo, dataLancamento, emissoraOriginal, classificacao, status, nota) 
values 
('Desenho A', '2020-03-15', 'Emissora X', 10, 'exibindo', 4),
('Desenho B', '2018-07-22', 'Emissora Y', 12, 'finalizado', 5),
('Desenho C', '2021-11-11', 'Emissora Z', 8, 'exibindo', 3),
('Desenho D', '2019-05-05', 'Emissora X', 14, 'cancelado', 2),
('Desenho E', '2022-01-01', 'Emissora Y', 10, 'exibindo', 4);

/* 1. Exibir todos os dados da tabela */
select * from desenho;

/* 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos */
select * from desenho where classificacao <= 14;

/* 3. Exibir todos os desenhos de uma mesma emissora original */
select * from desenho where emissoraOriginal = 'Nome da Emissora';

/* 4. Modificar o campo status, para que aceite apenas o status 'exibindo', 'finalizado', 'cancelado', 
tente inserir algum outro valor para ver se a regra foi aplicada */
alter table desenho modify status enum('exibindo', 'finalizado', 'cancelado');
insert into desenho (titulo, dataLancamento, emissoraOriginal, classificacao, status, nota)
values ('Novo Desenho', '2025-01-01', 'Emissora Exemplo', 10, 'exibindo', 4);

/* 5. Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID */
update desenho set status = 'finalizado' where id in (1, 2);

/* 6. Deletar a linha do desenho de ID 12 */
delete from desenho where id = 12;

/* 7. Exibir apenas os desenhos que comecem com uma determinada letra */
select * from desenho where titulo like 'A%';

/* 8. Renomear a coluna classificacao para classificacaoIndicativa */
alter table desenho change classificacao classificacaoIndicativa int;

/* 9. Atualizar a nota e data de lançamento do desenho de ID 11 */
update desenho set nota = 5, dataLancamento = '2025-12-01' where id = 11;

/* 10. Limpe todos os dados da tabela */
truncate table desenho;

/* 11. Remover a regra do status do desenho */
alter table desenho modify status varchar(15);     


-- --------------------------------4 – Despensa do Scooby-Doo -----------------------------------

/* No MySQL Workbench, crie o banco de dados "estoque". */
create database estoque;
use estoque;

/* Criar a tabela chamada "MisteriosSA" para conter os dados:
id (inteiro, chave primária),
nome (varchar, tamanho 50),
dataCompra (date),
preco (decimal),
peso (decimal),
dataRetirada (date). */
create table MisteriosSA (
    id int primary key auto_increment,
    nome varchar(50),
    dataCompra date,
    preco decimal(10,2),
    peso decimal(10,2),
    dataRetirada date
);

/* 1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. 
Por agora, não preencha a coluna referente a "data de retirada". */
insert into MisteriosSA (nome, dataCompra, preco, peso) values
('Biscoitos Scooby', '2024-03-01', 15.99, 500),
('Cachorro-quente', '2024-03-10', 8.50, 250),
('Biscoitos Scooby', '2024-04-15', 14.90, 450),
('Cachorro-quente', '2024-05-20', 9.20, 300),
('Biscoitos Scooby', '2024-06-05', 16.75, 520);

/* 2. Verifique se os valores foram inseridos corretamente. */
select * from MisteriosSA;

/* 3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos 
ordenados a partir da data de compra mais antiga. */
select id, nome, dataCompra, dataRetirada from MisteriosSA
order by dataCompra;

/* 4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa 
de “Biscoitos Scooby” que foi comprada a mais tempo. */
update MisteriosSA set dataRetirada = '2024-03-15' where nome = 'Biscoitos Scooby' and dataCompra = '2024-03-01';

/* 5. Altere o nome da coluna id para idComida. */
alter table MisteriosSA rename column id to idComida;

/* 6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos 
Scooby” ou “Cachorro-quente”. */
alter table MisteriosSA add constraint chk_nome check (nome in ('Biscoitos Scooby', 'Cachorro-quente'));

/* 7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o 
nome das colunas dataCompra apareça como "data da compra" e 
dataRetirada apareça como "data da retirada". */
select idComida as id, nome, dataCompra as 'data da compra', dataRetirada as 'data da retirada' 
from MisteriosSA where nome = 'Biscoitos Scooby';

/* 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024. */
select * from MisteriosSA where dataCompra < '2024-07-25';

/* 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50. */
select * from MisteriosSA where preco >= 30.50;

/* 10. Limpe a tabela. */
truncate table MisteriosSA;

-- --------------------------------5 – Heróis -----------------------------------
/* No MySQL Workbench, crie o banco de dados “vingadores”.
Crie uma tabela chamada “heroi”, onde terá um campo de nome contendo até 45 caracteres.
O seu herói poderá ter uma versao, onde será armazenado o filme de sua escolha, esse campo aceitará até 45 caracteres.
Todo herói, tem uma habilidade que se destaca entre os outros super-heróis.
Todo herói tem uma altura, esse campo aceitará valores inteiros representando centímetros.
O id deverá se autoincrementar.
Insira 5 heróis para derrotar o vilão Doutor Destino. */

create database vingadores;
use vingadores;

create table heroi (
    id int auto_increment primary key,
    nome varchar(45),
    versao varchar(45),
    habilidade varchar(100),
    altura int
);

-- Inserir 5 heróis
insert into heroi (nome, versao, habilidade, altura)
values
    ('Homem de Ferro', 'Vingadores: Ultimato', 'Inteligência e armadura', 185),
    ('Capitão América', 'Vingadores: Guerra Infinita', 'Força sobre-humana e escudo', 190),
    ('Thor', 'Vingadores: Ultimato', 'Força e controle sobre o trovão', 200),
    ('Hulk', 'Vingadores: Guerra Infinita', 'Força bruta', 220),
    ('Viúva Negra', 'Vingadores: Ultimato', 'Habilidades de combate e espionagem', 165);

-- 1. Exibir os dados inseridos na tabela
select * from heroi;

-- 2. Adicionar um campo de regeneração, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE
alter table heroi
add column regeneracao boolean;

-- 3. Modificar o campo versão para aceitar até 100 caracteres
alter table heroi
modify column versao varchar(100);

-- 4. Remover o herói de id 3 pois ele se morreu em batalha
delete from heroi where id = 3;

-- 5. Chegou reforços, insira um novo herói para a equipe
insert into heroi (nome, versao, habilidade, altura)
values ('Pantera Negra', 'Vingadores: Guerra Infinita', 'Superforça e agilidade', 190);

-- 6. Exibir todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”
select * from heroi
where nome like 'C%' or nome like 'H%';

-- 7. Exibir todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome
select * from heroi
where nome not like '%A%';

-- 8. Exibir apenas o nome do herói onde a altura for maior que 190
select nome from heroi
where altura > 190;

-- 9. Exibir todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180
select * from heroi
where altura > 180
order by nome desc;

-- 10. Limpe os dados da tabela
truncate heroi;




   
		  