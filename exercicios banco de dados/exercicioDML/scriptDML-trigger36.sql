DROP DATABASE IF EXISTS DBFUNCAO;
CREATE DATABASE DBFUNCAO;
USE DBFUNCAO;

CREATE TABLE ALUNO (
	IDALUNO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(20) NOT NULL,
	SEXO ENUM ('M', 'F'),
	DT_NASCIMENTO DATE,
	CIDADE VARCHAR(20)
);

INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('ANDERSON'	, '1998-01-17', 'M','PALHOCA');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('CESAR'		, '1996-06-21', 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('DANIEL'	, '1989-10-19', 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('DIEGO'		, '1991-12-19', 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('EDUARDO'	, '1991-01-20', 'M', NULL);
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('GABRIEL'	, '1996-06-19', 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('JOAO'		, '1992-01-18', 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('LEONARDO'	, '1989-07-19', 'M', NULL);
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('LUCAS'		, '1998-01-20', 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('PRISCILA'	, '2005-04-19', 'M', 'PALHOÇA');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('RENATA'	, '1991-12-21', 'F', 'TUBARAO');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('MARIA'		, '1992-12-22', 'F', 'BLUMENAU');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('TANIA'		, '1996-08-19', 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('CARLOS'	, '2001-10-22', 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('JOSE'		, '1996-06-19', 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('MARISA'	, '1991-06-19', 'F', NULL);
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('AMANDA'	, '2004-03-20', 'F', NULL);
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('JOANA'		, '1998-01-19', 'F', NULL);
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('ALICE'		, '1991-06-21', 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, DT_NASCIMENTO, SEXO, CIDADE)VALUES('TADEU'		, '1995-12-18', 'M', 'TUBARAO');

delimiter $
CREATE FUNCTION FN_IDADE (pDTNASCIMENTO DATE) RETURNS INT
BEGIN
	DECLARE vIDADE INT;
    
    SET vIDADE = YEAR(NOW()) - YEAR(pDTNASCIMENTO);
 
	IF(date_add(pDTNASCIMENTO, interval vIDADE year) > NOW() ) THEN
		SET vIDADE = vIDADE - 1;
    END IF;
    
    RETURN vIDADE;
 
END $$

CREATE FUNCTION FN_NIVER(pDATANASCIMENTO DATE) RETURNS DATE
BEGIN
	DECLARE vQTDE_ANOS INT;
    
    SET vQTDE_ANOS = YEAR(NOW()) - YEAR(pDATANASCIMENTO);

	IF(DATE_ADD(pDATANASCIMENTO, INTERVAL vQTDE_ANOS YEAR) < NOW() ) THEN
		RETURN DATE_ADD(pDATANASCIMENTO, INTERVAL vQTDE_ANOS + 1 YEAR);
    ELSE
		RETURN DATE_ADD(pDATANASCIMENTO, INTERVAL vQTDE_ANOS YEAR);
    END IF;

END $$
delimiter ;

-- 01 
select nome, locate('r', nome) from aluno where nome like '%r%';

-- 2
select nome, concat(ucase(left(nome,1)), lcase(right(nome, length(nome)-1))) from aluno;

-- 3
select concat(case sexo when 'm' then 'Sr.' else 'Sra.' end, concat(ucase(left(nome,1)), lcase(right(nome, length(nome)-1)))) from aluno;

-- 4
select concat(concat(nome, ' mora em '), cidade) from aluno where cidade is not null;

-- 05
select nome, fn_idade(dt_nascimento) from aluno;

-- 06 
select nome, fn_niver(dt_nascimento) from aluno;




