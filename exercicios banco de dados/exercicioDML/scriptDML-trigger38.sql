DROP DATABASE IF EXISTS DBCOMPRAPARCELADA;
CREATE DATABASE DBCOMPRAPARCELADA;
USE DBCOMPRAPARCELADA;

CREATE TABLE COMPRA (
	IDCOMPRA INT NOT NULL AUTO_INCREMENT	
    , DTCOMPRA DATE
	, VALOR_TOTAL NUMERIC(8,2)
	, QTDE_PARCELA INT
	, DT_COMPRA DATE
    	, PRIMARY KEY (IDCOMPRA)
);

CREATE TABLE PARCELA(
	IDPARCELA INT NOT NULL AUTO_INCREMENT
    	, IDCOMPRA INT NOT NULL
    	, NUMERO INT
    	, DT_VENCIMENTO DATE
    	, VALOR NUMERIC(8,2)
    	, PRIMARY KEY (IDPARCELA)
    	, FOREIGN KEY (IDCOMPRA) REFERENCES COMPRA (IDCOMPRA)
);

delimiter $

create procedure p_valor_parcelas(pVALOR_TOTAL NUMERIC(8,2), pQTDE_PARCELA INT)
begin

	declare vidcompra int;
	declare vcontador int;
    declare vdt_vencimento date;
    declare vvalorparcela numeric(8,2);
    declare vvalor_diferenca numeric(8,2);
    declare vidparcela int;

	insert into COMPRA (VALOR_TOTAL, QTDE_PARCELA, DT_COMPRA) 
	values (pvalor_total, pqtde_parcela, now());

	set vidcompra = last_insert_id();
    set vcontador = 1;
    set vvalorparcela = pvalor_total/pqtde_parcela;
    set vdt_vencimento = now();
    
    while(vcontador <= pqtde_parcela) do
    
    set vdt_vencimento = date_add(vdt_vencimento, interval 1 month);
    insert into parcela(idcompra, numero, dt_vencimento, valor) values (vidcompra, vcontador, vvalorparcela);
    set vcontador = vcontador+1;
    end while;
 
	select compra.valor_total - sum(parcela.valor) as diferenca, max(parcela.idparcela) into vvalor_diferenca, vidparcela from parcela inner join compra on compra.idcompra = parcela.idcompra group by compra.valor_total;
    
    update parcela set valor = valor + vvalordiferenca where idparcela= vidparcela;
end$

delimiter ;