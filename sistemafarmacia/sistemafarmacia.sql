-- Criando um banco de dados
CREATE DATABASE sistemadefarmacia;
 
-- Criando uma tabela no banco de dados - nome da coluna, tipo do dado, propriedades da coluna
CREATE TABLE farmacia(
    cnpj CHAR(14) PRIMARY KEY,
    nomefarmacia VARCHAR(255) NOT NULL,
    telefone INT,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep BIGINT NOT NULL
);
 
-- Deletar o banco de dados
DROP DATABASE sistemadefarmacia;
 
-- Deletar a tabela do banco de dados
DROP TABLE farmacia;
 
 -- Criando nova tabela
 CREATE TABLE farmaceutico(
    rg INT PRIMARY KEY,
    nomefarmaceutico VARCHAR(255) NOT NULL,
    cnpj_farmacia CHAR(14),
    FOREIGN KEY (cnpj_farmacia)
        REFERENCES farmacia(cnpj)
 );
 
 -- Para criar a chave estrangeira (FOREIGN KEY), deve-se
 -- colocar o nome FOREIGN KEY (nome da chave, de forma
 -- semelhante da outra tabela), na linha seguinte escrever
 -- REFERENCES + nome da tabela que quero pegar a informação
 -- +(o dado que quero pegar pra colocar de chave estrangeira)
 
-- Criando terceira tabela
CREATE TABLE produto(
    codproduto INT PRIMARY KEY,
    quantproduto INT NOT NULL,
    valorproduto DECIMAL(10,2) NOT NULL,
    cnpj_farmacia CHAR(14),
    FOREIGN KEY (cnpj_farmacia)
        REFERENCES farmacia(cnpj)
);
 
-- Alterar uma coluna de uma tabela ja criada
ALTER TABLE farmacia
MODIFY cep CHAR(8) NOT NULL;
 
-- Alterando outra coluna
ALTER TABLE farmacia
MODIFY telefone BIGINT NOT NULL;
 
-- Alterando outra coluna
ALTER TABLE produto
MODIFY codproduto INT AUTO_INCREMENT;
 
-- Não foi necessário colocar que é uma PK pq o
-- sistema já identifica que é uma PK
 
-- Inserir um dado na primeira tabela
INSERT INTO farmacia(
    cnpj,
    nomefarmacia,
    telefone,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    cep
)
VALUES(
    '123456789000199',
    'Farmácia Saúde Total',
    1133224455,
    'Rua das Flores',
    '123',
    'Próximo ao mercado',
    'Centro',
    'São Paulo',
    'SP',
    '01001000'
);
 
-- Listando todos os dados de uma tabela
SELECT *
FROM farmacia;

-- Listando os dados de duas colunas
SELECT nomefarmacia, cidade
FROM farmacia;

-- Listando com filtro
SELECT *
FROM farmacia
WHERE cidade = 'São Paulo';

-- Listar com comparação
SELECT *
FROM produto
WHERE quantproduto > 20;

SELECT *
FROM farmacia
WHERE cidade = 'São Paulo'
AND bairro = 'jardins';

SELECT *
FROM farmacia
WHERE cidade = 'São Paulo'
OR cidade = 'Campinas';

SELECT *
FROM produto
WHERE valorproduto BETWEEN 10 AND 50;

-- Busca por texto
SELECT *
FROM farmacia
WHERE nomefarmacia LIKE 'Farmácia%';

-- Busca por palavra específica
SELECT *
FROM farmacia
WHERE nomefarmacia LIKE '%Vida';

-- Ordem ascendente
SELECT *
FROM farmacia
ORDER BY nomefarmacia ASC;

-- Ordem descendente/decrescente
SELECT *
FROM farmacia
ORDER BY cidade DESC;

-- Limite de registros
SELECT *
FROM farmacia
LIMIT 2;

-- Mostrando o produto mais barato
SELECT *
FROM produto
ORDER BY valorproduto ASC
LIMIT 1;

-- Where, order by, limit (combinados)
SELECT *
FROM farmacia
WHERE cidade = 'São Paulo'
ORDER BY nomefarmacia
LIMIT 2;

-- Join relacionando tabelas
SELECT p.codproduto, p.valorproduto, fa.nomefarmacia
FROM produto p 
JOIN farmacia fa ON p.cnpj_farmacia = fa.cnpj;

-- Inner Join - Farmacêutico e Farmácia
SELECT
    farmaceutico.nomefarmaceutico,
    farmacia.nomefarmacia,
    farmacia.cidade
FROM farmaceutico
INNER JOIN farmacia
ON farmaceutico.cnpj_farmacia = farmacia.cnpj;

-- Inner Join + Where
SELECT
    p.codproduto,
    p.valorproduto
FROM produto p 
INNER JOIN farmacia f 
ON p.cnpj_farmacia = f.cnpj 
WHERE f.nomefarmacia = 'Farmácia Popular';

-- Inner Join + Order By
SELECT
    p.codproduto,
    p.valorproduto,
    f.nomefarmacia
FROM produto p
INNER JOIN farmacia f
ON p.cnpj_farmacia = f.cnpj
ORDER BY p.valorproduto ASC;

-- Deletar um dado da tabela (tente apagar sempre pela PK)
DELETE FROM farmacia
WHERE cnpj = '123456789000199';
 
-- Alterando um dado específico de uma coluna
UPDATE farmacia
SET telefone = 1198765432
WHERE cnpj = '123456789000199';

-- Alterar telefone para bigint, assim ele aceita números com 9
ALTER TABLE farmacia
MODIFY telefone BIGINT NOT NULL;
 
-- Inserindo vários dados ao mesmo tempo
INSERT INTO farmacia(
    cnpj,
    nomefarmacia,
    telefone,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    cep
)
VALUES(
    '11111111000111',
    'Farmácia Popular',
    11999990001,
    'Av. Brasil',
    '1000',
    NULL,
    'Jardins',
    'São Paulo',
    'SP',
    '01452000'
),
(
    '22222222000122',
    'Drogaria Vida',
    11888887777,
    'Rua Central',
    '45',
    'Sala 2',
    'Centro',
    'Campinas',
    'SP',
    '013010000'
),
(
    '33333333000133',
    'Farmácia Bem Estar',
    11777776666,
    'Rua Saúde',
    '789',
     NULL,
    'Vila Nova',
    'Santos',
    'SP',
    '11015000'
);
 
-- Inserindo dado da tabela farmaceutico (FL foi referenciada)
INSERT INTO farmaceutico(
    rg,
    nomefarmaceutico,
    cnpj_farmacia
)
VALUES(
    12345678,
    'João Carlos da Silva',
    '11111111000111'
);
 
-- Inserindo dados na tabela de produtos
INSERT INTO produto(
    codproduto,
    quantproduto,
    cnpj_farmacia
)
VALUES(
    50,
    19.90,
    '11111111000111'
);

-- Criando novo usuário no banco de dados
CREATE USER 'usuario_farmacia'@'localhost'
IDENTIFIED BY 'senha123';

-- Concedendo permissões - total
GRANT ALL PRIVILEGES
ON sistemadefarmacia.*
TO 'usuario_farmacia'@'localhost';

-- Concedendo permissão - apenas de leitura
GRANT SELECT
ON sistemadefarmacia.*
TO 'usuario_farmacia'@'localhost';

-- Concedendo permissões específicas
GRANT SELECT, INSERT
ON sistemadefarmacia.*
TO 'usuario_farmacia'@'localhost';

-- Revogando permissões de um usuário
REVOKE INSERT
ON sistemadefarmacia.*
FROM 'usuario_farmacia'@'localhost';

-- Revogando todas as permissões do usuário
REVOKE ALL PRIVILEGES
ON sistemadefarmacia.*
FROM 'usuario_farmacia'@'localhost';

-- Excluíndo usuário 
DROP USER 'usuario_farmacia'@'localhost';

