SET SQL_SAFE_UPDATES = 0;

DROP DATABASE IF EXISTS DBESTATISTICA;

CREATE DATABASE DBESTATISTICA;

USE DBESTATISTICA;

CREATE TABLE PESSOA (
	IDPESSOA INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, NOME VARCHAR(45)
	, SEXO CHAR(1)
);

CREATE TABLE ESTATISTICA (	
	HOMEM INT
	, MULHER INT
);

delimiter $$

create trigger tr_pessoa after insert on pessoa for each row
begin

	if new.sexo = 'm' then 
		update estatistica set homem = homem + 1;
	elseif new.sexo = 'f' then
		update estatistica set mulher = mulher + 1;
	end if;

end $$

create trigger tr_pessoa2 after delete on pessoa for each row
begin

	if old.sexo = 'm' then
		update estatistica set homem = homem - 1;
	elseif old.sexo = 'f' then
		update estatistica set mulher = mulher - 1;
	end if;

end $$

create trigger tr_pessoa3 after update on pessoa for each row
begin

	if new.sexo = 'm' then
		update estatistica set homem = homem + 1;
	elseif new.sexo = 'f' then
		update estatistica set mulher = mulher + 1;
	end if;
    
    if old.sexo = 'm' then
		update estatistica set homem = homem - 1;
	elseif old.sexo = 'f' then
		update estatistica set mulher = mulher - 1;
	end if;

end $$

create trigger tr_pessoa4 before update on pessoa for each row
begin
	if new.sexo <> 'm' and new.sexo <> 'f' and new.sexo is null then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Genero não reconhecido';
    end if;
end $$

create trigger tr_pessoa5 before insert on pessoa for each row
begin
	if new.sexo <> 'm' and new.sexo <> 'f' and new.sexo is null then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Genero não reconhecido';
    end if;
end $$

delimiter ;

insert into estatistica (homem, mulher)values(0,0);

insert into pessoa (nome, sexo) values ('joao', 'm');
insert into pessoa values (default, 'maria', 'f');

select * from pessoa;
select * from estatistica;
-- delete from pessoa where nome = 'joao';

update pessoa set sexo = 'f' where nome = 'maria';

