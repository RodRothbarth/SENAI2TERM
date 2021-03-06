CREATE DATABASE IF NOT EXISTS EXERCICIO15;
USE EXERCICIO15;

CREATE TABLE CLIENTE(
IDCLIENTE INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(45),
EMAIL VARCHAR(45),
CPF	VARCHAR(11),
CNH VARCHAR(15),
IDCONTATO INT NOT NULL,
PRIMARY KEY(IDCLIENTE),
FOREIGN KEY(IDCONTATO) REFERENCES CONTATO
);
CREATE TABLE ENDERECO(
IDENDERECO INT NOT NULL AUTO_INCREMENT,
CEP VARCHAR(8),
RUA VARCHAR(45),
NUMERO INT,
COMPLEMENTO VARCHAR(45),
BAIRRO VARCHAR(45),
CIDADE VARCHAR(45),
ESTADO VARCHAR(2),
PRIMARY KEY(IDENDERECO)
);
CREATE TABLE CONTATO(
IDCONTATO INT NOT NULL AUTO_INCREMENT,
RESIDENCIAL VARCHAR(15),
CELULAR VARCHAR(15),
REFERENCIA VARCHAR(15),
PRIMARY KEY(IDCONTATO)
);
CREATE TABLE LOCACAO(
IDLOCACAO INT NOT NULL AUTO_INCREMENT,
DT_LOCACAO DATE NOT NULL,
DT_ENTREGA DATE NOT NULL,
KM_LOCACAO INT NOT NULL,
KM_ENTREGA INT NOT NULL,
IDCLIENTE INT NOT NULL,
PRIMARY KEY(IDLOCACAO),
FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE
);
CREATE TABLE CARRO(
IDCARRO INT NOT NULL AUTO_INCREMENT,
MARCA VARCHAR(45),
MODELO VARCHAR(45),
COMBUSTIVEL ENUM('G','A','D'),
ANO_MODELO VARCHAR(4),
ANO_FABRICACAO VARCHAR(4),
PRIMARY KEY (IDCARRO)
);
CREATE TABLE OPCIONAL(
IDOPCIONAL INT NOT NULL AUTO_INCREMENT,
AR_CONDICIONADO ENUM('S','N'),
TRAVA ENUM('S','N'),
DIRECAO_HIDRAULICA ENUM('S','N'),
PRIMARY KEY(IDOPCIONAL)
);

CREATE TABLE HABITAR(
IDCLIENTE INT NOT NULL,
IDENDERECO INT NOT NULL,
FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE,
FOREIGN KEY(IDENDERECAO) REFERENCES ENDERECO
);
CREATE TABLE LOCAR(
IDCARRO INT NOT NULL,
IDLOCACAO INT NOT NULL,
FOREIGN KEY(IDCARRO) REFERENCES CARRO,
FOREIGN KEY(IDLOCACAO) REFERENCES LOCACAO
);
CREATE TABLE POSSUIR(
IDCARRO INT NOT NULL,
IDOPCIONAL INT NOT NULL,
FOREIGN KEY(IDCARRO) REFERENCES CARRO,
FOREIGN KEY(IDOPCIONAL) REFERENCES OPCIONAL
);