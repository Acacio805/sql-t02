CREATE DATABASE acacio3d;

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(200) NOT NULL
);

CREATE TABLE formulario 
( 
 modelo_jogo BOOLEAN NOT NULL,  
 tipo_modelo VARCHAR(50) NOT NULL,  
 deadline DATE NOT NULL,
 descricao VARCHAR(500),  
 id_cliente INT,  
 id_artista INT,  
 id_comissao INT PRIMARY KEY AUTO_INCREMENT  
);

CREATE TABLE artista 
( 
 id_artista INT PRIMARY KEY AUTO_INCREMENT  
);

ALTER TABLE formulario ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE formulario ADD FOREIGN KEY(id_artista) REFERENCES artista (id_artista);