SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBALUNO;
CREATE DATABASE DBALUNO;
USE DBALUNO;

CREATE TABLE ALUNO (
	IDALUNO INT NOT NULL AUTO_INCREMENT
	, NOME VARCHAR(20) NOT NULL
	, SEXO CHAR(1)
	, IDADE INT
	, CIDADE VARCHAR(20)
    , PRIMARY KEY (IDALUNO)
);

INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('ANDERSON', 17, 'M','PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('CESAR', 21, 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('DANIEL', 19, 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('DIEGO', 19, 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('EDUARDO', 20, 'M', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('GABRIEL', 19, 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOAO', 18, 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('LEONARDO', 19, 'M', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('LUCAS', 20, 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('PRISCILA', 19, 'F', 'PALHOÇA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('RENATA', 21, 'F', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('MARIA', 22, 'F', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('TANIA', 19, 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('CARLOS', 22, 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOSE', 19, 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('MARISA', 19, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('AMANDA', 20, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOANA', 19, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('ALICE', 21, 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('TADEU', 18, 'M', 'TUBARAO');


SELECT * FROM ALUNO;
select count(idaluno), sexo from aluno group by sexo;
select count(idaluno), idade from aluno group by idade;
select count(idaluno), cidade from aluno where cidade is not null group by cidade;
select count(idaluno), cidade from aluno where cidade is null;
select avg(idade), sexo from aluno group by sexo;
select count(idaluno), avg(idade) from aluno where cidade='florianopolis';
select  count(idaluno), sexo  from aluno where idade <> 18 group by sexo;
select min(idade), cidade, sexo  from aluno where cidade="sao jose" and idade <20 and sexo="m";
select count(idaluno), sexo from aluno where (sexo="f" and idade>20) or (sexo="m" and idade>17) group by sexo;
select max(idade), min(idade), sexo from aluno where sexo="F";
select sum(idade), cidade from aluno where cidade="blumenau";
select count(idaluno), sexo from aluno where cidade <>"palhoca" and idade between 15 and 18 group by sexo;
select count(idaluno), cidade from aluno group by cidade having count(idaluno)>4;
select count(idaluno), idade from aluno group by idade order by idade desc;
select avg(idade), max(idade), min(idade), count(idaluno), cidade from aluno group by cidade having count(idaluno)>3;