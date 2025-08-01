#Aluno: Leyukezer Cruz 
#script bd_agenciabancaria - versão 7.0
create database bd_leyukezer;
use bd_leyukezer;

create table estado (
id_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2) not null,
regiao_est varchar (300)
);

insert into estado values (null, 'acre', 'ac', 'norte');
insert into estado values (null, 'alagoas', 'al', 'nordeste');
insert into estado values (null, 'amapá', 'ap', 'norte');
insert into estado values (null, 'amazonas', 'am', 'norte');
insert into estado values (null, 'bahia', 'ba', 'nordeste');
insert into estado values (null, 'ceará', 'ce', 'nordeste');
insert into estado values (null, 'distrito federal', 'df', 'centro-oeste');
insert into estado values (null, 'espírito santo', 'es', 'sudeste');
insert into estado values (null, 'goiás', 'go', 'centro-oeste');
insert into estado values (null, 'maranhão', 'ma', 'nordeste');
insert into estado values (null, 'mato grosso', 'mt', 'centro-oeste');
insert into estado values (null, 'mato grosso do sul', 'ms', 'centro-oeste');
insert into estado values (null, 'minas gerais', 'mg', 'sudeste');
insert into estado values (null, 'pará', 'pa', 'norte');
insert into estado values (null, 'paraíba', 'pb', 'nordeste');
insert into estado values (null, 'paraná', 'pr', 'sul');
insert into estado values (null, 'pernambuco', 'pe', 'nordeste');
insert into estado values (null, 'piauí', 'pi', 'nordeste');
insert into estado values (null, 'rio de janeiro', 'rj', 'sudeste');
insert into estado values (null, 'rio grande do norte', 'rn', 'nordeste');
insert into estado values (null, 'rio grande do sul', 'rs', 'sul');
insert into estado values (null, 'rondônia', 'ro', 'norte');
insert into estado values (null, 'roraima', 'rr', 'norte');
insert into estado values (null, 'santa catarina', 'sc', 'sul');
insert into estado values (null, 'são paulo', 'sp', 'sudeste');
insert into estado values (null, 'sergipe', 'se', 'nordeste');
insert into estado values (null, 'tocantins', 'to', 'norte');

create table cidade (
id_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
id_est_fk int,
foreign key (id_est_fk) references estado (id_est)
);

-- rondonia
insert into cidade values (null, 'ji-paraná', 22);
insert into cidade values (null, 'porto velho', 22);
insert into cidade values (null, 'vilhena', 22);
insert into cidade values (null, 'ariquemes', 22);
insert into cidade values (null, 'jaru', 22);
insert into cidade values (null, 'guajará-mirim ', 22);
insert into cidade values (null, 'colorado do oeste', 22);
insert into cidade values (null, 'ouro preto do oeste', 22);
insert into cidade values (null, 'pimenta bueno', 22);

-- acre
insert into cidade values (null, 'rio branco', 1);
insert into cidade values (null, 'cruzeiro do sul', 1);
insert into cidade values (null, 'feijó', 1);
insert into cidade values (null, 'tarauacá', 1);
insert into cidade values (null, 'sena madureira', 1);

-- alagoas
insert into cidade values (null, 'maceió', 2);
insert into cidade values (null, 'arapiraca', 2);
insert into cidade values (null, 'palmeira dos índios', 2);
insert into cidade values (null, 'rio largo', 2);
insert into cidade values (null, 'união dos palmares', 2);

-- amapá
insert into cidade values (null, 'macapá', 3);
insert into cidade values (null, 'santana', 3);
insert into cidade values (null, 'laranjal do jari', 3);
insert into cidade values (null, 'oiapoque', 3);
insert into cidade values (null, 'porto grande', 3);

-- amazonas
insert into cidade values (null, 'manaus', 4);
insert into cidade values (null, 'parintins', 4);
insert into cidade values (null, 'itacoatiara', 4);
insert into cidade values (null, 'manacapuru', 4);
insert into cidade values (null, 'coari', 4);

-- bahia
insert into cidade values (null, 'salvador', 5);
insert into cidade values (null, 'feira de santana', 5);
insert into cidade values (null, 'vitória da conquista', 5);
insert into cidade values (null, 'camaçari', 5);
insert into cidade values (null, 'itabuna', 5);
-- ceará
insert into cidade values (null, 'fortaleza', 6);
insert into cidade values (null, 'caucaia', 6);
insert into cidade values (null, 'juazeiro do norte', 6);
insert into cidade values (null, 'maracanaú', 6);
insert into cidade values (null, 'sobral', 6);

-- distrito federal
insert into cidade values (null, 'brasília', 7);

-- espírito santo
insert into cidade values (null, 'vitória', 8);
insert into cidade values (null, 'vila velha', 8);
insert into cidade values (null, 'cariacica', 8);
insert into cidade values (null, 'serra', 8);
insert into cidade values (null, 'linhares', 8);

-- goiás
insert into cidade values (null, 'goiânia', 9);
insert into cidade values (null, 'aparecida de goiânia', 9);
insert into cidade values (null, 'anápolis', 9);
insert into cidade values (null, 'rio verde', 9);
insert into cidade values (null, 'luziânia', 9);

-- maranhão
insert into cidade values (null, 'são luís', 10);
insert into cidade values (null, 'imperatriz', 10);
insert into cidade values (null, 'são josé de ribamar', 10);
insert into cidade values (null, 'caxias', 10);
insert into cidade values (null, 'timon', 10);
-- mato grosso
insert into cidade values (null, 'cuiabá', 11);
insert into cidade values (null, 'várzea grande', 11);
insert into cidade values (null, 'rondonópolis', 11);
insert into cidade values (null, 'sinop', 11);
insert into cidade values (null, 'tangará da serra', 11);

-- mato grosso do sul
insert into cidade values (null, 'campo grande', 12);
insert into cidade values (null, 'dourados', 12);
insert into cidade values (null, 'três lagoas', 12);
insert into cidade values (null, 'corumbá', 12);
insert into cidade values (null, 'ponta porã', 12);

-- minas gerais
insert into cidade values (null, 'belo horizonte', 13);
insert into cidade values (null, 'uberlândia', 13);
insert into cidade values (null, 'contagem', 13);
insert into cidade values (null, 'juiz de fora', 13);
insert into cidade values (null, 'betim', 13);

-- pará
insert into cidade values (null, 'belém', 14);
insert into cidade values (null, 'ananindeua', 14);
insert into cidade values (null, 'santarém', 14);
insert into cidade values (null, 'marabá', 14);
insert into cidade values (null, 'castanhal', 14);

-- paraíba
insert into cidade values (null, 'joão pessoa', 15);
insert into cidade values (null, 'campina grande', 15);
insert into cidade values (null, 'santa rita', 15);
insert into cidade values (null, 'patos', 15);
insert into cidade values (null, 'bayeux', 15);
-- mato grosso
insert into cidade values (null, 'cuiabá', 11);
insert into cidade values (null, 'várzea grande', 11);
insert into cidade values (null, 'rondonópolis', 11);
insert into cidade values (null, 'sinop', 11);
insert into cidade values (null, 'tangará da serra', 11);

-- mato grosso do sul
insert into cidade values (null, 'campo grande', 12);
insert into cidade values (null, 'dourados', 12);
insert into cidade values (null, 'três lagoas', 12);
insert into cidade values (null, 'corumbá', 12);
insert into cidade values (null, 'ponta porã', 12);

-- minas gerais
insert into cidade values (null, 'belo horizonte', 13);
insert into cidade values (null, 'uberlândia', 13);
insert into cidade values (null, 'contagem', 13);
insert into cidade values (null, 'juiz de fora', 13);
insert into cidade values (null, 'betim', 13);

-- pará
insert into cidade values (null, 'belém', 14);
insert into cidade values (null, 'ananindeua', 14);
insert into cidade values (null, 'santarém', 14);
insert into cidade values (null, 'marabá', 14);
insert into cidade values (null, 'castanhal', 14);

-- paraíba
insert into cidade values (null, 'joão pessoa', 15);
insert into cidade values (null, 'campina grande', 15);
insert into cidade values (null, 'santa rita', 15);
insert into cidade values (null, 'patos', 15);
insert into cidade values (null, 'bayeux', 15);
-- paraná
insert into cidade values (null, 'curitiba', 16);
insert into cidade values (null, 'londrina', 16);
insert into cidade values (null, 'maringá', 16);
insert into cidade values (null, 'ponta grossa', 16);
insert into cidade values (null, 'cascavel', 16);

-- pernambuco
insert into cidade values (null, 'recife', 17);
insert into cidade values (null, 'jaboatão dos guararapes', 17);
insert into cidade values (null, 'olinda', 17);
insert into cidade values (null, 'caruaru', 17);
insert into cidade values (null, 'paulista', 17);

-- piauí
insert into cidade values (null, 'teresina', 18);
insert into cidade values (null, 'parnaíba', 18);
insert into cidade values (null, 'picos', 18);
insert into cidade values (null, 'campo maior', 18);
insert into cidade values (null, 'floriano', 18);

-- rio de janeiro
insert into cidade values (null, 'rio de janeiro', 19);
insert into cidade values (null, 'são gonçalo', 19);
insert into cidade values (null, 'duque de caxias', 19);
insert into cidade values (null, 'nova iguaçu', 19);
insert into cidade values (null, 'niterói', 19);

-- rio grande do norte
insert into cidade values (null, 'natal', 20);
insert into cidade values (null, 'mossoró', 20);
insert into cidade values (null, 'parnamirim', 20);
insert into cidade values (null, 'são gonçalo do amarante', 20);
insert into cidade values (null, 'ceará-mirim', 20);
-- rio grande do sul
insert into cidade values (null, 'porto alegre', 21);
insert into cidade values (null, 'caxias do sul', 21);
insert into cidade values (null, 'pelotas', 21);
insert into cidade values (null, 'santa maria', 21);
insert into cidade values (null, 'canoas', 21);

-- roraima
insert into cidade values (null, 'boa vista', 23);
insert into cidade values (null, 'rorainópolis', 23);
insert into cidade values (null, 'caracaraí', 23);
insert into cidade values (null, 'mucajaí', 23);
insert into cidade values (null, 'são joão da baliza', 23);

-- santa catarina
insert into cidade values (null, 'florianópolis', 24);
insert into cidade values (null, 'joinville', 24);
insert into cidade values (null, 'blumenau', 24);
insert into cidade values (null, 'são josé', 24);
insert into cidade values (null, 'lages', 24);

-- são paulo
insert into cidade values (null, 'são paulo', 25);
insert into cidade values (null, 'guarulhos', 25);
insert into cidade values (null, 'campinas', 25);
insert into cidade values (null, 'são bernardo do campo', 25);
insert into cidade values (null, 'santo andré', 25);

-- sergipe
insert into cidade values (null, 'aracaju', 26);
insert into cidade values (null, 'nossa senhora do socorro', 26);
insert into cidade values (null, 'lagarto', 26);
insert into cidade values (null, 'itabaiana', 26);
insert into cidade values (null, 'são cristóvão', 26);

-- tocantins
insert into cidade values (null, 'palmas', 27);
insert into cidade values (null, 'araguaína', 27);
insert into cidade values (null, 'gurupi', 27);
insert into cidade values (null, 'porto nacional', 27);
insert into cidade values (null, 'paraíso do tocantins', 27);


create table endereco (
id_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
id_cid_fk int not null,
foreign key (id_cid_fk) references cidade (id_cid)
); 

insert into endereco values (null, 'av. brasil', 111, 'nova brasília', 1);
insert into endereco values (null, 'av. marechal rondon', 1245, 'centro', 1);
insert into endereco values (null, 'rua dr. telma rios', 1174, 'colina park i', 1);
insert into endereco values (null, 'av. aracaju', 911, 'bnh', 1);
insert into endereco values (null, 'rua 07 de setembro', 121,'centro',  1);
insert into endereco values (null, 'rua mato grosso', 887, 'dom bosco', 1);
insert into endereco values (null, 'av. jorge teixeira', 1589, 'centro', 2);
insert into endereco values (null, 'av. paulista', 989, 'centro', 11);
insert into endereco values (null, 'travessa dos mineiros', 456, 'centro', 4);
insert into endereco values (null, 'av. monte castelo', 555, 'jardim dos migrantes', 1);
insert into endereco values (null, 'av. aracaju', 5111, 'nova brasilia', 1);
insert into endereco values (null, 'av. monte castelo', 9999, 'jardim dos migrantes', 1);
insert into endereco values (null, 'rua x', 12, 'jardim dos migrantes', 1);
insert into endereco values (null, 'k-0', 522, 'são francisco', 1);
insert into endereco values (null, 'av. monte castelo', 11229, 'jardim dos migrantes', 1);
insert into endereco values (null, 'rua das flores', 456, 'jardim das flores', 2);
insert into endereco values (null, 'av. dos ipês', 789, 'parque das árvores', 3);
insert into endereco values (null, 'travessa dos cravos', 231, 'jardim das rosas', 4);
insert into endereco values (null, 'rua das violetas', 876, 'parque floral', 5);
insert into endereco values (null, 'av. das begônias', 543, 'jardim primavera', 6);
insert into endereco values (null, 'travessa das orquídeas', 112, 'parque das tulipas', 7);
insert into endereco values (null, 'rua dos lírios', 789, 'jardim das margaridas', 8);
insert into endereco values (null, 'av. das dálias', 456, 'parque das hortênsias', 9);
insert into endereco values (null, 'travessa das azaleias', 231, 'jardim das camélias', 10);
insert into endereco values (null, 'rua dos girassóis', 876, 'parque dos girassóis', 11);
insert into endereco values (null, 'av. das acácias', 543, 'jardim das palmeiras', 12);
insert into endereco values (null, 'travessa dos manacás', 112, 'parque dos manacás', 13);
insert into endereco values (null, 'rua das bromélias', 789, 'jardim das bromélias', 14);
insert into endereco values (null, 'av. das laranjeiras', 456, 'parque das laranjeiras', 15);
insert into endereco values (null, 'travessa das goiabeiras', 231, 'jardim das goiabeiras', 16);
insert into endereco values (null, 'rua dos abacaxis', 876, 'parque dos abacaxis', 17);
insert into endereco values (null, 'av. das pitangas', 543, 'jardim das pitangas', 18);
insert into endereco values (null, 'travessa dos cajueiros', 112, 'parque dos cajueiros', 19);
insert into endereco values (null, 'rua das mangueiras', 789, 'jardim das mangueiras', 20);
insert into endereco values (null, 'av. das jabuticabeiras', 456, 'parque das jabuticabeiras', 21);


create table sexo (
id_sex int not null primary key auto_increment,
nome_sex varchar (100) not null
);

insert into sexo values (null, 'masculino');
insert into sexo values (null, 'feminino');



create table cliente (
id_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estado_civil_cli varchar (50),
cpf_cnpj_cli varchar (50) not null,
rg_ie_cli varchar (30),
data_nascimento_criacao_cli date,
renda_cli float,
telefone_cli varchar (50),
celular_cli varchar (50) not null,
id_sex_fk integer,
id_end_fk integer not null,
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_end_fk) references endereco (id_end)
);

insert into cliente values (null, 'rodrigo hilbert', 'casado', '111.111.111-11', '54654 sesdec', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 1, 3);
insert into cliente values (null, 'tiago lacerda', 'casado', '111.111.111-22', '54654 sesdec',  '1965-1-1', 456454.45, '', '', 1, 8);
insert into cliente values (null, 'tom cruise', 'solteiro', '111.111.111-33', '48877 sesdec',  '1950-05-30', 0.00, '11 454546511', '', 1, 1);
insert into cliente values (null, 'josé pereiro da silva', 'casado', '222.222.222-88', '8888888 spp',  '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 1, 4);
insert into cliente values (null, 'maria de jesus dos santos', 'solteira', '554.454.444-99', '99999 sesdec',  '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 2, 3);
insert into cliente values (null, 'camila de oliveira', 'casada', '987.123.654-55', '8889999 sesdec',  '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 2, 10);
insert into cliente values (null, 'marcos araujo de souza', 'casado', '654.789.123-88', '998877 sesdec',  '1970-01-01', 6845.00, '69 84085712', '69 84111111', 1, 9);
insert into cliente values (null, 'cleiton batista ferraz', 'solteiro', '321.111.222-44', '1234312 sesdec',  '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 1, 2);
insert into cliente values (null, 'eliana da cruz', 'solteira', '988.235.654-54', '12345 sesdec',  '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 2, 5);
insert into cliente values (null, 'igor garcia da silva', 'solteiro', '123.445.888-99', '999992 sesdec',  '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 1, 11);
insert into cliente values (null, 'jackson henrique da silva bezerra', 'casado', '529.562.612-15', '880075 sesdec',  '1987-06-30', 11000.00, '', '69 84085712', 1, 3);
insert into cliente values (null, 'jaqueline leão pereira', 'casada', '522.222.153-15', '12315 sesdec', '1993-06-21', 11000.00, null, '69 984210921', 2, 3);
insert into cliente values (null, 'gleicy borgio', 'casada', '126.777.888-99', null, null, 5000.00, null, '69 84888899', 2, 11);
insert into cliente values (null, 'diego da silva bezerra', 'solteiro', '111.987.123-55', null, null, 3999.99, null, '69 88997722', 1, 15);
insert into cliente values (null, 'murilo benicio', 'casado', '321.123.321-55', null, null, 2450.80, null, '11 2121 1111', 1, 8);
insert into cliente values (null, 'ana clara oliveira', 'solteira', '111.222.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 2, 6);
insert into cliente values (null, 'ana clara oliveira', 'solteira', '111.222.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 2, 6);
insert into cliente values (null, 'pedro henrique almeida', 'casado', '555.666.777-88', '998877 sesdec', '1980-08-22', 6500.00, '69 3421 5566', '69 84123 9876', 1, 9);
insert into cliente values (null, 'isabela pereira', 'solteira', '987.654.321-01', '12345 sesdec', '1992-05-10', 4200.00, '69 3421 8899', '69 99222 3344', 2, 5);
insert into cliente values (null, 'lucas souza', 'solteiro', '123.456.789-10', '54321 sesdec', '1988-11-03', 8900.00, '69 3421 2233', '69 87654 3210', 2, 7);
insert into cliente values (null, 'gabriela silva', 'casada', '987.654.321-98', '8889999 sesdec', '1997-02-20', 5500.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'ricardo martins', 'solteiro', '123.987.456-32', '87654 sesdec', '1985-09-17', 7600.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'carla santos', 'casada', '654.987.321-45', '876543 sesdec', '1975-12-01', 4800.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'roberto mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1991-04-12', 6200.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'marina costa', 'casada', '987.654.321-00', '12345 sesdec', '1983-07-25', 7100.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'felipe rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-10-08', 5800.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'lara alves', 'casada', '852.963.741-22', '87654 sesdec', '1986-02-14', 6800.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into cliente values (null, 'pedro martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-05-27', 8100.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into cliente values (null, 'larissa rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1984-09-30', 5900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'rafael pereira', 'casado', '123.987.456-32', '87654 sesdec', '1996-12-11', 7200.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'amanda santos', 'solteira', '654.987.321-45', '876543 sesdec', '1972-03-05', 5000.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'vinicius mendes', 'casado', '159.357.852-46', '998877 sesdec', '1999-06-18', 6700.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'thais costa', 'solteira', '987.654.321-00', '12345 sesdec', '1981-08-21', 4900.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'bruno rocha', 'casado', '258.369.147-00', '54321 sesdec', '1990-11-14', 6400.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'mariana alves', 'solteira', '852.963.741-22', '87654 sesdec', '1979-02-28', 7500.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into cliente values (null, 'eduardo martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1987-05-12', 9200.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into cliente values (null, 'carol rodrigues', 'casada', '987.654.321-98', '8889999 sesdec', '1995-08-25', 6300.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'andre pereira', 'solteiro', '123.987.456-32', '87654 sesdec', '1982-11-06', 7900.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'luana santos', 'casada', '654.987.321-45', '876543 sesdec', '1993-02-19', 5300.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'rodrigo mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1988-05-03', 7100.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'ana costa', 'casada', '987.654.321-00', '12345 sesdec', '1977-08-16', 6800.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'pedro rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1992-11-29', 5900.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'isabela alves', 'casada', '852.963.741-22', '87654 sesdec', '1974-04-10', 7500.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into cliente values (null, 'lucas martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1989-07-23', 8400.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into cliente values (null, 'gabriela rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1996-10-06', 6200.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'ricardo pereira', 'casado', '123.987.456-32', '87654 sesdec', '1976-01-18', 7800.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'carla alves', 'solteira', '654.987.321-45', '876543 sesdec', '1990-04-01', 5300.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'roberto rocha', 'casado', '159.357.852-46', '998877 sesdec', '1983-07-14', 6900.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'marina rodrigues', 'solteira', '987.654.321-00', '12345 sesdec', '1978-10-27', 5000.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'felipe almeida', 'casado', '258.369.147-00', '54321 sesdec', '1995-01-09', 6400.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'lara martins', 'solteira', '852.963.741-22', '87654 sesdec', '1980-04-22', 7700.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into cliente values (null, 'pedro mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-07-05', 9200.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into cliente values (null, 'larissa pereira', 'casada', '987.654.321-98', '8889999 sesdec', '1985-10-18', 6900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'rafael alves', 'solteiro', '123.987.456-32', '87654 sesdec', '1997-01-30', 8300.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'amanda rocha', 'casada', '654.987.321-45', '876543 sesdec', '1971-05-12', 5600.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'vinicius rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1994-08-25', 7200.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'thais pereira', 'solteira', '987.654.321-00', '12345 sesdec', '1982-11-07', 5500.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'bruno almeida', 'casado', '258.369.147-00', '54321 sesdec', '1991-02-20', 6700.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'mariana martins', 'solteira', '852.963.741-22', '87654 sesdec', '1973-05-04', 7400.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into cliente values (null, 'eduardo mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1986-08-17', 9100.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into cliente values (null, 'carol alves', 'casada', '987.654.321-98', '8889999 sesdec', '1999-11-30', 5900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into cliente values (null, 'andre rocha', 'solteiro', '123.987.456-32', '87654 sesdec', '1975-02-12', 7600.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into cliente values (null, 'luana alves', 'casada', '654.987.321-45', '876543 sesdec', '1992-05-25', 5200.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into cliente values (null, 'rodrigo rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1987-08-08', 6800.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into cliente values (null, 'ana rodrigues', 'casada', '987.654.321-00', '12345 sesdec', '1979-11-21', 7500.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into cliente values (null, 'pedro almeida', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-02-03', 6200.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into cliente values (null, 'ANGELA ATACADO ME', null, '11.123.321/0001-10', null, null, 50000, '69 3421 1212', '69 98441 4144', null, 20);
insert into cliente values (null, 'CAERD LTDA', null, '33.323.322/0001-33', '12356454', null, 5000500, '69 3421 3222', '69 2222 4144', null, 11);
insert into cliente values (null, 'MARCOS SOUZA SISTEMAS MEI', null, '11.233.677/0001-12', null, null, 5000, NULL, '69 98221 2244', null, 2);
insert into cliente values (null, 'ENERGISA SA', null, '99.877.878/0001-88', null, null, NULL, '69 3499 6666', '69 98466 9888', null, 19);
insert into cliente values (null, 'SUPERMERCADO BRASIL LTDA', null, '44.556.789/0001-22', null, null, 120000, '69 3422 4545', '69 98445 7878', null, 15);
insert into cliente values (null, 'AUTO PEÇAS RONDONIA ME', null, '55.667.890/0001-33', '98765432', null, 75000, '69 3423 5656', '69 98456 8989', null, 18);
insert into cliente values (null, 'GRÁFICA EXPRESS SA', null, '66.778.901/0001-44', null, null, 30000, '69 3424 6767', '69 98467 9090', null, 21);
insert into cliente values (null, 'CONSTRUTORA ALMEIDA E FILHOS LTDA', null, '77.889.012/0001-55', null, null, 500000, '69 3425 7878', '69 98478 0101', null, 9);
insert into cliente values (null, 'TRANSPORTADORA RIO NEGRO ME', null, '88.990.123/0001-66', null, null, 200000, '69 3426 8989', '69 98489 1212', null, 7);


create table banco (
id_ban int primary key not null auto_increment,
nome_ban varchar (200) not null
);

insert into banco values (null, 'caixa econômica federal');
insert into banco values (null, 'banco do brasil');

create table agencia (
id_ag int primary key not null auto_increment,
numero_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
id_ban_fk int not null,
id_end_fk int,
foreign key (id_ban_fk) references banco (id_ban),
foreign key (id_end_fk) references endereco (id_end)
);

insert into agencia values (null, '0951-2', 'centro', '69 3421 1111', 2, 2);
insert into agencia values (null, '4402-1', 'centro', '69 3422 2299', 2, 3);
insert into agencia values (null, '1824', 'centro', '69 3423 1925', 1, 5);
insert into agencia values (null, '1920', 'nova brasilia', '69 3421 1122', 1, 7);


create table conta_bancaria (
id_con int primary key not null auto_increment,
numero_con int not null,
data_abertura_con date not null,
data_encerramento_con date,
tipo_con varchar (100) not null,
saldo_con float,
valor_limite_con float,
id_ag_fk int not null,
id_cli_fk int not null,
foreign key (id_ag_fk) references agencia (id_ag),
foreign key (id_cli_fk) references cliente (id_cli)
);


-- agência 1 (15 contas)
insert into conta_bancaria values (null, 1001, '2024-01-01', null, 'corrente', 0.00, 500.00, 1, 1);
insert into conta_bancaria values (null, 1002, '2024-01-02', null, 'corrente', 0.00, 550.00, 1, 2);
insert into conta_bancaria values (null, 1003, '2024-01-03', null, 'corrente', 0.00, 600.00, 1, 3);
insert into conta_bancaria values (null, 1004, '2024-01-04', null, 'corrente', 0.00, 650.00, 1, 4);
insert into conta_bancaria values (null, 1005, '2024-01-05', null, 'poupança', 0.00, 700.00, 1, 5);
insert into conta_bancaria values (null, 1006, '2024-01-06', null, 'corrente', 0.00, 750.00, 1, 6);
insert into conta_bancaria values (null, 1007, '2024-01-07', null, 'corrente', 0.00, 800.00, 1, 7);
insert into conta_bancaria values (null, 1008, '2024-01-08', null, 'poupança', 0.00, 850.00, 1, 8);
insert into conta_bancaria values (null, 1009, '2024-01-09', null, 'corrente', 0.00, 900.00, 1, 9);
insert into conta_bancaria values (null, 1010, '2024-01-10', null, 'poupança', 0.00, 950.00, 1, 10);
insert into conta_bancaria values (null, 1011, '2024-01-11', null, 'poupança', 0.00, 1000.00, 1, 11);
insert into conta_bancaria values (null, 1012, '2024-01-12', null, 'corrente', 0.00, 1050.00, 1, 12);
insert into conta_bancaria values (null, 1013, '2024-01-13', null, 'corrente', 0.00, 1100.00, 1, 13);
insert into conta_bancaria values (null, 1014, '2024-01-14', null, 'poupança', 0.00, 1150.00, 1, 14);
insert into conta_bancaria values (null, 1015, '2024-01-15', null, 'corrente', 0.00, 1200.00, 1, 15);

-- agência 2 (15 contas)
insert into conta_bancaria values (null, 2001, '2024-02-01', null, 'poupança', 0.00, 500.00, 2, 16);
insert into conta_bancaria values (null, 2002, '2024-02-02', null, 'corrente', 0.00, 550.00, 2, 17);
insert into conta_bancaria values (null, 2003, '2024-02-03', null, 'corrente', 0.00, 600.00, 2, 18);
insert into conta_bancaria values (null, 2004, '2024-02-04', null, 'corrente', 0.00, 650.00, 2, 19);
insert into conta_bancaria values (null, 2005, '2024-02-05', null, 'poupança', 0.00, 700.00, 2, 20);
insert into conta_bancaria values (null, 2006, '2024-02-06', null, 'poupança', 0.00, 750.00, 2, 21);
insert into conta_bancaria values (null, 2007, '2024-02-07', null, 'poupança', 0.00, 800.00, 2, 22);
insert into conta_bancaria values (null, 2008, '2024-02-08', null, 'corrente', 0.00, 850.00, 2, 23);
insert into conta_bancaria values (null, 2009, '2024-02-09', null, 'corrente', 0.00, 900.00, 2, 24);
insert into conta_bancaria values (null, 2010, '2024-02-10', null, 'poupança', 0.00, 950.00, 2, 25);
insert into conta_bancaria values (null, 2011, '2024-02-11', null, 'corrente', 0.00, 1000.00, 2, 26);
insert into conta_bancaria values (null, 2012, '2024-02-12', null, 'corrente', 0.00, 1050.00, 2, 27);
insert into conta_bancaria values (null, 2013, '2024-02-13', null, 'corrente', 0.00, 1100.00, 2, 28);
insert into conta_bancaria values (null, 2014, '2024-02-14', null, 'corrente', 0.00, 1150.00, 2, 29);
insert into conta_bancaria values (null, 2015, '2024-02-15', null, 'corrente', 0.00, 1200.00, 2, 30);

-- agência 3 (18 contas)
insert into conta_bancaria values (null, 3001, '2024-03-01', null, 'corrente', 0.00, 500.00, 3, 31);
insert into conta_bancaria values (null, 3002, '2024-03-02', null, 'corrente', 0.00, 550.00, 3, 32);
insert into conta_bancaria values (null, 3003, '2024-03-03', null, 'corrente', 0.00, 600.00, 3, 33);
insert into conta_bancaria values (null, 3004, '2024-03-04', null, 'corrente', 0.00, 650.00, 3, 34);
insert into conta_bancaria values (null, 3005, '2024-03-05', null, 'corrente', 0.00, 700.00, 3, 35);
insert into conta_bancaria values (null, 3006, '2024-03-06', null, 'corrente', 0.00, 750.00, 3, 36);
insert into conta_bancaria values (null, 3007, '2024-03-07', null, 'poupança', 0.00, 800.00, 3, 37);
insert into conta_bancaria values (null, 3008, '2024-03-08', null, 'poupança', 0.00, 850.00, 3, 38);
insert into conta_bancaria values (null, 3009, '2024-03-09', null, 'poupança', 0.00, 900.00, 3, 39);
insert into conta_bancaria values (null, 3010, '2024-03-10', null, 'corrente', 0.00, 950.00, 3, 40);
insert into conta_bancaria values (null, 3011, '2024-03-11', null, 'poupança', 0.00, 1000.00, 3, 41);
insert into conta_bancaria values (null, 3012, '2024-03-12', null, 'corrente', 0.00, 1050.00, 3, 42);
insert into conta_bancaria values (null, 3013, '2024-03-13', null, 'corrente', 0.00, 1100.00, 3, 43);
insert into conta_bancaria values (null, 3014, '2024-03-14', null, 'corrente', 0.00, 1150.00, 3, 44);
insert into conta_bancaria values (null, 3015, '2024-03-15', null, 'corrente', 0.00, 1200.00, 3, 45);
insert into conta_bancaria values (null, 3016, '2024-03-16', null, 'corrente', 0.00, 1250.00, 3, 46);
insert into conta_bancaria values (null, 3017, '2024-03-17', null, 'poupança', 0.00, 1300.00, 3, 47);
insert into conta_bancaria values (null, 3018, '2024-03-18', null, 'poupança', 0.00, 1350.00, 3, 48);

-- agência 4 (18 contas)
insert into conta_bancaria values (null, 4001, '2024-04-01', null, 'poupança', 0.00, 500.00, 4, 49);
insert into conta_bancaria values (null, 4002, '2024-04-02', null, 'poupança', 0.00, 550.00, 4, 50);
insert into conta_bancaria values (null, 4003, '2024-04-03', null, 'corrente', 0.00, 600.00, 4, 51);
insert into conta_bancaria values (null, 4004, '2024-04-04', null, 'corrente', 0.00, 650.00, 4, 52);
insert into conta_bancaria values (null, 4005, '2024-04-05', null, 'corrente', 0.00, 700.00, 4, 53);
insert into conta_bancaria values (null, 4006, '2024-04-06', null, 'corrente', 0.00, 750.00, 4, 54);
insert into conta_bancaria values (null, 4007, '2024-04-07', null, 'corrente', 0.00, 800.00, 4, 55);
insert into conta_bancaria values (null, 4008, '2024-04-08', null, 'corrente', 0.00, 850.00, 4, 56);
insert into conta_bancaria values (null, 4009, '2024-04-09', null, 'corrente', 0.00, 900.00, 4, 57);
insert into conta_bancaria values (null, 4010, '2024-04-10', null, 'poupança', 0.00, 950.00, 4, 58);
insert into conta_bancaria values (null, 4011, '2024-04-11', null, 'corrente', 0.00, 1000.00, 4, 59);
insert into conta_bancaria values (null, 4012, '2024-04-12', null, 'corrente', 0.00, 1050.00, 4, 60);
insert into conta_bancaria values (null, 4013, '2024-04-13', null, 'poupança', 0.00, 1100.00, 4, 61);
insert into conta_bancaria values (null, 4014, '2024-04-14', null, 'poupança', 0.00, 1150.00, 4, 62);
insert into conta_bancaria values (null, 4015, '2024-04-15', null, 'corrente', 0.00, 1200.00, 4, 63);
insert into conta_bancaria values (null, 4016, '2024-04-16', null, 'poupança', 0.00, 1250.00, 4, 64);
insert into conta_bancaria values (null, 4017, '2024-04-17', null, 'poupança', 0.00, 1300.00, 4, 65);
insert into conta_bancaria values (null, 4018, '2024-04-18', null, 'corrente', 0.00, 1350.00, 4, 66);

create table if not exists deposito (
id_dep int primary key not null auto_increment,
valor_dep float not null,
data_dep date not null,
hora_dep time not null,
tipo_dep varchar (100),
id_con_fk int not null,
foreign key (id_con_fk) references conta_bancaria (id_con)
);

create table if not exists saque (
id_saq int primary key not null auto_increment,
valor_saq float not null,
data_saq date not null,
hora_saq time not null,
local_saq varchar (100) not null,
tarifa_saq float,
id_con_fk int not null,
foreign key (id_con_fk) references conta_bancaria (id_con)
);

create table if not exists transferencia (
id_trans int primary key not null auto_increment,
valor_trans float not null,
data_trans date not null,
hora_trans time not null,
descricao_trans varchar (100),
tarifa_trans float,
id_con_origem_fk int not null,
id_con_destino_fk int not null,
foreign key (id_con_origem_fk) references conta_bancaria (id_con),
foreign key (id_con_destino_fk) references conta_bancaria (id_con)
);

create table if not exists pagamento (
id_pag int primary key auto_increment,
valor_pag float not null,
data_pag date not null,
hora_pag time not null,
tipo_pag varchar (100),
tarifa_pag float,
data_vencimento_pag date not null,
codigo_barras_pag varchar (300) not null,
beneficiario_pag varchar (300) not null,
id_con_fk int not null,
foreign key (id_con_fk) references conta_bancaria (id_con)
);

#EXERCÍCIOS
/*
Exercicio 1: Crie um procedimento para inserir um novo depósito de acordo com as seguintes regras:

1) Garanta que os campos obrigatórios sejam preenchidos e que a FK de conta bancária realmente exista.

2) Só permita a inserção se o valor do depósito for MAIOR do que ZERO.

3) Verifique se o depósito é do tipo “Cheque” ou “Dinheiro”. Se for do tipo “Cheque” o valor do depósito não pode ser MAIOR do que 2000 reais. Se for do tipo “Dinheiro” o valor do depósito não pode ser MAIOR do que 5000 reais.

4) Não permita depósitos entre meia noite e 5h da manhã.

5) Garanta que a conta bancária alvo do depósito esteja ativa, ou seja, com a data de encerramento nula.

6) Informe o usuário na mensagem de confirmação se a conta alvodo depósito é do tipo corrente ou poupança;
*/

delimiter $$
create procedure novo_deposito(valor float, data_deposito date, hora time, tipo varchar(100), conta int)
begin
declare count_conta int;
declare data_encerramento date;

set data_encerramento = (select data_encerramento_con from conta_bancaria where (id_con = conta));

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

if (valor <> '' or valor is not null)then
	if (data_deposito is not null)then
		if (hora is not null)then
			if (tipo <> '' or tipo is not null)then
				if (conta <> '' or conta is not null)then
					if(count_conta <> 0)then
						if(hour(hora) > 05)then
							if( data_encerramento is null)then
								insert into deposito values (null, valor, data_deposito, hora, tipo, conta);
                                select concat('O deposito foi cadastrado para a conta do tipo ', (select tipo_con from conta_bancaria where (id_con = conta))) as confirmação;
                            else
								select concat('A conta #', conta, ' esta desativa desde o dia ', (data_encerramento)) as alerta;
							end if;
                        else
							select 'Os horarios permitidos para deposito são das 06h da manhã as 23h da noite' as alerta;
                        end if;
                    else
						select concat('A conta #', conta, ' não esta cadastrada no sistema!') as alerta;
					end if;
				else
					select 'A conta não pode ser vazia/nula!!' as alerta;
				end if;
			else
				select 'O tipo de deposito não pode ser vazio/nulo!!' as alerta;
			end if;
		else
			select 'A hora não pode ser vazia/nula!!' as alerta;
		end if;
	else
		select 'A data não pode ser vazia/nula!!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!!' as alerta;
end if;
end;
$$ delimiter ;

/*
Exercício 2: Crie um gatilho na tabela depósito para somar o valor do depósito no saldo da Conta Corrente do
cliente após a inserção de novo depósito.
Crie um gatilho na tabela depósito para subtrair o valor do depósito no saldo da Conta Corrente do
cliente após a exclusão de um depósito.
TESTE: Chame o procedimento do Exercício 1 e insira 40 depósitos em contas diferentes.
*/

delimiter $$
create trigger somar_deposito after insert on
deposito for each row
begin
	update conta_bancaria set
		saldo_con = saldo_con + new.valor_dep
	where
		id_con = new.id_con_fk;
end;
$$ delimiter ;

delimiter $$
create trigger debitar_deposito after delete on
deposito for each row
begin
	update conta_bancaria set
		saldo_con = saldo_con - old.valor_dep
	where
		id_con = old.id_con_fk;
end;
$$ delimiter ;

call novo_deposito(312.45, '2025-06-03', '06:42:00', 'dinheiro', 17);
call novo_deposito(198.00, '2025-06-12', '22:15:00', 'cheque', 44);
call novo_deposito(425.30, '2025-06-25', '14:08:00', 'dinheiro', 6);
call novo_deposito(150.00, '2025-06-09', '07:33:00', 'cheque', 29);
call novo_deposito(275.75, '2025-06-18', '11:47:00', 'dinheiro', 61);
call novo_deposito(90.00, '2025-06-01', '16:22:00', 'cheque', 18);
call novo_deposito(410.00, '2025-06-14', '13:05:00', 'dinheiro', 3);
call novo_deposito(130.25, '2025-06-22', '06:59:00', 'cheque', 52);
call novo_deposito(500.00, '2025-06-06', '17:10:00', 'dinheiro', 26);
call novo_deposito(210.00, '2025-06-30', '10:45:00', 'cheque', 64);
call novo_deposito(160.00, '2025-06-11', '07:12:00', 'dinheiro', 9);
call novo_deposito(300.00, '2025-06-04', '15:33:00', 'cheque', 38);
call novo_deposito(115.00, '2025-06-27', '06:21:00', 'dinheiro', 21);
call novo_deposito(350.00, '2025-06-15', '14:55:00', 'cheque', 59);
call novo_deposito(190.00, '2025-06-19', '11:03:00', 'dinheiro', 5);
call novo_deposito(275.00, '2025-06-10', '13:40:00', 'cheque', 43);
call novo_deposito(145.00, '2025-06-08', '10:27:00', 'dinheiro', 30);
call novo_deposito(220.00, '2025-06-21', '09:58:00', 'cheque', 14);
call novo_deposito(305.00, '2025-06-05', '12:36:00', 'dinheiro', 66);
call novo_deposito(125.00, '2025-06-28', '16:44:00', 'cheque', 1);
call novo_deposito(400.00, '2025-06-13', '06:03:00', 'dinheiro', 36);
call novo_deposito(95.00, '2025-06-02', '21:29:00', 'cheque', 27);
call novo_deposito(285.00, '2025-06-23', '15:12:00', 'dinheiro', 50);
call novo_deposito(170.00, '2025-06-26', '11:50:00', 'cheque', 11);
call novo_deposito(310.00, '2025-06-07', '10:18:00', 'dinheiro', 63);
call novo_deposito(135.00, '2025-06-29', '09:05:00', 'cheque', 22);
call novo_deposito(260.00, '2025-06-16', '13:17:00', 'dinheiro', 48);
call novo_deposito(100.00, '2025-06-24', '14:30:00', 'cheque', 6);
call novo_deposito(295.00, '2025-06-20', '06:50:00', 'dinheiro', 34);
call novo_deposito(185.00, '2025-06-17', '12:11:00', 'cheque', 17);
call novo_deposito(340.00, '2025-06-30', '16:00:00', 'dinheiro', 55);
call novo_deposito(150.00, '2025-06-03', '10:00:00', 'cheque', 2);
call novo_deposito(420.00, '2025-06-22', '15:45:00', 'dinheiro', 40);
call novo_deposito(110.00, '2025-06-06', '09:39:00', 'cheque', 13);
call novo_deposito(365.00, '2025-06-28', '11:22:00', 'dinheiro', 57);
call novo_deposito(240.00, '2025-06-12', '13:55:00', 'cheque', 32);
call novo_deposito(175.00, '2025-06-09', '08:15:00', 'dinheiro', 24);
call novo_deposito(390.00, '2025-06-25', '22:35:00', 'cheque', 16);
call novo_deposito(155.00, '2025-06-30', '10:10:00', 'dinheiro', 60);

/*
Exercicio 3: Crie um procedimento para inserir um novo Saque de acordo com as
seguinte regras:
1) A tarifa não deve ser recebida pelo procedimento, devendo ser
calculada automaticamente de acordo com as seguintes regras:
i. Se a conta for do tipo Corrente a tarifa é igual a 1,5% do valor sacado;
ii. Se a conta for do tipo Poupança a tarifa é igual a 1% do valor sacado;
2) Garanta que os campos obrigatórios sejam preenchidos e que a FK de
conta bancária realmente exista.
3) Só permita a inserção se houver saldo suficiente na Conta Bancária do
cliente, ou seja, o valor do saque deve ser MENOR ou IGUAL ao valor do
saldo + valor do limite da conta.
4) Não permita saques com valor superior a 3000 reais.
5) Não permita saque entre as 22h e as 6h da manhã.
6) Informe o usuário na mensagem de confirmação qual foi o valor da
tarifa do saque
*/

delimiter $$
create procedure novo_saque(valor float, data_saque date, hora time, local_saque varchar(100), conta int)
begin
declare count_conta int;
declare tarifa float;
declare valor_disponivel float;

if((select count(*) from conta_bancaria where ((id_con = conta) and (tipo_con like '%corrente%'))) <> 0)then
	set tarifa = 0.015 * valor;
else
	set tarifa = 0.01 * valor;
end if;

set valor_disponivel = (select saldo_con from conta_bancaria where (id_con = conta)) + (select valor_limite_con from conta_bancaria where (id_con = conta));

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

if (valor <> '' or valor is not null)then
	if (data_saque is not null)then
		if (hora is not null)then
			if (local_saque <> '' or local_saque is not null)then
				if (conta <> '' or conta is not null)then
					if(count_conta <> 0)then
						if((hour(hora) > 06) and (hour(hora) < 22))then
							if(valor <= 3000)then
								insert into saque values (null, valor, data_saque, hora, local_saque, tarifa, conta);
                                select concat('O saque foi cadastrado para a conta, a tarifa ficou de R$', format((tarifa), 2)) as confirmação;
                            else
								select concat('Não é possivel realizar saques acima de R$3000.00') as alerta;
							end if;
                        else
							select 'Os horarios permitidos para deposito são das 06h da manhã as 23h da noite' as alerta;
                        end if;
                    else
						select concat('A conta #', conta, ' não esta cadastrada no sistema!') as alerta;
					end if;
				else
					select 'A conta não pode ser vazia/nula!!' as alerta;
				end if;
			else
				select 'O local de saque não pode ser vazio/nulo!!' as alerta;
			end if;
		else
			select 'A hora não pode ser vazia/nula!!' as alerta;
		end if;
	else
		select 'A data não pode ser vazia/nula!!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!!' as alerta;
end if;
end;
$$ delimiter ;

/*
Exercicio 4: Crie um gatilho na tabela saque para subtrair o valor do saque no
saldo da Conta Corrente do cliente após a inserção de novo saque
de acordo com as seguintes regra:
1) Caso o saque utilize o valor do limite, você deverá subtrair
primeiro o valor do saque do saldo e a diferença no valor do
limite. Exemplo: “João possui 100 reais de saldo e 500 de limite e
deseja fazer um saque de 300 reais. O sistema deverá zerar o
saldo da conta e subtrair o valor restante (200 reais) do valor do
limite.”
2) Subtraia do saldo (se houver) ou limite (se não houver saldo) o
valor da tarifa. Caso a conta esteja usando o limite, e não for
suficiente para cobrir o valor da tarifa, subtraia o valor do saldo
deixando o mesmo negativo.
Crie um gatilho na tabela saque para somar o valor do saque e o
valor da tarifa no saldo e no valor do limite da conta corrente de
acordo com as regras anteriores após a exclusão de um saque.
TESTE: Chame o procedimento do Exercício 3 e insira 20 saques em
contas diferentes
*/

delimiter $$
create trigger debitar_saque after insert on
saque for each row
begin
	declare debitar_limite float;
    declare saldo_conta float;
    
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = new.id_con_fk));
    
	if((new.valor_saq + new.tarifa_saq) > saldo_conta)then
		set debitar_limite = (new.valor_saq + new.tarifa_saq) - saldo_conta;
        update conta_bancaria set saldo_con = 0, valor_limite_con = valor_limite_con - debitar_limite where (id_con = new.id_con_fk);
	else
        update conta_bancaria set saldo_con = saldo_con - (new.valor_saq + new.tarifa_saq) where (id_con = new.id_con_fk);
    end if;
end;
$$ delimiter ;

delimiter $$
create trigger restituir_saque after delete on
saque for each row
begin
        update conta_bancaria set valor_limite_con = valor_limite_con + (old.valor_saq + old.tarifa_saq) where (id_con = old.id_con_fk);
end;
$$ delimiter ;

call novo_saque(120.50, '2025-06-03', '07:45:00', 'caixa eletrônico', 12);
call novo_saque(250.00, '2025-06-07', '08:30:00', 'aplicativo de pagamento', 33);
call novo_saque(95.75, '2025-06-15', '09:10:00', 'caixa eletrônico', 5);
call novo_saque(310.00, '2025-06-21', '10:25:00', 'aplicativo de pagamento', 48);
call novo_saque(180.00, '2025-06-10', '11:40:00', 'caixa eletrônico', 27);
call novo_saque(220.00, '2025-06-18', '12:55:00', 'aplicativo de pagamento', 61);
call novo_saque(135.00, '2025-06-04', '13:15:00', 'caixa eletrônico', 9);
call novo_saque(400.00, '2025-06-12', '14:05:00', 'aplicativo de pagamento', 36);
call novo_saque(175.25, '2025-06-26', '15:30:00', 'caixa eletrônico', 2);
call novo_saque(90.00, '2025-06-06', '16:45:00', 'aplicativo de pagamento', 44);
call novo_saque(305.00, '2025-06-14', '17:20:00', 'caixa eletrônico', 18);
call novo_saque(150.00, '2025-06-09', '18:10:00', 'aplicativo de pagamento', 53);
call novo_saque(275.00, '2025-06-23', '19:35:00', 'caixa eletrônico', 30);
call novo_saque(125.00, '2025-06-11', '20:50:00', 'aplicativo de pagamento', 7);
call novo_saque(360.00, '2025-06-05', '07:20:00', 'caixa eletrônico', 59);
call novo_saque(200.00, '2025-06-17', '08:55:00', 'aplicativo de pagamento', 14);
call novo_saque(145.00, '2025-06-20', '09:45:00', 'caixa eletrônico', 41);
call novo_saque(330.00, '2025-06-28', '10:30:00', 'aplicativo de pagamento', 22);
call novo_saque(190.00, '2025-06-08', '11:15:00', 'caixa eletrônico', 64);
call novo_saque(285.00, '2025-06-30', '12:00:00', 'aplicativo de pagamento', 16);


/*
Exercício 5: Crie um procedimento para inserir um novo pagamento de acordo
 com as regras a seguir:
 1) Garanta que os campos obrigatórios sejam preenchidos e que a
 FK de conta bancária realmente exista.
 2) Só permita a inserção se houver saldo suficiente na Conta
 Corrente do cliente, ou seja, o valor do pagamento deve ser
 MENOR ou IGUAL ao valor do saldo da conta (saldo + limite).
 3) Só permita pagamentos entre 9h e 18h.
 4) A data e a hora do pagamento não devem ser inseridas na
 chamada, mas sim coletadas do sistema operacional. Com isso,
 verifique se a data do pagamento é superior a data do
 vencimento, caso seja, você deverá adicionar uma tarifa de 5%
 do valor do pagamento.Caso não seja,a tarifa é zerada.
 5) Garanta que o tipo de pagamento possível seja ‘Título’ ou
 ‘Convênio’;
 6) Verifique se código de barras do boleto possui exatamente 10
 caracteres para o tipo ‘Convênio’ e 20 caracteres para o tipo
 ‘Título’;
 7) Garanta que os beneficiários sejam pessoas jurídicas, assim,
 verifica que o nome digitado contem algum dos termos ‘ME’,
 ‘MEI’,‘LTDA’,‘EI’ou‘SA’.
*/

delimiter $$
create procedure novo_pagamento (valor float, tipo varchar(100), data_vencimento date, codigo_barras varchar(300), beneficiario varchar(300), conta int)
begin
declare data_pagamento date;
declare hora time;
declare saldo_limite, tarifa float;
declare count_conta int;

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

set data_pagamento = curdate();
set hora = curtime();

set saldo_limite = (select (saldo_con+valor_limite_con) from conta_bancaria where (id_con = conta));

if(data_pagamento < data_vencimento)then
	set tarifa = 0;
else
	set tarifa = valor * 0.05;
end if;

if(valor <> '' or valor is not null)then
	if(tipo <> '' or tipo is not null)then
		if(valor <> '' or valor is not null)then
			if( data_vencimento is not null)then
				if(codigo_barras <> '' or codigo_barras is not null)then
					if(beneficiario <> '' or beneficiario is not null)then
						if(count_conta <> 0)then
							if((hour(hora) > 08) and (hour(hora) < 19))then
								if((beneficiario like '%ME%') or (beneficiario like '%MEI%') or (beneficiario like '%LTDA%')or (beneficiario like '%EI%') or (beneficiario like '%SA%'))then
									if(tipo like 'T_tulo')then
										if(length(codigo_barras) = 20)then
											insert into pagamento values(null, valor, data_pagamento, hora, tipo, tarifa, data_vencimento, codigo_barras, beneficiario, conta);
                                            select 'O pagamento foi realizado com sucesso!' as confirmacao;
                                        else
											select 'O código de barras para título está incorreto!' as alerta;
                                        end if;
                                    elseif (tipo like 'Conv_nio') then
										if(length(codigo_barras) = 10)then
											insert into pagamento values(null, valor, data_pagamento, hora, tipo, tarifa, data_vencimento, codigo_barras, beneficiario, conta);
                                            select 'O pagamento foi realizado com sucesso!' as confirmacao;
                                        else
											select 'O código de barras para Convênio está incorreto!' as alerta;
                                        end if;
                                    else
										select 'Os tipos permitidos são Título ou Convênio!' as alerta;
                                    end if;
                                else
									select 'Os beneficiários precisam ser pessoas jurídicas!' as alerta;
                                end if;
                            else
								select 'Só é permitido pagamentos das 9h às 18h' as alerta;
                            end if;
						else
							select concat('A conta #',conta, ' não está cadastrada no sistema!') as alerta;
						end if;
					else
						select 'O beneficiario não pode ser vazio/nulo!' as alerta;
					end if;
				else
					select 'O codigo de barras não pode ser vazio/nulo!' as alerta;
				end if;
			else
				select 'A data de vencimento não pode ser vazio/nulo!' as alerta;
			end if;
		else
			select 'O valor não pode ser vazio/nulo!' as alerta;
		end if;
	else
		select 'O tipo de pagamento não pode ser vazio/nulo!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!' as alerta;
end if;

end;
$$ delimiter ;

/*
Exercício 6: Crie um gatilho na tabela pagamento para subtrair o valor do
 pagamento no saldo da Conta Corrente do cliente após a
 inserção de novo pagamento de acordo comas seguintes regra:
 1) Caso o pagamento utilize o valor do limite, você deverá
 subtrair primeiro o valor do pagamento do saldo e a
 diferença no valor do limite. Exemplo: “João possui 100 reais
 de saldo e 500 de limite e deseja fazer um pagamento de 300
 reais. O sistema deverá zerar o saldo da conta e subtrair o
 valor restante (200 reais) do valor do limite.”
 2) Subtraia do saldo (se houver) ou limite (se não houver saldo) o
 valor da tarifa. Caso a conta esteja usando o limite, e não for
 suficiente para cobrir o valor da tarifa, subtraia o valor do
 saldo deixando o mesmo negativo.
 Crie um gatilho na tabela pagamento para somar o valor do
 pagamento e o valor da tarifa no saldo e no valor do limite da
 conta corrente de acordo com as regras anteriores após a
 exclusão de um pagamento.
 TESTE
 : Chame o procedimento do Exercício 7 e insira 10
 pagamentos emcontas diferentes
*/

delimiter $$
create trigger debitar_pagamento after insert on
pagamento for each row
begin
	declare debitar_limite float;
    declare saldo_conta, limite_conta, valor_pagamento float;
    
    set valor_pagamento = (new.valor_pag + new.tarifa_pag);
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = new.id_con_fk));
    set limite_conta = (select valor_limite_con from conta_bancaria where (id_con = new.id_con_fk));
    
	if(valor_pagamento > (saldo_conta+limite_conta))then
		set debitar_limite = valor_pagamento - (saldo_conta+limite_conta);
        update conta_bancaria set saldo_con = 0 - debitar_limite, valor_limite_con = 0 where (id_con = new.id_con_fk);
	elseif(valor_pagamento > saldo_conta)then
		set debitar_limite = valor_pagamento - saldo_conta;
        update conta_bancaria set saldo_con = 0, valor_limite_con = valor_limite_con - debitar_limite where (id_con = new.id_con_fk);
	else
        update conta_bancaria set saldo_con = saldo_con - valor_pagamento where (id_con = new.id_con_fk);
    end if;
end;
$$ delimiter ;

delimiter $$
create trigger restituir_pagamento after delete on
pagamento for each row
begin
	declare saldo_conta, limite_conta, valor_pagamento, restituir float;
    
    set valor_pagamento = (old.valor_pag + old.tarifa_pag);
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = old.id_con_fk));
	
    if(saldo_conta < 0)then
		set restituir =  saldo_conta + valor_pagamento;
		update conta_bancaria set valor_limite_con = valor_limite_con + restituir where (id_con = old.id_con_fk);
    else
		update conta_bancaria set valor_limite_con = valor_limite_con + valor_pagamento where (id_con = old.id_con_fk);
    end if;
end;
$$ delimiter ;

call novo_pagamento(312.45, 'título', '2025-07-15', '12345678901234567890', 'AlfaTech MEI', 12);
call novo_pagamento(78.90, 'convênio', '2025-07-20', '9876543210', 'BetaCom LTDA', 33);
call novo_pagamento(459.00, 'título', '2025-06-18', '11223344556677889900', 'GammaCorp SA', 7);
call novo_pagamento(150.75, 'convênio', '2025-06-22', '5566778899', 'DeltaServiços EI', 21);
call novo_pagamento(99.99, 'título', '2025-06-25', '99887766554433221100', 'OmegaTech ME', 45);
call novo_pagamento(275.60, 'convênio', '2025-06-30', '4433221100', 'SigmaNet LTDA', 3);
call novo_pagamento(410.00, 'título', '2025-06-17', '66778899001122334455', 'Epsilon SA', 60);
call novo_pagamento(65.25, 'convênio', '2025-06-19', '3344556677', 'ZetaDigital MEI', 18);
call novo_pagamento(499.99, 'título', '2025-06-21', '12344321123443211234', 'ThetaCom LTDA', 52);
call novo_pagamento(120.00, 'convênio', '2025-06-23', '7788990011', 'LambdaServiços EI', 9);