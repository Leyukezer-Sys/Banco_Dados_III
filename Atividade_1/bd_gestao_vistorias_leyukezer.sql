create database bd_gestao_vistorias_leyukezer;

use bd_gestao_vistorias_leyukezer;

create table estado(
id_est int primary key auto_increment,
nome_est varchar(40) not null,
uf_est varchar(40)
);

insert into estado(nome_est,uf_est) values(
'RONDÔNIA',
'RO'
),
(
'AMAZONAS',
'AM'
),
(
'MATO GROSSO',
'MT'
);

create table cidade(
id_cid int primary key auto_increment,
nome_cid varchar(45) not null,
id_est_fk int not null,
foreign key (id_est_fk) references estado(id_est)
);

insert into cidade(nome_cid, id_est_fk) values(
'JI-PARANÁ',
1
),
(
'OURO PRETO DO OESTE',
1
),
(
'PRESIDENTE MÉDICI',
1
);

create table endereco(
id_end int primary key auto_increment,
cep_end varchar(9) not null,
logradouro_end varchar(80) not null,
numero_end varchar(7) not null,
bairro_end varchar(20) not null,
id_cid_fk int not null,
foreign key (id_cid_fk) references cidade(id_cid)
);

insert into endereco(
cep_end,
logradouro_end,
numero_end,
bairro_end,
id_cid_fk
) values (
'76900-622',
'Rua Trinta e Um de Março',
'474-632',
'Jardim dos Migrantes',
1
), (
'76920-000',
'R. Getúlio Vargas',
'416',
'União',
2
), (
'76916-000',
'R. Bela Vista',
'1241',
'Vila Bandeira Branca',
3
);