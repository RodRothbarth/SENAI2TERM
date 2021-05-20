SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBCOPIASEGURANCA;
CREATE DATABASE DBCOPIASEGURANCA;

USE DBCOPIASEGURANCA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, NOME VARCHAR(100)
	, DT_NASCIMENTO DATE
	, CPF CHAR(11)
	, CIDADE VARCHAR(100)
	, ESTADO CHAR(2)
);

CREATE TABLE HISTORICO_CLIENTE (
	IDHISTORICO INT NOT NULL AUTO_INCREMENT
    , ACAO VARCHAR(15)
    , DTACAO DATETIME
	, IDCLIENTE_ANTES INT 
	, IDCLIENTE_DEPOIS INT 
	, NOME_ANTES VARCHAR(100)
	, NOME_DEPOIS VARCHAR(100)
	, DT_NASCIMENTO_ANTES DATE
	, DT_NASCIMENTO_DEPOIS DATE
	, CPF_ANTES CHAR(11)
	, CPF_DEPOIS CHAR(11)
	, CIDADE_ANTES VARCHAR(100)
	, CIDADE_DEPOIS VARCHAR(100)
	, ESTADO_ANTES CHAR(2)
	, ESTADO_DEPOIS CHAR(2)
    , PRIMARY KEY (IDHISTORICO)
);

delimiter $

create trigger tr_insert_cliente after insert on cliente for each row
begin

	insert into histotico_cliente(acao, dtacao, idcliente_depois, nome_depois, dt_nascimento_depois, cpf_depois, cidade_depois, estado_depois) values ('insert', now(), new.idcliente, new.nome, new.dt_nascimento, new.cpf, new.cidade, new.estado);
end $
    
create trigger tr_update_cliente after update on cliente for each row
begin

	insert into histotico_cliente(acao, dtacao, idcliente_depois, nome_depois, dt_nascimento_depois, cpf_depois, cidade_depois, estado_depois, idcliente_antes, nome_antes, dt_nascimento_antes, cpf_antes, cidade_antes, estado_antes) values ('update', now(), new.idcliente, new.nome, new.dt_nascimento, new.cpf, new.cidade, new.estado, old.idcliente, old.nome, old.dt_nascimento, old.cpf, old.cidade, old.estado);
	
 end $   

create trigger tr_cliente_delete after delete on cliente for each row
begin

	insert into histotico_cliente(acao, dtacao, idcliente_antes, nome_antes, dt_nascimento_antes, cpf_antes, cidade_antes, estado_antes) values ('delete', now(), old.idcliente, old.nome, old.dt_nascimento, old.cpf, old.cidade, old.estado);
    
end$

delimiter ;

INSERT INTO CLIENTE(NOME)VALUES('ANDRE');
UPDATE CLIENTE SET NOME = 'MARIA', CIDADE = 'SAO JOSE';

 DELETE FROM CLIENTE;