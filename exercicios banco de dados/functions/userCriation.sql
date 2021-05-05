create user 'ADRIANA'@'%' identified by '123456';
create user 'ALFREDO'@'%' identified by '123456';
create user 'ANA'@'%' identified by '123456';
create user 'ANDERSON'@'%' identified by '123456';
create user 'ANDRESSA'@'%' identified by '123456';
create user 'BRUNA'@'%' identified by '123456';
create user 'CARLA'@'%' identified by '1323456';

grant SELECT, UPDATE ON DBCARTAOCREDITO.cartao  to 'ADRIANA'@'%';
grant SELECT  ON DBCARTAOCREDITO.*  to 'ALFREDO'@'%';
grant SELECT, UPDATE, insert ON DBCARTAOCREDITO.*  to 'ANA'@'%';
grant SELECT ON DBCARTAOCREDITO.cartao  to 'ANDERSON'@'%';
grant SELECT, UPDATE ON DBCARTAOCREDITO.cliente  to 'BRUNA'@'%';
grant SELECT ON DBCARTAOCREDITO.boleto  to 'BRUNA'@'%';
grant all privileges ON DBCARTAOCREDITO.cartao  to 'CARLA'@'%';
grant SELECT ON DBCARTAOCREDITO.*  to 'CARLA'@'%';
grant SELECT ON DBCARTAOCREDITO.*  to 'ANDRESSA'@'%';

