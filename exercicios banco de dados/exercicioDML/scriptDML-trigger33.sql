DROP DATABASE IF EXISTS DBVACINA;
CREATE DATABASE DBVACINA;
USE DBVACINA;

CREATE TABLE COMPRA (
	IDCOMPRA INT NOT NULL AUTO_INCREMENT
    , DTCOMPRA DATE
    , LOTE CHAR(15)
    , QTDE INT
    , INTERVALO INT
    , PRIMARY KEY (IDCOMPRA)
);

CREATE TABLE PACIENTE (
	IDPACIENTE INT NOT NULL AUTO_INCREMENT
    , NOME VARCHAR(45)
    , DTATENDIMENTO DATE
    , PRIMARY KEY (IDPACIENTE)
);

CREATE TABLE VACINA (
	IDVACINA INT NOT NULL AUTO_INCREMENT
    , IDCOMPRA INT NOT NULL
    , REGISTRO CHAR(25)
    , IDPACIENTE INT
    , DTAPLICACAO DATE
    , DOSE INT
    , PRIMARY KEY (IDVACINA)
    , FOREIGN KEY (IDCOMPRA) REFERENCES COMPRA (IDCOMPRA)
    , FOREIGN KEY (IDPACIENTE) REFERENCES PACIENTE (IDPACIENTE)
);


-- new.dtcompra = now()
-- lpad(month(now()), 2, '0') as mes;
-- lpad(day(now()), 2,'0') as dia
-- lpad(1,7,'0')) as lote

delimiter $

create trigger tr_bi_compra before insert on compra for each row
begin    

	declare vId char(7); 
    
	select lpad(AUTO_INCREMENT,7,'0') into vId FROM information_schema.tables 
	WHERE TABLE_SCHEMA = 'DBVACINA' AND TABLE_NAME = 'COMPRA';
    
    set new.lote = concat(concat(year(now()), lpad(month(now()), 2, '0')), concat(lpad(day(now()), 2,'0'), vId));
    set new.dtcompra = now();
    
end $

create trigger tr_ai_compra after insert on compra for each row
begin
	declare vqtde int;
    
    set vqtde = 1;
	while vqtde <= new.qtde do
	insert into vacina (idcompra, registro) values (new.idcompra, concat(new.lote, lpad(vqtde, 10, '0')));
    set vqtde = vqtde + 1;
    
    end while;
    
end $
create trigger tr_ai_paciente after insert on paciente for each row
begin

	

	SELECT MIN(IDVACINA) 
	INTO vIDVACINA_1DOSE
	FROM VACINA WHERE IDPACIENTE IS NULL;

	UPDATE VACINA SET IDPACIENTE = NEW.IDPACIENTE, DTAPLICACAO = NOW() 
	WHERE IDVACINA = vIDVACINA_1DOSE;


end $

  
delimiter ;

insert into compra (qtde)values (5);
commit;
insert into compra (qtde)values (2);

insert into paciente (nome)values ('rodrigo');


