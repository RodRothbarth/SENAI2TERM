SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBPEDIDO;
CREATE DATABASE DBPEDIDO;

USE DBPEDIDO;

CREATE TABLE PRODUTO (
	IDPRODUTO INT NOT NULL AUTO_INCREMENT
    , NOME VARCHAR(45)
    , ESTOQUE INT
	, PRIMARY KEY(IDPRODUTO)
);

CREATE TABLE COMPRA (
	IDCOMPRA INT NOT NULL AUTO_INCREMENT
    , IDPRODUTO INT NOT NULL
	, QTDE INT
    , PRECOUNITARIO NUMERIC(8,2)
    , PRIMARY KEY (IDCOMPRA)
    , FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO(IDPRODUTO)
);

CREATE TABLE VENDA (
	IDVENDA INT NOT NULL AUTO_INCREMENT
    , IDPRODUTO INT NOT NULL
	, QTDE INT
    , PRECOUNITARIO NUMERIC(8,2)
    , PRIMARY KEY (IDVENDA)
    , FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO(IDPRODUTO)
);

delimiter $
-- resp 1
create trigger tr_ai_compra after insert on compra for each row
begin
	update produto set estoque = estoque + 	new.qtde 
    where idpruduto = new.idproduto;

end $
  
-- resp 2 
create trigger tr_ai_venda after insert on venda for each row
begin
	update produto set estoque = estoque - new.qtde 
    where idproduto = new.idproduto;
end $
-- resp 3
create trigger tr_bd_compra before delete on compra for each row
begin
	declare vqtdestoque int;
    select estoque into vqtdestoque from produto where idproduto = old.idproduto;
	if ( vqtdestoque < old.qtd) then
		signal sqlstate '45000' set message_text = 'Estoque insuficiente para excluir compra';
    else
		update produto set estoque = estoque - old.qtde
		where idproduto = old.idproduto;
    end if;
end$
-- resp 4
create trigger tr_ad_venda after delete on venda for each row
begin
	update produto set estoque = estoque + old.qtde 
    where idproduto = old.idproduto;
end $

-- resp 5
create trigger tr_bi_venda before insert on venda for each row
begin
	declare vqtdestoque int;
    select estoque into vqtdestoque from produto where idproduto = new.idproduto;
    
	if  (vqtdestoque < new.qtde) then
		signal sqlstate '45000' set message_text = 'Estoque insuficiente';
    end if;

end $ 

-- resp 6
create trigger tr_bu_compra before update on compra for each row
begin
	declare vqtdestoque int;
    select estoque into vqtdestoque from produto where idproduto = old.idproduto;
	
    if new.idproduto <> old.idproduto then
		if vqtdestoque < old.qtde then
			signal sqlstate '45000' set message_text = 'Estoque vendido, alteração indisponivel';
		else 
			update produto set estoque = estoque - old.qtde
            where idproduto = old.idproduto;
            update produto set estoque = estoque + new.qtde
            where idproduto = new.idproduto;
		end if;
        
	else 
    
		if new.qtde >= old.qtde then
			update produto set estoque = estoque + (new.qtde - old.qtde) 
			where idproduto = new.idproduto;
		else 
			if vqtdestoque < (old.qtde - new.qtde) then
				signal sqlstate '45000' set message_text = 'Estoque insuficiente';
			else 
				update produto set estoque = estoque + (old.qtde - new.qtde) 
			where idproduto = new.idproduto;
			end if;
	end if;
end if;
end $

create trigger tr_bu_venda before update on venda for each row
begin
declare vqtdestoque int;
select estoque into vqtdestoque from produto where idproduto = new.idproduto;

	if new.idproduto <> old.idproduto then
		if vqtdestoque < new.qtde then
			signal sqlstate '45000' set message_text = 'Estoque insuficiente';
		else 
			update produto set estoque = estoque + old.qtde
            where idpruduto = old.idproduto;
            
            update produto set estoque = estoque - new.qtde
            where idpruduto = new.idproduto;
		end if;
	else
		if (new.qtde <= old.qtde) then
			update produto set estoque = estoque + (old.qtde - new.qtde)
            where idpruduto = old.idproduto;
		else
			if vqtdestoque < (new.qtde - old.qtde) then
				signal sqlstate '45000' set message_text = 'Estoque insuficiente';
            else
				update produto set estoque = estoque - (old.qtde - new.qtde)
				where idpruduto = old.idproduto;
			end if;
		end if;
	end if;
	end $
delimiter ;

insert into produto values (default, "refrigerante", 0);
select estoque from produto where idproduto = 1;
