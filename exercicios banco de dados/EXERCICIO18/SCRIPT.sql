create database if not exists exercicio18;

use exercicio18;

create table funcionario(
idfuncionario int not null auto_increment,
nome varchar(45),
tel_celular int,
tel_residencial int,
chefe int,
setor varchar(20),
dt_admissao date,
primary key (idfuncionario)
);