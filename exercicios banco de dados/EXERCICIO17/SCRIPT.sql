CREATE DATABASE IF NOT EXISTS EXERCICIO17;
USE EXERCICIO17;

CREATE TABLE CLIENTE(
IDCLIENTE INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(50),
CPF INT,
TEL_CELULAR INT,
TEL_RESIDENCIAL INT,
TEL_REFERENCIA VARCHAR(50),
ENDERECO VARCHAR(100),
DT_NASCIMENTO DATE,
DT_CADASTRO DATE,
PRIMARY KEY (IDCLIENTE)
);

CREATE TABLE FUNCIONARIO(
IDFUNCIONARIO INT NOT NULL auto_increment,
NOME VARCHAR(45),
MATRICULA INT,
PRIMARY KEY (IDFUNCIONARIO)
);

CREATE TABLE CARACTERISTICA(
IDCARACTERISTICA INT NOT NULL auto_increment,
GARAGEM INT,
NUM_QUARTOS INT,
AREA_TOTAL DECIMAL(6,1),
AREA_UTIL DECIMAL(6,1),
PRIMARY KEY (IDCARACTERISTICA)
);

CREATE TABLE IMOVEL(
IDIMOVEL INT NOT NULL AUTO_INCREMENT,
VALOR DECIMAL(11, 2),
DESCRICAO TEXT,
PONTO_REFERENCIA VARCHAR(50),
ENDERECO VARCHAR(100),
IDCARACTERISTICA INT NOT NULL,
PRIMARY KEY (IDIMOVEL),
FOREIGN KEY (IDCARACTERISTICA) REFERENCES CARACTERISTICA (IDCARACTERISTICA)
);

CREATE TABLE FINANCIAMENTO(
IDFINANCIAMENTO INT NOT NULL AUTO_INCREMENT,
DT_FINANCIAMENTO DATE,
DT_VANCIMENTO DATE,
INI_COBRANCA DATE,
DT_APROVACAO DATE,
VALOR DECIMAL(11,2),
TX_JUROS DECIMAL(3,2),
IDCLIENTE INT NOT NULL,
IDIMOVEL INT NOT NULL,
IDFUNCIONARIO INT NOT NULL,
PRIMARY KEY (IDFINANCIAMENTO),
FOREIGN KEY (INCLIENTE) REFERENCES CLIENTE (IDCLIENTE),
FOREIGN KEY (IDIMOVEL) REFERENCES IMOVEL (IDIMOVEL),
foreign key (IDFUNCIONARIO) references FUNCIONARIO (IDFUNCIONARIO)
);

CREATE TABLE APRESENTA(
IDIMOVEL INT NOT NULL,
IDCARACTERISTICA INT NOT NULL,
VALOR INT,
PRIMARY key (IDIMOVEL, IDCARACTERISTICA),
FOREIGN KEY (IDIMOVEL) REFERENCES IMOVEL (IDIMOVEL),
FOREIGN KEY (IDCARACTERISTICA) REFERENCES CARACTERISTICA (IDCARACTERISTICA)
);

CREATE TABLE PARCELA(
IDPARCELA INT NOT NULL auto_increment,
DT_VENCIMENTO DATE,
DT_PAGAMENTO DATE,
DT_GERACAO DATE,
VALOR_PAGO DECIMAL(11,2),
VALOR_VENCIMENTO DECIMAL(11,2),
IDFINANCIAMENTO INT NOT NULL,
PRIMARY KEY (IDPARCELA),
FOREIGN KEY (IDFINANCIAMENTO) REFERENCES FINANCIAMENTO (IDFINANCIAMENTO)
);



