create database cerimonial
default character set utf8mb3 
default collate utf8_general_ci;

use cerimonial;
create table eventos(
idEventos int NOT NULL  auto_increment primary key,
tipo varchar(15) NOT NULL,
descricao varchar(100),
idLista int,
idAgendamento int,
idCronograma int,
idContrato int,
idCliente int,
constraint fk_lista_eventos foreign key (idLista) references listaConvidados (idLista),
constraint fk_agendamento_eventos foreign key (idAgendamento) references agendamento (idAgendamento),
constraint fk_cronograma_eventos foreign key (idCronograma) references cronograma (idCronograma),
constraint fk_contrato_eventos foreign key (idContrato) references contrato (idContrato),
constraint fk_cliente_eventos foreign key (idCliente) references cliente (idCliente)
);
alter table eventos;
alter table  eventos  modify  column  descricao  varchar ( 500 );

insert into eventos values
('Casamento','Casamento para 150 pessoas, tendo que organizar o cerimonial e a festa'),
('Aniversario','Aniversario de 10 anos, festa para 50 pessoas, tendo que organizar somente a festa'),
('Casamento','Casamento para 150 pessoas, tendo que organizar o cerimonial e a festa'),
('Aniversario','Aniversario de 15 anos, festa para 100 pessoas, tendo que organizar somente a festa'),
('Casamento','Casamento para 150 pessoas, tendo que organizar o cerimonial e a festa');
select * from eventos ;

create table cliente(
idCliente int not null auto_increment,
nome varchar(50),
rg int not null,
cpf BIGINT not null,
telefone varchar (20),
primary key (idCliente),
idContrato int,
constraint fk_contrato_cliente foreign key (idContrato) references Contrato (idContrato),
idAgendamento int,
constraint fk_agendamento_cliente foreign key (idAgendamento) references Agendamento (idAgendamento)

);
insert into cliente (nome, rg, cpf, telefone) values
('Carolina',123456789,98745632111,'998745632'),
('Beatriz',987456321,36985214778,'996543219'),
('Maria Eduarda',456987123,32178965479,'991452367'),
('Gabriel',321987456,357951486211,'997777720'),
('Victoria',369852147,96374125873,'997555552');
select * from cliente ;

create table cronograma (
idCronograma int not null auto_increment primary key,
horaCronograma time,
descricaoCronograma varchar (200)
);

insert into cronograma (dataCronograma, horaCronograma,descricaoCronograma) values
('2022-12-23','17:00:00','fgdfgdgdgdgd'),
('2023-07-10','16:30:00','rggtrhytjhyj'),
('2023-06-09','15:30:00','yujkkmthtrgf'),
('2023-05-08','18:00:00','tyrryehtuty'),
('2023-10-07','17:30:00','ytuiyikkk');

select*from cronograma;

create table agendamento
(
	idAgendamento int NOT NULL auto_increment primary key,
    dataAgendamento date 
    
);
insert into agendamento (dataAgendamento) values
('2022-12-23'),
('2023-07-10'),
('2023-06-09'),
('2023-05-08'),
('2023-10-07');
select * from agendamento;
create table fornecedor(
idFornecedor int not null auto_increment primary key,
nomeEmpresa varchar (200),
produto varchar(100),
preco int not null,
telefone varchar(20),
observacao varchar(100)
);

   
insert into fornecedor (nomeEmpresa, produto,preco,telefone,observacao) values 
('Sweet','bolo',100.00,'99999999','fsggfdgg'),
('Doceria','bem casado',250.20,'33332556','rgrgththt'),
('DocesECia','brigadeiros',398.28,'78945612','htrhtruhyuh'),
('Comidas','buffet',698.12,'65478956','ikuyikuyt'),
('Salgateria','salgadinhos',367.23,'41236589','ertyrtyt');

select * from fornecedor;

create table listaConvidados (
idLista int not null auto_increment primary key,
nome  varchar(50),
mesa int (3),
idade int (3),
telefone varchar(15)
);

insert into listaConvidados (nome, mesa, idade, telefone) values 
('Victoria',5,22,'998745632'),
('Beatriz',10,18,'991452365'),
('Maria Eduarda',50,18,'997854123'),
('Leticia',20,18,'996325874'),
('Gabriel',8,19,'998523641');

select * from listaConvidados;
SELECT COUNT(nome) AS quatidade FROM listaConvidados;

create table contrato(
idContrato int not null auto_increment primary key,
conteudo MEDIUMBLOB not null
);
alter table eventos add column idLista int,
add constraint fk_lista_eventos
foreign key (idLista) references listaConvidados (idLista);

alter table eventos add column idAgendamento int,
add constraint fk_agendamento_eventos 
foreign key (idAgendamento) references agendamento (idAgendamento);

alter table eventos add column idCronograma int,
add constraint fk_cronograma_eventos
 foreign key (idCronograma) references cronograma (idCronograma);

alter table eventos add column idContrato int, 
add constraint fk_contrato_eventos 
foreign key (idContrato) references contrato (idContrato);

alter table eventos add column idCliente int, 
add constraint fk_cliente_eventos 
foreign key (idCliente) references cliente (idCliente);

alter table cliente add column idContrato int,
add constraint fk_contrato_cliente 
foreign key (idContrato) references Contrato (idContrato);

alter table cliente add column idAgendamento int,
add constraint fk_agendamento_cliente 
foreign key (idAgendamento) references Agendamento (idAgendamento);

ALTER TABLE cliente MODIFY cpf BIGINT;
describe contrato; 
describe cliente;
alter table eventos;