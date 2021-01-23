CREATE DATABASE IF NOT EXISTS EXERCICIO14;
USE EXERCICIO14;

CREATE TABLE FILIAL(
IDFILIAL INT NOT NULL AUTO_INCREMENT,
ENDERECO VARCHAR(45),
TELEFONE INT,
PRIMARY KEY (IDFILIAL)
);
CREATE TABLE CLIENTE(
IDCLIENTE INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(45),
EMAIL VARCHAR(45),
TELEFONE INT,
PRIMARY KEY(IDCLIENTE)
);
CREATE TABLE FUNCIONARIO(
IDFUNCIONARIO INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(45),
CARGO VARCHAR(45),
TELEFONE INT,
IDFILIAL INT NOT NULL,
PRIMARY KEY(IDFUNCIONARIO),
FOREIGN KEY(IDFILIAL) REFERENCES FILIAL
);
CREATE TABLE PROJETO(
IDPROJETO INT NOT NULL AUTO_INCREMENT,
TITULO VARCHAR(45),
DT_INICIO DATE,
DT_FIM DATE NOT NULL,
IDCLIENTE VARCHAR(45) NOT NULL,
PRIMARY KEY (IDPROJETO),
FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE
);
CREATE TABLE CONSULTAR(
IDCLIENTE INT NOT NULL,
IDFILIAL INT NOT NULL,
FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE,
FOREIGN KEY(IDFILIAL) REFERENCES FILIAL
);
CREATE TABLE REALIZAR(
IDPROJETO INT NOT NULL,
IDFUNCIONARIO INT NOT NULL,
FOREIGN KEY(IDPROJETO) REFERENCES PROJETO,
FOREIGN KEY(IDFUNCIONARIO) REFERENCES FUNCIONARIO
);
