CREATE DATABASE consertodolele;

CREATE TABLE pecascomputador(
    idpecascomputador INT PRIMARY KEY AUTO_INCREMENT,
    nomepeca VARCHAR(255) NOT NULL,
    quantpeca INT NOT NULL,
    valorpeca FLOAT NOT NULL, 
    fornecedorpeca VARCHAR(255) NOT NULL,
    telefonefornecedor BIGINT,
    ruafornecedor VARCHAR(255),
    cepfornecedor BIGINT
);

INSERT INTO pecascomputador(
    nomepeca,
    quantpeca,
    valorpeca,
    fornecedorpeca,
    telefonefornecedor,
    ruafornecedor,
    cepfornecedor  
)
VALUES(
    'Memória RAM 8GB',
    15,
    220.00,
    'TechMemory',
    11988776655,
    'Rua da Tecnologia, 100',
    01010000
),
(
    'HD 1TB',
    25,
    310.00,
    'Armazém Digital',
    11997654321,
    'Av. Central, 450',
    02020000
),
(
    'SSD 480GB',
    40,
    380.00,
    'FastStorage',
    11999887766,
    'Rua Velocidade, 88',
    03030000
),
(
    'Placa Mãe ASUS',
    10,
    750.00,
    'InfoPlacas',
    11991234567,
    'Av. das Peças, 900',
    04040000
),
(
    'Fonte 500W',
    30,
    260.00,
    'PowerTech',
    11993456789,
    'Rua Energia, 77',
    05050000
),
(
    'Processador i5',
    8,
    1250.00,
    'CPU Brasil',
    11994561234,
    'Av. Intel, 123',
    06060000
),
(
    'Placa de Vídeo GTX1660',
    5,
    1800.00,
    'GamerStore',
    11995678901,
    'Rua Gamer, 321',
    07070000
),
(
    'Teclado Mecânico',
    50,
    350.00,
    'Periféricos SP',
    11996789012,
    'Av. dos Acessórios, 55',
    08080000
),
(
    'Mouse Óptico',
    60,
    120.00,
    'Periféricos SP',
    11996789012,
    'Av. dos Acessórios, 55',
    08080000
),
(
    'Cooler para CPU ',
    22,
    190.00,
    'RefrigTech',
    11997890123,
    'Rua do Resfriamento, 9',
    09090000
);

-- Listando todos os dados da tabela
SELECT *
FROM pecascomputador;

-- Listando colunas fornecedor e telefone do fornecedor
SELECT fornecedorpeca, telefonefornecedor
FROM pecascomputador;

-- Listando peças com quantidade maior que 20
SELECT *
FROM pecascomputador
WHERE quantpeca > 20;

-- Listando peças com quantidade maior que 20 e valor maior que 300
SELECT *
FROM pecascomputador
WHERE quantpeca > 20 AND valorpeca > 300.00;

SELECT *
FROM pecascomputador
WHERE nomepeca = 'Memória RAM 8GB'
OR fornecedorpeca = 'FastStorage'

SELECT *
FROM pecascomputador
WHERE fornecedorpeca LIKE '%Tech%';

SELECT *
FROM pecascomputador
Order BY nomepeca ASC;

SELECT *
FROM pecascomputador
Order BY fornecedorpeca DESC;

SELECT * 
FROM pecascomputador
LIMIT 4;

CREATE TABLE pedidocliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR (255) NOT NULL,
sobrenome_cliente VARCHAR (255) NOT NULL,
email_cliente VARCHAR (255) NOT NULL UNIQUE,
telefone_cliente BIGINT (20),
id_produto INT,
FOREIGN KEY (id_produto)
    REFERENCES pecascomputador(idpecascomputador)
);
 

INSERT INTO pedidocliente (
 nome_cliente,
 sobrenome_cliente,
 email_cliente,
 telefone_cliente,
 id_produto
)
values(
    'Ana',
    'Silva',
    'ana.silva@email.com',
    11988887777,
    1
),
(
    'Carlos',
    'Souza',
    'carlos.souza@email.com',
    11999998888,
    2
),
(
    'Mariana',
    'Oliveira',
    'mariana.oliveira@email.com',
    11977776666,
    3
),
(
    'João',
    'Pereira',
    'joao.pereira@email.com',
    11966665555,
    4
),
(
    'Fernanda',
    'Costa',
    'fernanda.costa@email.com',
    11955554444,
    5
);

SELECT 
    pecascomputador.idpecascomputador,
    pecascomputador.valorpeca
FROM pecascomputador
INNER JOIN pedidocliente
ON pedidocliente.id_produto = pecascomputador.idpecascomputador
WHERE pedidocliente.nome_cliente = 'Ana';

SELECT 
    pecascomputador.idpecascomputador,
    pecascomputador.valorpeca
FROM pecascomputador
INNER JOIN pedidocliente
ON pedidocliente.id_produto = pecascomputador.idpecascomputador
ORDER BY pecascomputador.valorpeca DESC;

CREATE USER 'usuario_consertolele'@'localhost'
IDENTIFIED BY 'consertolele123';
 
GRANT SELECT
ON consertolele.*
TO 'usuario_consertolele'@'localhost';
 
REVOKE INSERT
ON consertolele.*
FROM 'usuario_consertolele'@'localhost';
 
DROP USER 'usuario_consertolele'@'localhost';