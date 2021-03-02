CREATE DATABASE IF NOT EXISTS DBEXERCICIO16;
USE DBEXERCICIO16;

CREATE TABLE CLIENTE(
IDCLIENTE INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(50),
ENDERECO VARCHAR(100),
TELEFONE INT,
CPF INT,
PRIMARY KEY(IDCLIENTE)
);
CREATE TABLE PRODUTO(
IDPRODUTO INT NOT NULL AUTO_INCREMENT,
SALGADO VARCHAR(45),
DOCE VARCHAR(45),
CALZONE ENUM('SIM','NÃO'),
FOCACCIA ENUM('SIM','NÃO'),
PRIMARY KEY (IDPRUDUTO)
);
CREATE TABLE EVENTO(
IDEVENTO INT NOT NULL AUTO_INCREMENT,
HR_EVENTO TIME,
DT_EVENTO DATE,
ENDERECO VARCHAR(100),
IDCLIENTE INT NOT NULL,
PRIMARY KEY(IDEVENTO),
FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE)
);
CREATE TABLE OFERECE(
IDEVENTO INT NOT NULL,
IDPRODUTO INT NOT NULL,
PRIMARY KEY (IDEVENTO, IDPRODUTO),
FOREIGN KEY(IDEVENTO) REFERENCES EVENTO (IDEVENTO),
FOREIGN KEY(IDPRODUTO) REFERENCES PRODUTO (IDPRUDUTO)
);