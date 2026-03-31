CREATE DATABASE escola;

CREATE TABLE pessoainstrutora(
    cod_pessoainstrutora INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(500) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE disciplina(
    cod_disciplina INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cod_pessoainstrutora INT NOT NULL,
    FOREIGN KEY (cod_pessoainstrutora) 
    REFERENCES pessoainstrutora(cod_pessoainstrutora)   
);

CREATE TABLE estudante(
    cod_estudante INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(500) NOT NULL,
    telefone VARCHAR(20),
    cod_disciplina INT NOT NULL,
    FOREIGN KEY (cod_disciplina) 
    REFERENCES disciplina(cod_disciplina)
);

ALTER TABLE pessoainstrutora
CHANGE nome nomepesssoainstrutora VARCHAR(200);

ALTER TABLE disciplina
CHANGE nome nomedisciplina VARCHAR(200);

ALTER TABLE estudante
CHANGE nome nomeestudante VARCHAR(200);

INSERT INTO pessoainstrutora(
    nomepesssoainstrutora,
    telefone
)
VALUES(
    'carlos',
    '11932851251'
);

INSERT INTO estudante(
    nomeestudante,
    telefone
)
VALUES(
    'marcos',
    '11967321743'
);

INSERT INTO disciplina(
    nomedisciplina
)
VALUES(
    'SQL'
);

INSERT INTO disciplina(
    nomedisciplina
)
VALUES(
    'PYTHON'
);

UPDATE estudante
SET telefone = '11932561353'
WHERE nomeestudante = 'marcos';

DELETE FROM pessoainstrutora
WHERE cod_pessoainstrutora = 1;

DROP TABLE IF EXISTS pessoainstrutora;

DROP TABLE IF EXISTS disciplina;

DROP TABLE IF EXISTS estudante;

DROP DATABASE escola;