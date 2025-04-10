create database sentinela;
use sentinela;

CREATE TABLE empresas (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(20) NOT NULL,
    fkEmpresa INT,  
    FOREIGN KEY (fkEmpresa) REFERENCES empresas(idEmpresa)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    localizacao VARCHAR(50) NOT NULL,
    fkUsuario INT,  
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario) 
);

CREATE TABLE historico_sensores (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    fkSensor INT,  
    temperatura DECIMAL(5,2),
    umidade DECIMAL(5,2),
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor) 
);

CREATE TABLE historico_alertas (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    fkSensor INT,  
    tipo_alerta VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor) 
);


INSERT INTO empresas (nome, cnpj) VALUES
('Swift', '12.345.678/0001-90'),
('Friboi', '98.765.432/0001-10'),
('Minerva Foods', '56.789.123/0001-45'),
('Marfrig', '34.567.890/0001-67'),
('BRF', '78.901.234/0001-89'),
('JBS', '11.223.344/0001-22'),
('Aurora Alimentos', '99.888.777/0001-33'),
('Brazil Meat', '22.333.444/0001-44'),
('Seara', '55.666.777/0001-55'),
('Agrosul', '44.555.666/0001-66');

INSERT INTO usuario (nome, email, senha, fkEmpresa) VALUES
('César Augusto', 'cesar.augusto@swift.com', 'senha123', 1),
('Mariana Ribeiro', 'mariana.ribeiro@friboi.com', 'friboi2024', 2),
('Roberto Almeida', 'roberto.almeida@minervafoods.com', 'minerva456', 3),
('Ana Paula Souza', 'ana.souza@marfrig.com', 'marfrig789', 4),
('Gustavo Fernandes', 'gustavo.fernandes@brfood.com', 'brfood321', 5),
('Lucas Martins', 'lucas.martins@jbfoods.com', 'jbsecure2024', 6),
('Fernanda Oliveira', 'fernanda.oliveira@auroraalimentos.com', 'aurora159', 7),
('Carlos Mendes', 'carlos.mendes@brazilmeat.com', 'brazilmeat852', 8),
('Juliana Costa', 'juliana.costa@seara.com', 'seara963', 9),
('Felipe Rocha', 'felipe.rocha@agrosul.com', 'agrosul789', 10);

INSERT INTO sensor (tipo, localizacao, fkUsuario) VALUES
('DHT11', 'Câmara Fria 1', 1),
('DS18B20', 'Caminhão 02', 2),
('DHT22', 'Depósito 3', 3),
('SHT31', 'Armazém Central', 4),
('BME280', 'Estoque Refrigerado', 5),
('DHT11', 'Caminhão 5', 6),
('DS18B20', 'Sala de Resfriamento', 7),
('SHT31', 'Depósito 8', 8),
('BME280', 'Câmara Fria 9', 9),
('DHT22', 'Armazém 10', 10);

INSERT INTO historico_sensores (idRegistro, fkSensor, temperatura, umidade, dataHora) VALUES 
-- Temperatura dentro do esperado
(1, 1, -19.5, 75, '2025-03-14 08:00:00'),
(2, 2, -18.8, 70, '2025-03-14 08:05:00'),
(3, 3, -20.3, 72, '2025-03-14 08:10:00'),
(4, 4, -21.0, 69, '2025-03-14 08:15:00'),
(5, 5, -18.5, 78, '2025-03-14 08:20:00'),

-- ALERTAS COMEÇAM AQUI
-- Temperatura acima do limite
(6, 6, -17.5, 82, '2025-03-14 08:25:00'), 
(7, 7, -16.8, 75, '2025-03-14 08:30:00'), 
(8, 1, -17.2, 85, '2025-03-14 08:35:00'), 

-- Sensor ficou offline (temperatura e umidade nulas)
(9, 2, NULL, NULL, '2025-03-14 08:40:00'), 

--  Umidade Crítica Alta (>90%)
(10, 3, -19.2, 95, '2025-03-14 08:45:00'), 
(11, 4, -18.0, 92, '2025-03-14 08:50:00'),

--  Sensor parou de responder corretamente
(12, 5, NULL, NULL, '2025-03-14 08:55:00'), 

--  Temperatura subindo acima do ideal
(13, 6, -17.0, 88, '2025-03-14 09:00:00'),
(14, 7, -15.5, 80, '2025-03-14 09:05:00');

INSERT INTO historico_alertas (fkSensor, tipo_alerta, descricao, dataHora) VALUES 
-- 🚨 Temperatura Alta
(6, 'Temperatura Alta', '⚠️ Alerta! Temperatura acima do limite: -17.5°C', '2025-03-14 08:25:30'),
(7, 'Temperatura Alta', '⚠️ Atenção! Temperatura muito alta: -16.8°C', '2025-03-14 08:30:45'),
(1, 'Temperatura Alta', '⚠️ Urgente! Temperatura elevada: -17.2°C', '2025-03-14 08:35:15'),

-- 🚨 Sensor Offline
(2, 'Sensor Offline', '⚠️ ALERTA CRÍTICO! Sensor offline (sem leitura de temperatura/umidade)', '2025-03-14 08:40:30'),
(5, 'Sensor Offline', '⚠️ URGENTE! Sensor não está respondendo (offline)', '2025-03-14 08:55:10'),

-- 🚨 Umidade Crítica Alta
(3, 'Umidade Crítica', '⚠️ Umidade muito alta! Nível crítico: 95%', '2025-03-14 08:45:25'),
(4, 'Umidade Crítica', '⚠️ Umidade acima do padrão: 92%', '2025-03-14 08:50:40'),

-- 🚨 Tendência de Temperatura Subindo
(6, 'Temperatura em Tendência de Alta', '⚠️ Alerta! Temperatura continua subindo: -17.0°C', '2025-03-14 09:00:20'),
(7, 'Temperatura em Tendência de Alta', '🚨 PERIGO! Temperatura muito acima do ideal: -15.5°C', '2025-03-14 09:05:30');

select * from empresas;
select * from usuario;
select * from sensor;
select * from historico_sensores;
select * from historico_alertas;

desc usuarios;


