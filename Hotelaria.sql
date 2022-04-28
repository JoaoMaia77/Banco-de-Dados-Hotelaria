create database hotelaria_3a2;
use hotelaria_3a2;
 
create table cliente(
codigo integer not null primary key,
nome varchar(80) not null,
cpf int not null,
tipo_convenio varchar(40) not null
)engine=innodb;

create table servico_copa(
codigo integer not null primary key,
registro varchar(100) not null,
tipo_servico varchar(40) not null
)engine=innodb;

create table reserva(
codigo integer not null primary key,
datainicio date not null,
datafim date not null,
quarto int not null,
valor double(9,2) not null,
cliente_codigo integer not null,
foreign key(cliente_codigo) references cliente(codigo)
)engine=innodb;

create table hospede(
codigo integer not null primary key,
nome varchar(80) not null,
telefone char(15) not null,
email varchar(60) not null,
reserva_codigo integer not null,
foreign key(reserva_codigo) references reserva(codigo)
)engine=innodb;

create table quarto(
codigo integer not null primary key,
numero int not null,
andar int not null,
classificacao varchar(40) not null,
hospede_codigo integer not null,
foreign key(hospede_codigo) references hospede(codigo)
)engine=innodb;

create table servicos(
codigo integer not null primary key,
itens varchar(50) not null,
tipo varchar(50) not null,
observacao varchar(100) not null,
quarto_codigo integer not null,
servico_copa_codigo integer not null,
foreign key(quarto_codigo) references quarto(codigo),
foreign key(servico_copa_codigo) references servico_copa(codigo)
)engine=innodb;


-- 3
insert into cliente(codigo,nome,cpf,tipo_convenio) values ('12','afonso','1234','tipo1');
insert into cliente(codigo,nome,tipo) values ('11','jubileu','5678','tipo2');
insert into cliente(codigo,nome,tipo) values ('13','amanda','90121','tipo3');

-- 4
insert into reservas(codigo,datainicio,datafim,quarto,valor) values ('12','16/08/2021','20/08/2021','5','300');
insert into reservas(codigo,datainicio,datafim,quarto,valor) values ('122','16/08/2021','30/08/2021','8','640');
insert into reservas(codigo,datainicio,datafim,quarto,valor) values ('22','14/08/2021','23/08/2021','7','400');

-- 5
insert into hospedes(codigo,nome,telefone,email) values ('12','afonso','123456789098765','afonso@email.com');
insert into hospedes(codigo,nome,telefone,email) values ('15','jubileu','563214782136548','jubileu@email.com');
insert into hospedes(codigo,nome,telefone,email) values ('16','amanda','563219874563214','amanda@email.com');

-- 6 
insert into quarto(codigo,numero,andar,classificacao) values ('12','405','4','otimo');
insert into quarto(codigo,numero,andar,classificacao) values ('13','408','4','otimo');

-- 7 
insert into servico_copa(codigo,registro,tipo_servico) values ('12','feito','refeicao');
insert into servico_copa(codigo,registro,tipo_servico) values ('17','feito','refeicao');

-- 8 
insert into servicos(codigo,item,tipo,observacao) values ('12','chocolate','alimento','gostoso');
insert into servicos(codigo,item,tipo,observacao) values ('14','agua','bebida','gelada');
insert into servicos(codigo,item,tipo,observacao) values ('18','refrigerante','bebida','gelada');
insert into servicos(codigo,item,tipo,observacao) values ('28','cerveja','bebida','gelada');

-- 9 
delete from reserva where valor > 100;

-- 10
delete from hospede;

-- 11
update reserva set valor = 100 where datainicio ='05/08/2021';


-- 12
select * from reserva where datainicio > '0/05/18' && datainicio < '0/06/18' ;

-- 13
select count(*) as qtde_clientes from cliente;

-- 14
select count(andar) as qtde_quartos from quarto where andar = 2;

-- 15
select avg(valor) from reserva;

-- 16
select cpf, nome from cliente;

-- 17
select * from servico_copa where uf = "almoço";

-- 18
select sum(valor) as soma_reserva from reserva;

-- 19
select nome, telefone, email from hospede order by nome;

-- 20
delete from servico_copa where codigo < 10;

-- 21
select nome, telefone from hospede where codigo > 15 && codigo < 20;

-- 22
select registro, tipo_serviço from serviso_copa order by cod;

-- 23
select count(limpeza) as qtde_limpeza from servico;

-- 25
select itens, tipo from servicos where quarto_cod = 2;

-- 26
select avg(quarto) from reserva where quarto_cod = 4;

-- 27
update reserva set datafim = '20130401' where quarto_cod = 8;

-- 28
delete from reserva where valor < 35.00;

-- 29
delete from servicos where codigo =! 150;
