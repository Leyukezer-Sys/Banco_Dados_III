#Banco de Dados para Hotel com regras de negócio:
#1. Uma hospedagem por quarto. Caso o hospede mude de quarto, uma nova hospedagem deve ser realizada.
#2. Somente um hospede é registrado na hospedagem.

create database BD_Hotel_6;
Use BD_Hotel_6;

create table estado (
id_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2) not null,
regiao_est varchar (300)
);

insert into estado values (null, 'Acre', 'AC', 'Norte');
insert into estado values (null, 'Alagoas', 'AL', 'Nordeste');
insert into estado values (null, 'Amapá', 'AP', 'Norte');
insert into estado values (null, 'Amazonas', 'AM', 'Norte');
insert into estado values (null, 'Bahia', 'BA', 'Nordeste');
insert into estado values (null, 'Ceará', 'CE', 'Nordeste');
insert into estado values (null, 'Distrito Federal', 'DF', 'Centro-Oeste');
insert into estado values (null, 'Espírito Santo', 'ES', 'Sudeste');
insert into estado values (null, 'Goiás', 'GO', 'Centro-Oeste');
insert into estado values (null, 'Maranhão', 'MA', 'Nordeste');
insert into estado values (null, 'Mato Grosso', 'MT', 'Centro-Oeste');
insert into estado values (null, 'Mato Grosso do Sul', 'MS', 'Centro-Oeste');
insert into estado values (null, 'Minas Gerais', 'MG', 'Sudeste');
insert into estado values (null, 'Pará', 'PA', 'Norte');
insert into estado values (null, 'Paraíba', 'PB', 'Nordeste');
insert into estado values (null, 'Paraná', 'PR', 'Sul');
insert into estado values (null, 'Pernambuco', 'PE', 'Nordeste');
insert into estado values (null, 'Piauí', 'PI', 'Nordeste');
insert into estado values (null, 'Rio de Janeiro', 'RJ', 'Sudeste');
insert into estado values (null, 'Rio Grande do Norte', 'RN', 'Nordeste');
insert into estado values (null, 'Rio Grande do Sul', 'RS', 'Sul');
insert into estado values (null, 'Rondônia', 'RO', 'Norte');
insert into estado values (null, 'Roraima', 'RR', 'Norte');
insert into estado values (null, 'Santa Catarina', 'SC', 'Sul');
insert into estado values (null, 'São Paulo', 'SP', 'Sudeste');
insert into estado values (null, 'Sergipe', 'SE', 'Nordeste');
insert into estado values (null, 'Tocantins', 'TO', 'Norte');

create table cidade (
id_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
id_est_fk int,
foreign key (id_est_fk) references estado (id_est)
);

-- Rondonia
insert into cidade values (null, 'ji-paraná', 22);
insert into cidade values (null, 'porto velho', 22);
insert into cidade values (null, 'vilhena', 22);
insert into cidade values (null, 'ariquemes', 22);
insert into cidade values (null, 'jaru', 22);
insert into cidade values (null, 'guajará-mirim ', 22);
insert into cidade values (null, 'colorado do oeste', 22);
insert into cidade values (null, 'ouro preto do oeste', 22);
insert into cidade values (null, 'pimenta bueno', 22);

-- Acre
insert into cidade values (null, 'Rio Branco', 1);
insert into cidade values (null, 'Cruzeiro do Sul', 1);
insert into cidade values (null, 'Feijó', 1);
insert into cidade values (null, 'Tarauacá', 1);
insert into cidade values (null, 'Sena Madureira', 1);

-- Alagoas
insert into cidade values (null, 'Maceió', 2);
insert into cidade values (null, 'Arapiraca', 2);
insert into cidade values (null, 'Palmeira dos Índios', 2);
insert into cidade values (null, 'Rio Largo', 2);
insert into cidade values (null, 'União dos Palmares', 2);

-- Amapá
insert into cidade values (null, 'Macapá', 3);
insert into cidade values (null, 'Santana', 3);
insert into cidade values (null, 'Laranjal do Jari', 3);
insert into cidade values (null, 'Oiapoque', 3);
insert into cidade values (null, 'Porto Grande', 3);

-- Amazonas
insert into cidade values (null, 'Manaus', 4);
insert into cidade values (null, 'Parintins', 4);
insert into cidade values (null, 'Itacoatiara', 4);
insert into cidade values (null, 'Manacapuru', 4);
insert into cidade values (null, 'Coari', 4);

-- Bahia
insert into cidade values (null, 'Salvador', 5);
insert into cidade values (null, 'Feira de Santana', 5);
insert into cidade values (null, 'Vitória da Conquista', 5);
insert into cidade values (null, 'Camaçari', 5);
insert into cidade values (null, 'Itabuna', 5);
-- Ceará
insert into cidade values (null, 'Fortaleza', 6);
insert into cidade values (null, 'Caucaia', 6);
insert into cidade values (null, 'Juazeiro do Norte', 6);
insert into cidade values (null, 'Maracanaú', 6);
insert into cidade values (null, 'Sobral', 6);

-- Distrito Federal
insert into cidade values (null, 'Brasília', 7);

-- Espírito Santo
insert into cidade values (null, 'Vitória', 8);
insert into cidade values (null, 'Vila Velha', 8);
insert into cidade values (null, 'Cariacica', 8);
insert into cidade values (null, 'Serra', 8);
insert into cidade values (null, 'Linhares', 8);

-- Goiás
insert into cidade values (null, 'Goiânia', 9);
insert into cidade values (null, 'Aparecida de Goiânia', 9);
insert into cidade values (null, 'Anápolis', 9);
insert into cidade values (null, 'Rio Verde', 9);
insert into cidade values (null, 'Luziânia', 9);

-- Maranhão
insert into cidade values (null, 'São Luís', 10);
insert into cidade values (null, 'Imperatriz', 10);
insert into cidade values (null, 'São José de Ribamar', 10);
insert into cidade values (null, 'Caxias', 10);
insert into cidade values (null, 'Timon', 10);
-- Mato Grosso
insert into cidade values (null, 'Cuiabá', 11);
insert into cidade values (null, 'Várzea Grande', 11);
insert into cidade values (null, 'Rondonópolis', 11);
insert into cidade values (null, 'Sinop', 11);
insert into cidade values (null, 'Tangará da Serra', 11);

-- Mato Grosso do Sul
insert into cidade values (null, 'Campo Grande', 12);
insert into cidade values (null, 'Dourados', 12);
insert into cidade values (null, 'Três Lagoas', 12);
insert into cidade values (null, 'Corumbá', 12);
insert into cidade values (null, 'Ponta Porã', 12);

-- Minas Gerais
insert into cidade values (null, 'Belo Horizonte', 13);
insert into cidade values (null, 'Uberlândia', 13);
insert into cidade values (null, 'Contagem', 13);
insert into cidade values (null, 'Juiz de Fora', 13);
insert into cidade values (null, 'Betim', 13);

-- Pará
insert into cidade values (null, 'Belém', 14);
insert into cidade values (null, 'Ananindeua', 14);
insert into cidade values (null, 'Santarém', 14);
insert into cidade values (null, 'Marabá', 14);
insert into cidade values (null, 'Castanhal', 14);

-- Paraíba
insert into cidade values (null, 'João Pessoa', 15);
insert into cidade values (null, 'Campina Grande', 15);
insert into cidade values (null, 'Santa Rita', 15);
insert into cidade values (null, 'Patos', 15);
insert into cidade values (null, 'Bayeux', 15);
-- Mato Grosso
insert into cidade values (null, 'Cuiabá', 11);
insert into cidade values (null, 'Várzea Grande', 11);
insert into cidade values (null, 'Rondonópolis', 11);
insert into cidade values (null, 'Sinop', 11);
insert into cidade values (null, 'Tangará da Serra', 11);

-- Mato Grosso do Sul
insert into cidade values (null, 'Campo Grande', 12);
insert into cidade values (null, 'Dourados', 12);
insert into cidade values (null, 'Três Lagoas', 12);
insert into cidade values (null, 'Corumbá', 12);
insert into cidade values (null, 'Ponta Porã', 12);

-- Minas Gerais
insert into cidade values (null, 'Belo Horizonte', 13);
insert into cidade values (null, 'Uberlândia', 13);
insert into cidade values (null, 'Contagem', 13);
insert into cidade values (null, 'Juiz de Fora', 13);
insert into cidade values (null, 'Betim', 13);

-- Pará
insert into cidade values (null, 'Belém', 14);
insert into cidade values (null, 'Ananindeua', 14);
insert into cidade values (null, 'Santarém', 14);
insert into cidade values (null, 'Marabá', 14);
insert into cidade values (null, 'Castanhal', 14);

-- Paraíba
insert into cidade values (null, 'João Pessoa', 15);
insert into cidade values (null, 'Campina Grande', 15);
insert into cidade values (null, 'Santa Rita', 15);
insert into cidade values (null, 'Patos', 15);
insert into cidade values (null, 'Bayeux', 15);
-- Paraná
insert into cidade values (null, 'Curitiba', 16);
insert into cidade values (null, 'Londrina', 16);
insert into cidade values (null, 'Maringá', 16);
insert into cidade values (null, 'Ponta Grossa', 16);
insert into cidade values (null, 'Cascavel', 16);

-- Pernambuco
insert into cidade values (null, 'Recife', 17);
insert into cidade values (null, 'Jaboatão dos Guararapes', 17);
insert into cidade values (null, 'Olinda', 17);
insert into cidade values (null, 'Caruaru', 17);
insert into cidade values (null, 'Paulista', 17);

-- Piauí
insert into cidade values (null, 'Teresina', 18);
insert into cidade values (null, 'Parnaíba', 18);
insert into cidade values (null, 'Picos', 18);
insert into cidade values (null, 'Campo Maior', 18);
insert into cidade values (null, 'Floriano', 18);

-- Rio de Janeiro
insert into cidade values (null, 'Rio de Janeiro', 19);
insert into cidade values (null, 'São Gonçalo', 19);
insert into cidade values (null, 'Duque de Caxias', 19);
insert into cidade values (null, 'Nova Iguaçu', 19);
insert into cidade values (null, 'Niterói', 19);

-- Rio Grande do Norte
insert into cidade values (null, 'Natal', 20);
insert into cidade values (null, 'Mossoró', 20);
insert into cidade values (null, 'Parnamirim', 20);
insert into cidade values (null, 'São Gonçalo do Amarante', 20);
insert into cidade values (null, 'Ceará-Mirim', 20);
-- Rio Grande do Sul
insert into cidade values (null, 'Porto Alegre', 21);
insert into cidade values (null, 'Caxias do Sul', 21);
insert into cidade values (null, 'Pelotas', 21);
insert into cidade values (null, 'Santa Maria', 21);
insert into cidade values (null, 'Canoas', 21);

-- Roraima
insert into cidade values (null, 'Boa Vista', 23);
insert into cidade values (null, 'Rorainópolis', 23);
insert into cidade values (null, 'Caracaraí', 23);
insert into cidade values (null, 'Mucajaí', 23);
insert into cidade values (null, 'São João da Baliza', 23);

-- Santa Catarina
insert into cidade values (null, 'Florianópolis', 24);
insert into cidade values (null, 'Joinville', 24);
insert into cidade values (null, 'Blumenau', 24);
insert into cidade values (null, 'São José', 24);
insert into cidade values (null, 'Lages', 24);

-- São Paulo
insert into cidade values (null, 'São Paulo', 25);
insert into cidade values (null, 'Guarulhos', 25);
insert into cidade values (null, 'Campinas', 25);
insert into cidade values (null, 'São Bernardo do Campo', 25);
insert into cidade values (null, 'Santo André', 25);

-- Sergipe
insert into cidade values (null, 'Aracaju', 26);
insert into cidade values (null, 'Nossa Senhora do Socorro', 26);
insert into cidade values (null, 'Lagarto', 26);
insert into cidade values (null, 'Itabaiana', 26);
insert into cidade values (null, 'São Cristóvão', 26);

-- Tocantins
insert into cidade values (null, 'Palmas', 27);
insert into cidade values (null, 'Araguaína', 27);
insert into cidade values (null, 'Gurupi', 27);
insert into cidade values (null, 'Porto Nacional', 27);
insert into cidade values (null, 'Paraíso do Tocantins', 27);


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

create table hospede (
id_hos integer not null primary key auto_increment,
nome_hos varchar (200) not null,
estado_civil_hos varchar (50),
cpf_hos varchar (20) not null,
rg_hos varchar (30),
data_nascimento_hos date,
renda_familiar_hos float,
telefone_hos varchar (50),
celular_hos varchar (50) not null,
id_sex_fk integer not null,
id_end_fk integer not null,
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_end_fk) references endereco (id_end)
);

insert into hospede values (null, 'rodrigo hilbert', 'casado', '111.111.111-11', '54654 sesdec', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 1, 3);
insert into hospede values (null, 'tiago lacerda', 'casado', '111.111.111-22', '54654 sesdec',  '1965-1-1', 456454.45, '', '', 1, 8);
insert into hospede values (null, 'tom cruise', 'solteiro', '111.111.111-33', '48877 sesdec',  '1950-05-30', 0.00, '11 454546511', '', 1, 1);
insert into hospede values (null, 'josé pereiro da silva', 'casado', '222.222.222-88', '8888888 spp',  '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 1, 4);
insert into hospede values (null, 'maria de jesus dos santos', 'solteira', '554.454.444-99', '99999 sesdec',  '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 2, 3);
insert into hospede values (null, 'camila de oliveira', 'casada', '987.123.654-55', '8889999 sesdec',  '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 2, 10);
insert into hospede values (null, 'marcos araujo de souza', 'casado', '654.789.123-88', '998877 sesdec',  '1970-01-01', 6845.00, '69 84085712', '69 84111111', 1, 9);
insert into hospede values (null, 'cleiton batista ferraz', 'solteiro', '321.111.222-44', '1234312 sesdec',  '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 1, 2);
insert into hospede values (null, 'eliana da cruz', 'solteira', '988.235.654-54', '12345 sesdec',  '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 2, 5);
insert into hospede values (null, 'igor garcia da silva', 'solteiro', '123.445.888-99', '999992 sesdec',  '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 1, 11);
insert into hospede values (null, 'jackson henrique da silva bezerra', 'casado', '529.562.612-15', '880075 sesdec',  '1987-06-30', 11000.00, '', '69 84085712', 1, 3);
insert into hospede values (null, 'jaqueline leão pereira', 'casada', '522.222.153-15', '12315 sesdec', '1993-06-21', 11000.00, null, '69 984210921', 2, 3);
insert into hospede values (null, 'gleicy borgio', 'casada', '126.777.888-99', null, null, 5000.00, null, '69 84888899', 2, 11);
insert into hospede values (null, 'diego da silva bezerra', 'solteiro', '111.987.123-55', null, null, 3999.99, null, '69 88997722', 1, 15);
insert into hospede values (null, 'murilo benicio', 'casado', '321.123.321-55', null, null, 2450.80, null, '11 2121 1111', 1, 8);
insert into hospede values (null, 'ana clara oliveira', 'solteira', '111.222.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 2, 6);
insert into hospede values (null, 'ana clara oliveira', 'solteira', '111.222.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 2, 6);
insert into hospede values (null, 'pedro henrique almeida', 'casado', '555.666.777-88', '998877 sesdec', '1980-08-22', 6500.00, '69 3421 5566', '69 84123 9876', 1, 9);
insert into hospede values (null, 'isabela pereira', 'solteira', '987.654.321-01', '12345 sesdec', '1992-05-10', 4200.00, '69 3421 8899', '69 99222 3344', 2, 5);
insert into hospede values (null, 'lucas souza', 'solteiro', '123.456.789-10', '54321 sesdec', '1988-11-03', 8900.00, '69 3421 2233', '69 87654 3210', 2, 7);
insert into hospede values (null, 'gabriela silva', 'casada', '987.654.321-98', '8889999 sesdec', '1997-02-20', 5500.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'ricardo martins', 'solteiro', '123.987.456-32', '87654 sesdec', '1985-09-17', 7600.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'carla santos', 'casada', '654.987.321-45', '876543 sesdec', '1975-12-01', 4800.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'roberto mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1991-04-12', 6200.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'marina costa', 'casada', '987.654.321-00', '12345 sesdec', '1983-07-25', 7100.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'felipe rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-10-08', 5800.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into hospede values (null, 'lara alves', 'casada', '852.963.741-22', '87654 sesdec', '1986-02-14', 6800.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into hospede values (null, 'pedro martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-05-27', 8100.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into hospede values (null, 'larissa rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1984-09-30', 5900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'rafael pereira', 'casado', '123.987.456-32', '87654 sesdec', '1996-12-11', 7200.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'amanda santos', 'solteira', '654.987.321-45', '876543 sesdec', '1972-03-05', 5000.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'vinicius mendes', 'casado', '159.357.852-46', '998877 sesdec', '1999-06-18', 6700.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'thais costa', 'solteira', '987.654.321-00', '12345 sesdec', '1981-08-21', 4900.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'bruno rocha', 'casado', '258.369.147-00', '54321 sesdec', '1990-11-14', 6400.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into hospede values (null, 'mariana alves', 'solteira', '852.963.741-22', '87654 sesdec', '1979-02-28', 7500.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into hospede values (null, 'eduardo martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1987-05-12', 9200.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into hospede values (null, 'carol rodrigues', 'casada', '987.654.321-98', '8889999 sesdec', '1995-08-25', 6300.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'andre pereira', 'solteiro', '123.987.456-32', '87654 sesdec', '1982-11-06', 7900.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'luana santos', 'casada', '654.987.321-45', '876543 sesdec', '1993-02-19', 5300.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'rodrigo mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1988-05-03', 7100.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'ana costa', 'casada', '987.654.321-00', '12345 sesdec', '1977-08-16', 6800.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'pedro rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1992-11-29', 5900.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into hospede values (null, 'isabela alves', 'casada', '852.963.741-22', '87654 sesdec', '1974-04-10', 7500.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into hospede values (null, 'lucas martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1989-07-23', 8400.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into hospede values (null, 'gabriela rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1996-10-06', 6200.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'ricardo pereira', 'casado', '123.987.456-32', '87654 sesdec', '1976-01-18', 7800.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'carla alves', 'solteira', '654.987.321-45', '876543 sesdec', '1990-04-01', 5300.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'roberto rocha', 'casado', '159.357.852-46', '998877 sesdec', '1983-07-14', 6900.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'marina rodrigues', 'solteira', '987.654.321-00', '12345 sesdec', '1978-10-27', 5000.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'felipe almeida', 'casado', '258.369.147-00', '54321 sesdec', '1995-01-09', 6400.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into hospede values (null, 'lara martins', 'solteira', '852.963.741-22', '87654 sesdec', '1980-04-22', 7700.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into hospede values (null, 'pedro mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-07-05', 9200.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into hospede values (null, 'larissa pereira', 'casada', '987.654.321-98', '8889999 sesdec', '1985-10-18', 6900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'rafael alves', 'solteiro', '123.987.456-32', '87654 sesdec', '1997-01-30', 8300.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'amanda rocha', 'casada', '654.987.321-45', '876543 sesdec', '1971-05-12', 5600.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'vinicius rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1994-08-25', 7200.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'thais pereira', 'solteira', '987.654.321-00', '12345 sesdec', '1982-11-07', 5500.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'bruno almeida', 'casado', '258.369.147-00', '54321 sesdec', '1991-02-20', 6700.00, '69 3421 5566', '69 84123 9876', 2, 3);
insert into hospede values (null, 'mariana martins', 'solteira', '852.963.741-22', '87654 sesdec', '1973-05-04', 7400.00, '69 3421 2233', '69 87654 3210', 1, 9);
insert into hospede values (null, 'eduardo mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1986-08-17', 9100.00, '69 3421 8899', '69 99222 3344', 2, 7);
insert into hospede values (null, 'carol alves', 'casada', '987.654.321-98', '8889999 sesdec', '1999-11-30', 5900.00, '69 3421 7788', '69 84123 5678', 1, 10);
insert into hospede values (null, 'andre rocha', 'solteiro', '123.987.456-32', '87654 sesdec', '1975-02-12', 7600.00, '69 3421 1122', '69 99000 1122', 2, 4);
insert into hospede values (null, 'luana alves', 'casada', '654.987.321-45', '876543 sesdec', '1992-05-25', 5200.00, '69 3421 5566', '69 84123 3333', 1, 8);
insert into hospede values (null, 'rodrigo rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1987-08-08', 6800.00, '69 3421 8899', '69 99222 3344', 2, 6);
insert into hospede values (null, 'ana rodrigues', 'casada', '987.654.321-00', '12345 sesdec', '1979-11-21', 7500.00, '69 3421 3344', '69 98888 7766', 1, 5);
insert into hospede values (null, 'pedro almeida', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-02-03', 6200.00, '69 3421 5566', '69 84123 9876', 2, 3);

create table departamento (
id_dep integer not null primary key auto_increment,
nome_dep varchar (100),
descricao_dep varchar (300)
);

insert into departamento values (null, 'vendas', 'venda de peças e serviços');
insert into departamento values (null, 'financeiro', 'controle financeiro e caixa');
insert into departamento values (null, 'entrega', 'entregar peças');
insert into departamento values (null, 'mecânica', 'realizar manutenção em veículos');
insert into departamento values (null, 'administração', 'gestão da empresa');

create table cargo (
id_carg int primary key auto_increment,
nome_carg varchar (300),
atribuicoes_carg varchar (500)
);

insert into cargo values (null, 'Gerente', 'gestao operacional da empresa.');
insert into cargo values (null, 'Atendente', 'realiza checkin e checkout de hospedagens.');
insert into cargo values (null, 'Auxiliar de limpeza', 'realiza a limpeza dos quartos.');
insert into cargo values (null, 'Auxiliar de cozinha', 'cozinha e mantem o cafe da manhã.');
insert into cargo values (null, 'Auxiliar de serviços gerais', 'promove a manutenção dos quartos e demais locais do hotel.');



create table funcionario (
id_fun integer not null primary key auto_increment,
nome_fun varchar (200) not null,
cpf_fun varchar (20) not null,
rg_fun varchar (20),
data_nascimento_fun date,
salario_fun double not null,
telefone_fun varchar (50),
celular_fun varchar (50) not null,
id_carg_fk integer not null,
id_sex_fk integer not null,
id_dep_fk integer not null,
id_end_fk integer not null,
foreign key (id_carg_fk) references cargo (id_carg),
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_dep_fk) references departamento (id_dep),
foreign key (id_end_fk) references endereco (id_end)
);

insert into funcionario values (null, 'joão batista', '123.544.311-99', '22222 sesdec', '1988-10-30', 5000.00, '', '69 84111155', 1, 1, 5, 3);
insert into funcionario values (null, 'marcos garcia souza', '565.888.988-88', '64444 sesdec', '1965-1-20', 45000.00, '', '', 2, 1, 1, 8);
insert into funcionario values (null, 'leticia de jesus', '998.999.789-55', '46666 sesdec', '1990-05-23', 1500.00, '11 454546511', '', 2, 2, 1, 10);
insert into funcionario values (null, 'mateus solano ', '522.222.232-08', '65655 spp', '1990-11-30', 900.00, '69 8855 5544', '69 5555 4444', 3, 1, 4, 4);
insert into funcionario values (null, 'roger da silva', '123.589.978-77', null, '1987-11-11', 1100.00, null, '69 9988 7788', 3, 1, 4, 11);
insert into funcionario values (null, 'ana pereira silva', '987.987.788-88', null, '1985-11-22', 1000.50, null, '69 8888 7777', 4, 2, 2, 1);
insert into funcionario values (null, 'isaias queiroz', '123.121.321-88', '87788 sesdec', '1980-11-30', 2000.00, null, '69 8877 88881', 5, 1, 3, 7);
insert into funcionario values (null, 'ana clara oliveira', '543.987.654-99', '77777 spp', '1995-07-15', 3000.00, '69 8888 1234', '69 9999 5678', 1, 2, 5, 9);
insert into funcionario values (null, 'pedro henrique santos', '876.543.210-11', '12345 spp', '1982-02-18', 6000.00, '69 8765 4321', '69 9876 5432', 2, 1, 3, 2);
insert into funcionario values (null, 'carla fernandes', '654.321.098-77', '11111 spp', '1998-06-09', 2500.00, '69 8765 4321', '69 9876 5432', 3, 2, 1, 5);
insert into funcionario values (null, 'lucas oliveira santos', '987.654.321-00', '99999 spp', '1993-12-05', 4000.00, '69 8877 1234', '69 9999 5678', 4, 1, 2, 12);
insert into funcionario values (null, 'camila pereira', '123.456.789-01', '55555 spp', '1991-04-20', 3500.00, '69 8765 4321', '69 9876 5432', 5, 2, 4, 6);
insert into funcionario values (null, 'vitor da silva', '987.654.123-33', '44444 spp', '1988-09-28', 2800.00, '69 8877 1234', '69 9999 5678', 1, 1, 3, 3);
insert into funcionario values (null, 'amanda santos', '111.222.333-44', '66666 spp', '1980-03-15', 3200.00, '69 8765 4321', '69 9876 5432', 2, 2, 2, 9);
insert into funcionario values (null, 'leonardo souza', '555.888.777-00', '77777 spp', '1987-07-01', 4200.00, '69 8877 1234', '69 9999 5678', 3, 1, 5, 4);
insert into funcionario values (null, 'caroline oliveira', '444.555.666-99', '12345 spp', '1997-11-10', 2700.00, '69 8765 4321', '69 9876 5432', 4, 2, 1, 8);
insert into funcionario values (null, 'gustavo rodrigues', '777.888.999-11', '33333 spp', '1989-05-30', 3800.00, '69 8877 1234', '69 9999 5678', 5, 1, 4, 11);


create table Quarto (
id_qua int primary key auto_increment, 
numero_qua int not null,
descricao_qua varchar (300),
tipo_qua varchar (100),
valor_qua float,
andar_qua varchar (100)
);

insert into quarto values (null, 100, 'Triplo com TV e geladeira', 'Luxo', 400.00, '1º andar');
insert into quarto values (null, 101, 'Duplo com TV e geladeira', 'Simples', 200.00, '1º andar');
insert into quarto values (null, 102, 'Triplo com varanda e vista para o mar', 'Luxo', 500.00, '1º andar');
insert into quarto values (null, 103, 'Quádruplo com TV, geladeira e banheira de hidromassagem', 'Luxo', 600.00, '1º andar');
insert into quarto values (null, 104, 'Duplo com vista para o jardim', 'Simples', 250.00, '1º andar');
insert into quarto values (null, 105, 'Triplo com TV e ar-condicionado', 'Simples', 300.00, '1º andar');
insert into quarto values (null, 106, 'Individual com cama king-size', 'Luxo', 250.00, '1º andar');
insert into quarto values (null, 107, 'Suíte Presidencial com piscina privativa', 'Luxo', 1500.00, '1º andar');
insert into quarto values (null, 108, 'Duplo com vista para a montanha', 'Simples', 220.00, '1º andar');
insert into quarto values (null, 109, 'Individual com varanda e vista para o mar', 'Luxo', 300.00, '1º andar');
insert into quarto values (null, 110, 'Quádruplo com TV, geladeira e sala de estar', 'Luxo', 700.00, '1º andar');
insert into quarto values (null, 200, 'Duplo com TV e geladeira', 'Luxo', 300.00, '2º andar');
insert into quarto values (null, 201, 'Individual com TV e geladeira', 'Luxo', 200.00, '2º andar');
insert into quarto values (null, 202, 'Suíte de Lua de Mel com banheira de hidromassagem', 'Luxo', 400.00, '2º andar');
insert into quarto values (null, 203, 'Individual com TV, geladeira e vista para o jardim', 'Luxo', 250.00, '2º andar');
insert into quarto values (null, 204, 'Duplo com cama queen-size e vista panorâmica', 'Luxo', 350.00, '2º andar');
insert into quarto values (null, 205, 'Triplo com varanda e vista para a piscina', 'Luxo', 450.00, '2º andar');
insert into quarto values (null, 206, 'Quádruplo com TV, geladeira e varanda', 'Luxo', 600.00, '2º andar');
insert into quarto values (null, 207, 'Individual com banheira de hidromassagem', 'Luxo', 300.00, '2º andar');
insert into quarto values (null, 208, 'Duplo com TV, geladeira e vista para o lago', 'Simples', 280.00, '2º andar');
insert into quarto values (null, 209, 'Triplo com varanda e vista para a cidade', 'Simples', 320.00, '2º andar');
insert into quarto values (null, 210, 'Suíte Familiar com sala de estar e cozinha', 'Luxo', 800.00, '2º andar');
insert into quarto values (null, 211, 'Quádruplo com TV, geladeira e vista para o parque', 'Luxo', 650.00, '2º andar');
insert into quarto values (null, 212, 'Individual com varanda e vista panorâmica', 'Simples', 280.00, '2º andar');

create table Servico (
id_ser int primary key auto_increment,
nome_ser varchar (300) not null,
tipo_ser varchar (300),
valor_ser float not null
);

insert into servico values (null, 'Estacionamento 12h', 'Estacionamento', 10.00);
insert into servico values (null, 'Estacionamento 24h', 'Estacionamento', 20.00);
insert into servico values (null, 'Lavar roupa 1PC tecido', 'Lavanderia', 15.00);
insert into servico values (null, 'Lavar roupa 1PC jeans', 'Lavanderia', 15.00);
insert into servico values (null, 'Limpeza de quarto', 'Serviços Gerais do Hotel', 00.00);

create table Produto (
id_pro int primary key auto_increment,
nome_pro varchar (300) not null,
descricao_pro varchar (300),
foto_pro blob,
valor_pro float not null,
estoque_pro float not null,
tipo_pro varchar (300)
);

insert into produto values (null, 'Coka Cola LT 330ml', 'Regrigerante em lata', null, 6.00, 100, 'Refrigerante');
insert into produto values (null, 'Fanta LT 330ml', 'Regrigerante em lata', null, 5.00, 50, 'Refrigerante');
insert into produto values (null, 'Guarana Antartica LT 330ml', 'Regrigerante em lata', null, 5.50, 80, 'Refrigerante');
insert into produto values (null, 'Chocolate Lacta 100gr', 'Chocolate branco em barra', null, 10.00, 20, 'Chocolate');
insert into produto values (null, 'Água Mineral 500ml', 'Água mineral sem gás', null, 3.00, 200, 'Bebida');
insert into produto values (null, 'Lata de Amendoim Torrado 100gr', 'Amendoim torrado e salgado', null, 8.00, 50, 'Petisco');
insert into produto values (null, 'Barra de Cereal 30gr', 'Barra de cereal sabor morango', null, 4.50, 80, 'Snack');
insert into produto values (null, 'Salgadinho de Milho 50gr', 'Salgadinho de milho sabor queijo', null, 6.00, 70, 'Petisco');
insert into produto values (null, 'Kit Higiene Básico', 'Kit contendo escova de dentes, pasta dental e sabonete', null, 15.00, 30, 'Higiene');
insert into produto values (null, 'Kit de Costura', 'Kit contendo linha, agulha e botões', null, 12.00, 40, 'Utilidades');
insert into produto values (null, 'Bolacha Recheada 120gr', 'Bolacha recheada sabor chocolate', null, 7.00, 60, 'Lanche');
insert into produto values (null, 'Protetor Solar FPS 30', 'Protetor solar com fator de proteção 30', null, 25.00, 25, 'Higiene');
insert into produto values (null, 'Cartão Postal', 'Cartão postal com imagem do local', null, 3.50, 100, 'Lembrança');
insert into produto values (null, 'Fone de Ouvido Descartável', 'Fone de ouvido descartável para uso único', null, 10.00, 50, 'Eletrônicos');

create table Hospedagem (
id_hosp int primary key auto_increment,
data_checkin_hosp date not null,
hora_checkin_hop time not null,
data_checkout_hosp date,
hora_checkout_hosp time,
status_hosp varchar (300),
id_hos_fk int not null,
id_qua_fk int not null,
foreign key (id_hos_fk) references hospede (id_hos),
foreign key (id_qua_fk) references quarto (id_qua)
);

insert into hospedagem values (null, '2022-04-20', '14:00', '2022-04-25', '12:00', 'Fechado', 2, 24);
insert into hospedagem values (null, '2022-04-24', '15:30', '2022-04-25', '10:00', 'Fechado', 3, 21);
insert into hospedagem values (null, '2022-04-26', '16:00', '2022-04-29', '11:00', 'Fechado', 1, 12);
insert into hospedagem values (null, '2022-04-28', '17:00', '2022-04-30', '13:00', 'Fechado', 10, 2);
insert into hospedagem values (null, '2022-04-30', '18:30', '2022-05-05', '09:00', 'Fechado', 15, 4);
insert into hospedagem values (null, '2022-05-02', '19:00', '2022-05-04', '10:30', 'Fechado', 1, 3);
insert into hospedagem values (null, '2022-05-04', '20:00', '2022-05-08', '11:30', 'Fechado', 9, 24);
insert into hospedagem values (null, '2022-05-06', '21:30', '2022-05-09', '12:00', 'Fechado', 15, 1);
insert into hospedagem values (null, '2022-05-08', '22:00', '2022-05-09', '09:30', 'Fechado', 4, 3);
insert into hospedagem values (null, '2022-05-10', '23:00', '2022-05-12', '10:00', 'Fechado', 20, 1);
insert into hospedagem values (null, '2022-05-12', '14:30', '2022-05-18', '11:30', 'Fechado', 19, 15);
insert into hospedagem values (null, '2022-05-14', '15:00', '2022-05-16', '12:00', 'Fechado', 2, 20);
insert into hospedagem values (null, '2022-05-16', '16:00', '2022-05-18', '13:00', 'Fechado', 14, 21);
insert into hospedagem values (null, '2022-05-18', '17:30', '2022-05-20', '09:00', 'Fechado', 11, 22);
insert into hospedagem values (null, '2022-05-20', '18:00', '2022-05-22', '10:30', 'Fechado', 19, 23);
insert into hospedagem values (null, '2022-05-22', '19:00', '2022-05-22', '11:00', 'Fechado', 13, 18);
insert into hospedagem values (null, '2022-05-24', '20:30', '2022-05-27', '12:00', 'Fechado', 30, 13);
insert into hospedagem values (null, '2022-05-26', '21:00', '2022-05-29', '09:30', 'Fechado', 29, 14);
insert into hospedagem values (null, '2022-05-28', '22:00', '2022-05-30', '10:00', 'Fechado', 35, 9);
insert into hospedagem values (null, '2022-05-30', '23:30', '2022-05-31', '11:30', 'Fechado', 41, 8);
insert into hospedagem values (null, '2022-06-01', '18:00', null, null, 'Aberto', 40, 4);
insert into hospedagem values (null, '2022-06-03', '14:30', null, null, 'Aberto', 29, 7);
insert into hospedagem values (null, '2022-06-05', '15:50', null, null, 'Aberto', 27, 1);
insert into hospedagem values (null, '2022-06-07', '15:40', null, null, 'Aberto', 37, 2);


create table Hospedagem_Funcionarios (
id_hfunc int primary key auto_increment,
atuacao_hfunc varchar (300) not null,
id_hosp_fk int not null,
id_fun_fk int not null,
foreign key (id_hosp_fk) references hospedagem (id_hosp),
foreign key (id_fun_fk) references funcionario (id_fun)
);

insert into Hospedagem_Funcionarios values (null, 'Checkin', 1, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 1, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 2, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 2, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 3, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 3, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 4, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 4, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 5, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 5, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 6, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 6, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 7, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 7, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 8, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 8, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 9, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 9, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 10, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 10, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 11, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 11, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 12, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 12, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 13, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 13, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 14, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout',14, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 15, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 15, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 16, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 16, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 17, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 17, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 18, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 18, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 19, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 19, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 20, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkout', 20, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 21, 2);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 22, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 23, 3);
insert into Hospedagem_Funcionarios values (null, 'Checkin', 24, 3);


create table Venda (
id_ven int primary key auto_increment,
data_ven date,
forma_receb_ven varchar (300),
valor_produtos_ven float,
valor_servicos_ven float,
valor_hospedagem_ven float,
valor_total_ven float not null,
id_hosp_fk int not null,
id_fun_fk int not null,
foreign key (id_hosp_fk) references Hospedagem (id_hosp),
foreign key (id_fun_fk) references Funcionario (id_fun)
);

insert into Venda values (null, '2022-04-20', 'Cartão de crédito', 150.00, 50.00, 100.00, 300.00, 1, 2);
insert into Venda values (null, '2022-04-21', 'Dinheiro', 100.00, 20.00, 100.00, 220.00, 2, 3);
insert into Venda values (null, '2022-04-22', 'Cartão de débito', 80.00, 30.00, 200.00, 310.00, 3, 3);
insert into Venda values (null, '2022-04-23', 'Dinheiro', 120.00, 40.00, 0.00, 160.00, 4, 2);
insert into Venda values (null, '2022-04-24', 'Cartão de crédito', 90.00, 60.00, 300.00, 450.00, 5, 3);
insert into Venda values (null, '2022-04-25', 'Cartão de crédito', 200.00, 30.00, 100.00, 330.00, 6, 3);
insert into Venda values (null, '2022-04-26', 'Dinheiro', 150.00, 40.00, 200.00, 390.00, 7, 3);
insert into Venda values (null, '2022-04-27', 'Cartão de débito', 80.00, 20.00, 300.00, 400.00, 8, 3);
insert into Venda values (null, '2022-04-28', 'Dinheiro', 100.00, 50.00, 0.00, 150.00, 9, 3);
insert into Venda values (null, '2022-04-29', 'Cartão de crédito', 120.00, 30.00, 200.00, 350.00, 10, 2);
insert into Venda values (null, '2022-04-30', 'Cartão de crédito', 180.00, 40.00, 500.00, 720.00, 11, 2);
insert into Venda values (null, '2022-05-01', 'Dinheiro', 90.00, 60.00, 100.00, 250.00, 12, 2);
insert into Venda values (null, '2022-05-02', 'Dinheiro', 100.00, 25.00, 1000.00, 1125.00, 13, 2);
insert into Venda values (null, '2022-05-03', 'Cartão de débito', 150.00, 30.00, 400.00, 580.00, 14, 3);
insert into Venda values (null, '2022-05-04', 'Cartão de crédito', 120.00, 40.00, 1000.00, 1160.00, 15, 3);
insert into Venda values (null, '2022-05-05', 'Dinheiro', 80.00, 20.00, 200.00, 300.00, 16, 2);
insert into Venda values (null, '2022-05-06', 'Dinheiro', 130.00, 50.00, 500.00, 680.00, 17, 2);
insert into Venda values (null, '2022-05-07', 'Cartão de crédito', 110.00, 30.00, 1000.00, 1140.00, 18, 2);
insert into Venda values (null, '2022-05-08', 'Cartão de crédito', 160.00, 40.00, 600.00, 800.00, 19, 2);
insert into Venda values (null, '2022-05-09', 'Dinheiro', 90.00, 25.00, 500.00, 615.00, 20, 2);
insert into Venda values (null, '2022-05-10', 'Cartão de crédito', 140.00, 30.00, 500.00, 670.00, 21, 2);
insert into Venda values (null, '2022-05-12', 'Cartão de crédito', 120.00, 20.00, 900.00, 1040.00, 23, 3);
insert into Venda values (null, '2022-05-13', 'Cartão de débito', 90.00, 30.00, 400.00, 620.00, 24, 3);


create table Quarto_Produto (
id_qpro int primary key auto_increment,
quant_qpro float,
id_qua_fk int not null,
id_pro_fk int not null,
foreign key (id_qua_fk) references Quarto (id_qua),
foreign key (id_pro_fk) references Produto (id_pro)
);

insert into Quarto_Produto values (null, 5, 1, 1);
insert into Quarto_Produto values (null, 6, 1, 2);
insert into Quarto_Produto values (null, 8, 1, 4);
insert into Quarto_Produto values (null, 9, 1, 5);
insert into Quarto_Produto values (null, 5, 1, 7);
insert into Quarto_Produto values (null, 7, 1, 9);

insert into Quarto_Produto values (null, 5, 2, 1);
insert into Quarto_Produto values (null, 6, 2, 2);
insert into Quarto_Produto values (null, 7, 2, 3);
insert into Quarto_Produto values (null, 8, 2, 4);
insert into Quarto_Produto values (null, 9, 2, 5);
insert into Quarto_Produto values (null, 10, 2, 6);


insert into Quarto_Produto values (null, 5, 3, 1);
insert into Quarto_Produto values (null, 6, 3, 2);
insert into Quarto_Produto values (null, 6, 3, 8);
insert into Quarto_Produto values (null, 7, 3, 9);
insert into Quarto_Produto values (null, 8, 3, 10);

insert into Quarto_Produto values (null, 5, 4, 1);
insert into Quarto_Produto values (null, 6, 4, 2);
insert into Quarto_Produto values (null, 7, 4, 3);
insert into Quarto_Produto values (null, 8, 4, 4);
insert into Quarto_Produto values (null, 9, 4, 5);
insert into Quarto_Produto values (null, 5, 4, 7);
insert into Quarto_Produto values (null, 6, 4, 8);
insert into Quarto_Produto values (null, 7, 4, 9);
insert into Quarto_Produto values (null, 8, 4, 10);

insert into Quarto_Produto values (null, 5, 5, 1);
insert into Quarto_Produto values (null, 6, 5, 2);
insert into Quarto_Produto values (null, 7, 5, 3);
insert into Quarto_Produto values (null, 8, 5, 4);
insert into Quarto_Produto values (null, 9, 5, 5);
insert into Quarto_Produto values (null, 10, 5, 6);
insert into Quarto_Produto values (null, 5, 5, 7);
insert into Quarto_Produto values (null, 6, 5, 8);
insert into Quarto_Produto values (null, 7, 5, 9);

insert into Quarto_Produto values (null, 5, 6, 1);
insert into Quarto_Produto values (null, 6, 6, 2);
insert into Quarto_Produto values (null, 7, 6, 3);
insert into Quarto_Produto values (null, 8, 6, 4);
insert into Quarto_Produto values (null, 9, 6, 5);
insert into Quarto_Produto values (null, 10, 6, 6);
insert into Quarto_Produto values (null, 7, 6, 9);
insert into Quarto_Produto values (null, 8, 6, 10);

insert into Quarto_Produto values (null, 5, 7, 1);
insert into Quarto_Produto values (null, 6, 7, 2);
insert into Quarto_Produto values (null, 7, 7, 3);
insert into Quarto_Produto values (null, 8, 7, 4);
insert into Quarto_Produto values (null, 9, 7, 5);
insert into Quarto_Produto values (null, 10, 7, 6);
insert into Quarto_Produto values (null, 6, 7, 8);
insert into Quarto_Produto values (null, 7, 7, 9);
insert into Quarto_Produto values (null, 8, 7, 10);

insert into Quarto_Produto values (null, 5, 8, 1);
insert into Quarto_Produto values (null, 6, 8, 2);
insert into Quarto_Produto values (null, 7, 8, 3);
insert into Quarto_Produto values (null, 8, 8, 4);
insert into Quarto_Produto values (null, 9, 8, 5);
insert into Quarto_Produto values (null, 5, 8, 7);
insert into Quarto_Produto values (null, 6, 8, 8);
insert into Quarto_Produto values (null, 7, 8, 9);
insert into Quarto_Produto values (null, 8, 8, 10);

insert into Quarto_Produto values (null, 5, 9, 1);
insert into Quarto_Produto values (null, 6, 9, 2);
insert into Quarto_Produto values (null, 7, 9, 3);
insert into Quarto_Produto values (null, 8, 9, 4);
insert into Quarto_Produto values (null, 9, 9, 5);
insert into Quarto_Produto values (null, 5, 9, 7);
insert into Quarto_Produto values (null, 7, 9, 9);
insert into Quarto_Produto values (null, 8, 9, 10);

insert into Quarto_Produto values (null, 5, 10, 1);
insert into Quarto_Produto values (null, 6, 10, 2);
insert into Quarto_Produto values (null, 7, 10, 3);
insert into Quarto_Produto values (null, 8, 10, 4);
insert into Quarto_Produto values (null, 9, 10, 5);
insert into Quarto_Produto values (null, 10, 10, 6);
insert into Quarto_Produto values (null, 7, 10, 9);
insert into Quarto_Produto values (null, 8, 10, 10);

insert into Quarto_Produto values (null, 5, 11, 1);
insert into Quarto_Produto values (null, 6, 11, 2);
insert into Quarto_Produto values (null, 7, 11, 3);
insert into Quarto_Produto values (null, 8, 11, 4);
insert into Quarto_Produto values (null, 9, 11, 5);
insert into Quarto_Produto values (null, 10, 11, 6);
insert into Quarto_Produto values (null, 5, 11, 7);
insert into Quarto_Produto values (null, 6, 11, 8);
insert into Quarto_Produto values (null, 7, 11, 9);
insert into Quarto_Produto values (null, 8, 11, 10);

insert into Quarto_Produto values (null, 5, 12, 1);
insert into Quarto_Produto values (null, 6, 12, 2);
insert into Quarto_Produto values (null, 7, 12, 3);
insert into Quarto_Produto values (null, 8, 12, 4);
insert into Quarto_Produto values (null, 10, 12, 6);
insert into Quarto_Produto values (null, 5, 12, 7);
insert into Quarto_Produto values (null, 6, 12, 8);
insert into Quarto_Produto values (null, 7, 12, 9);
insert into Quarto_Produto values (null, 8, 12, 10);

insert into Quarto_Produto values (null, 5, 13, 1);
insert into Quarto_Produto values (null, 6, 13, 2);
insert into Quarto_Produto values (null, 7, 13, 3);
insert into Quarto_Produto values (null, 8, 13, 4);
insert into Quarto_Produto values (null, 10, 13, 6);
insert into Quarto_Produto values (null, 5, 13, 7);
insert into Quarto_Produto values (null, 7, 13, 9);
insert into Quarto_Produto values (null, 8, 13, 10);

insert into Quarto_Produto values (null, 5, 14, 1);
insert into Quarto_Produto values (null, 6, 14, 2);
insert into Quarto_Produto values (null, 7, 14, 3);
insert into Quarto_Produto values (null, 8, 14, 4);
insert into Quarto_Produto values (null, 9, 14, 5);
insert into Quarto_Produto values (null, 10, 14, 6);
insert into Quarto_Produto values (null, 5, 14, 7);
insert into Quarto_Produto values (null, 7, 14, 9);

insert into Quarto_Produto values (null, 5, 15, 1);
insert into Quarto_Produto values (null, 6, 15, 2);
insert into Quarto_Produto values (null, 7, 15, 3);
insert into Quarto_Produto values (null, 8, 15, 4);
insert into Quarto_Produto values (null, 9, 15, 5);
insert into Quarto_Produto values (null, 10, 15, 6);
insert into Quarto_Produto values (null, 5, 15, 7);
insert into Quarto_Produto values (null, 7, 15, 9);
insert into Quarto_Produto values (null, 8, 15, 10);

insert into Quarto_Produto values (null, 5, 16, 1);
insert into Quarto_Produto values (null, 6, 16, 2);
insert into Quarto_Produto values (null, 7, 16, 3);
insert into Quarto_Produto values (null, 8, 16, 4);
insert into Quarto_Produto values (null, 9, 16, 5);
insert into Quarto_Produto values (null, 10, 16, 6);
insert into Quarto_Produto values (null, 5, 16, 7);
insert into Quarto_Produto values (null, 7, 16, 9);
insert into Quarto_Produto values (null, 8, 16, 10);

insert into Quarto_Produto values (null, 5, 17, 1);
insert into Quarto_Produto values (null, 6, 17, 2);
insert into Quarto_Produto values (null, 7, 17, 3);
insert into Quarto_Produto values (null, 8, 17, 4);
insert into Quarto_Produto values (null, 5, 17, 7);
insert into Quarto_Produto values (null, 6, 17, 8);
insert into Quarto_Produto values (null, 7, 17, 9);
insert into Quarto_Produto values (null, 8, 17, 10);

insert into Quarto_Produto values (null, 5, 18, 1);
insert into Quarto_Produto values (null, 6, 18, 2);
insert into Quarto_Produto values (null, 7, 18, 3);
insert into Quarto_Produto values (null, 8, 18, 4);
insert into Quarto_Produto values (null, 9, 18, 5);
insert into Quarto_Produto values (null, 10, 18, 6);
insert into Quarto_Produto values (null, 6, 18, 8);
insert into Quarto_Produto values (null, 8, 18, 10);

insert into Quarto_Produto values (null, 5, 19, 1);
insert into Quarto_Produto values (null, 6, 19, 2);
insert into Quarto_Produto values (null, 7, 19, 3);
insert into Quarto_Produto values (null, 8, 19, 4);
insert into Quarto_Produto values (null, 9, 19, 5);
insert into Quarto_Produto values (null, 10, 19, 6);
insert into Quarto_Produto values (null, 5, 19, 7);
insert into Quarto_Produto values (null, 6, 19, 8);

insert into Quarto_Produto values (null, 5, 20, 1);
insert into Quarto_Produto values (null, 6, 20, 2);
insert into Quarto_Produto values (null, 7, 20, 3);
insert into Quarto_Produto values (null, 8, 20, 4);
insert into Quarto_Produto values (null, 9, 20, 5);
insert into Quarto_Produto values (null, 10, 20, 6);
insert into Quarto_Produto values (null, 6, 20, 8);
insert into Quarto_Produto values (null, 8, 20, 10);

insert into Quarto_Produto values (null, 5, 21, 1);
insert into Quarto_Produto values (null, 6, 21, 2);
insert into Quarto_Produto values (null, 7, 21, 3);
insert into Quarto_Produto values (null, 8, 21, 4);
insert into Quarto_Produto values (null, 5, 21, 7);
insert into Quarto_Produto values (null, 6, 21, 8);
insert into Quarto_Produto values (null, 7, 21, 9);
insert into Quarto_Produto values (null, 8, 21, 10);

insert into Quarto_Produto values (null, 10, 22, 6);
insert into Quarto_Produto values (null, 5, 22, 7);
insert into Quarto_Produto values (null, 6, 23, 8);
insert into Quarto_Produto values (null, 7, 23, 9);
insert into Quarto_Produto values (null, 8, 24, 10);

create table Quarto_Servico_Limpeza (
id_qser int primary key auto_increment,
data_qser date,
horario_qser time,
id_qua_fk int not null,
id_ser_fk int not null,
id_fun_fk int not null,
foreign key (id_qua_fk) references Quarto (id_qua),
foreign key (id_ser_fk) references Servico (id_ser),
foreign key (id_fun_fk) references Funcionario (id_fun)
);

insert into Quarto_Servico_Limpeza values (null, '2022-04-26', '14:30', 2, 4, 3);
insert into Quarto_Servico_Limpeza values (null, '2022-04-27', '12:45', 3, 4, 4);
insert into Quarto_Servico_Limpeza values (null, '2022-04-28', '11:15', 4, 4, 5);
insert into Quarto_Servico_Limpeza values (null, '2022-04-29', '10:00', 5, 4, 6);
insert into Quarto_Servico_Limpeza values (null, '2022-04-30', '09:30', 6, 4, 7);
insert into Quarto_Servico_Limpeza values (null, '2022-05-01', '14:00', 7, 4, 8);
insert into Quarto_Servico_Limpeza values (null, '2022-05-02', '13:30', 8, 4, 9);
insert into Quarto_Servico_Limpeza values (null, '2022-05-03', '11:45', 9, 4, 10);
insert into Quarto_Servico_Limpeza values (null, '2022-05-04', '10:15', 10, 4, 11);
insert into Quarto_Servico_Limpeza values (null, '2022-05-05', '09:00', 11, 4, 12);
insert into Quarto_Servico_Limpeza values (null, '2022-05-06', '13:45', 12, 4, 13);
insert into Quarto_Servico_Limpeza values (null, '2022-05-07', '12:30', 13, 4, 14);
insert into Quarto_Servico_Limpeza values (null, '2022-05-08', '11:00', 14, 4, 15);
insert into Quarto_Servico_Limpeza values (null, '2022-05-09', '09:45', 15, 4, 16);
insert into Quarto_Servico_Limpeza values (null, '2022-05-10', '09:15', 16, 4, 12);
insert into Quarto_Servico_Limpeza values (null, '2022-05-11', '13:15', 17, 4, 12);
insert into Quarto_Servico_Limpeza values (null, '2022-05-12', '12:00', 18, 4, 12);
insert into Quarto_Servico_Limpeza values (null, '2022-05-13', '10:30', 19, 4, 13);
insert into Quarto_Servico_Limpeza values (null, '2022-05-14', '09:30', 20, 4, 7);
insert into Quarto_Servico_Limpeza values (null, '2022-05-15', '14:45', 21, 4, 4);

create table Venda_Produto (
id_vpro int primary key auto_increment,
quant_vpro float,
id_ven_fk int not null,
id_pro_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven),
foreign key (id_pro_fk) references Produto (id_pro)
);

insert into venda_produto values (null, 3, 1, 1);
insert into Venda_Produto values (null, 2, 2, 2);
insert into Venda_Produto values (null, 1, 2, 3);

insert into Venda_Produto values (null, 4, 3, 4);

insert into Venda_Produto values (null, 2, 4, 5);
insert into Venda_Produto values (null, 3, 4, 6);

insert into Venda_Produto values (null, 1, 5, 7);
insert into Venda_Produto values (null, 5, 5, 8);

insert into Venda_Produto values (null, 2, 6, 9);

insert into Venda_Produto values (null, 3, 7, 10);

insert into Venda_Produto values (null, 4, 8, 11);
insert into Venda_Produto values (null, 1, 8, 12);
insert into Venda_Produto values (null, 2, 8, 13);

insert into Venda_Produto values (null, 3, 9, 14);

insert into Venda_Produto values (null, 4, 10, 1);
insert into Venda_Produto values (null, 2, 10, 2);
insert into Venda_Produto values (null, 1, 10, 5);

insert into Venda_Produto values (null, 5, 11, 10);

insert into Venda_Produto values (null, 3, 12, 1);
insert into Venda_Produto values (null, 1, 12, 8);

create table Venda_Servico (
id_vser int primary key auto_increment,
quant_vser float,
id_ven_fk int not null,
id_ser_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven),
foreign key (id_ser_fk) references Servico (id_ser)
);

insert into venda_produto values (null, 2, 1, 1);
insert into Venda_Servico values (null, 1, 2, 2);
insert into Venda_Servico values (null, 2, 3, 3);
insert into Venda_Servico values (null, 1, 4, 4);
insert into Venda_Servico values (null, 2, 5, 5);
insert into Venda_Servico values (null, 1, 6, 1);
insert into Venda_Servico values (null, 2, 7, 1);
insert into Venda_Servico values (null, 1, 8, 1);
insert into Venda_Servico values (null, 2, 9, 2);
insert into Venda_Servico values (null, 1, 10, 1);
insert into Venda_Servico values (null, 2, 11, 1);
insert into Venda_Servico values (null, 1, 12, 2);
insert into Venda_Servico values (null, 2, 13, 5);
insert into Venda_Servico values (null, 1, 14, 1);
insert into Venda_Servico values (null, 2, 15, 4);
insert into Venda_Servico values (null, 1, 16, 5);
insert into Venda_Servico values (null, 2, 17, 1);
insert into Venda_Servico values (null, 1, 18, 1);
insert into Venda_Servico values (null, 2, 19, 1);
insert into Venda_Servico values (null, 1, 20, 1);

create table Fornecedor (
id_for integer primary key auto_increment,
razao_social_for varchar (200),
nome_fantasia_for varchar (100),
cpnj_for varchar (100),
contato_for varchar (300),
email_for varchar (300),
id_end_fk int,
foreign key (id_end_fk) references endereco (id_end)
);

insert into fornecedor values (null, 'Coka Cola LTDA', 'Distribuidora Coka Cola', 
'11.123.123/0001-11', '69 3421 1111', 'coka@gmail.com', 20);
insert into fornecedor values (null, 'Aguas da Amazonia ME', 'Distribuidora de Agua Mineral Aguas da Amazonia', 
'01.454.183/0001-91', '69 3421 1578', 'aguasdaamazonia@hotmail.com.com', 30);
insert into Fornecedor values (null, 'Distribuidora de Bebidas Tropical LTDA', 'Bebidas Tropical', 
'12.345.678/0001-99', '69 3422 2222', 'bebidas.tropical@gmail.com', 25);
insert into Fornecedor values (null, 'Sabor Natural Alimentos LTDA', 'Sabor Natural', 
'45.678.912/0001-33', '69 3423 3333', 'sabornatural@gmail.com', 15);
insert into Fornecedor values (null, 'Distribuidora de Doces e Guloseimas Doçura LTDA', 'Doces Doçura', 
'88.765.432/0001-22', '69 3424 4444', 'docesdocura@gmail.com', 30);
insert into Fornecedor values (null, 'Cervejaria Artesanal Amazônia LTDA', 'Cerveja Amazônia', 
'23.456.789/0001-55', '69 3425 5555', 'cervejaamazonia@hotmail.com', 13);
insert into Fornecedor values (null, 'Frutas Frescas Distribuidora LTDA', 'Frutas Frescas', 
'34.567.891/0001-77', '69 3426 6666', 'frutasfrescas@gmail.com', 5);
insert into Fornecedor values (null, 'Distribuidora de Produtos de Limpeza Clean LTDA', 'Produtos Clean', 
'09.876.543/0001-44', '69 3427 7777', 'produtosclean@hotmail.com', 30);
insert into Fornecedor values (null, 'Laticínios Amazônia LTDA', 'Laticínios Amazônia', 
'67.891.234/0001-66', '69 3428 8888', 'laticiniosamazonia@gmail.com', 35);
insert into Fornecedor values (null, 'Distribuidora de Carnes e Frios Saborosa LTDA', 'Carnes Saborosa', 
'89.012.345/0001-88', '69 3429 9999', 'carnessaborosa@gmail.com', 34);
insert into Fornecedor values (null, 'Panificadora Pão Quentinho LTDA', 'Pão Quentinho', 
'90.123.456/0001-00', '69 3430 1010', 'paoquentinho@live.com', 28);
insert into Fornecedor values (null, 'Distribuidora de Produtos Higiene e Beleza Beleza Amazônica LTDA', 'Beleza Amazônica', 
'12.345.678/0001-90', '69 3431 1111', 'belezaamazonica@hotmail.com', 33);

create table Compra (
id_com integer primary key auto_increment,
data_com date,
valor_com double,
forma_pagamento_com varchar (100),
id_fun_fk integer not null,
id_for_fk integer not null,
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_for_fk) references Fornecedor (id_for)
);

insert into Compra values (null, '2022-03-20', 3523.60, 'Boleto - 30/60', 1, 1);
insert into Compra values (null, '2022-03-30', 5000.15, 'Dinheiro - Vista', 5, 1);
insert into Compra values (null, '2022-04-05', 2800.00, 'Cartão de Crédito - Parcelado', 3, 2);
insert into Compra values (null, '2022-04-10', 1850.75, 'Transferência Bancária', 2, 3);
insert into Compra values (null, '2022-04-15', 4200.50, 'Boleto - 30/60', 4, 4);
insert into Compra values (null, '2022-04-20', 3500.25, 'Dinheiro - Vista', 6, 5);
insert into Compra values (null, '2022-04-25', 2800.90, 'Cartão de Débito', 7, 6);
insert into Compra values (null, '2022-05-15', 1800.90, 'Cartão de Débito', 7, 6);

create table Compra_Produto (
id_comp integer not null primary key auto_increment,
quant_comp integer not null,
valor_comp float not null,
id_pro_fk integer not null,
id_com_fk integer not null,
foreign key (id_pro_fk) references Produto (id_pro),
foreign key (id_com_fk) references Compra (id_com)
);

insert into compra_produto values (null, 100, 2.50, 1, 1);
insert into compra_produto values (null, 10, 2.50, 2, 1);
insert into compra_produto values (null, 30, 4.50, 3, 1);

insert into Compra_Produto values (null, 80, 3.25, 4, 2);
insert into Compra_Produto values (null, 120, 1.50, 5, 2);
insert into Compra_Produto values (null, 50, 2.75, 6, 2);
insert into Compra_Produto values (null, 40, 4.00, 7, 2);

insert into Compra_Produto values (null, 20, 2.00, 8, 3);
insert into Compra_Produto values (null, 60, 3.75, 9, 3);

insert into Compra_Produto values (null, 70, 2.50, 10, 4);
insert into Compra_Produto values (null, 30, 3.50, 11, 4);
insert into Compra_Produto values (null, 100, 4.25, 12, 4);

insert into Compra_Produto values (null, 110, 1.75, 13, 5);
insert into Compra_Produto values (null, 90, 2.00, 14, 5);
insert into Compra_Produto values (null, 20, 3.00, 1, 5);
insert into Compra_Produto values (null, 50, 4.50, 2, 5);

insert into Compra_Produto values (null, 65, 2.75, 1, 6);
insert into Compra_Produto values (null, 40, 1.50, 5, 6);
insert into Compra_Produto values (null, 80, 3.00, 6, 6);
insert into Compra_Produto values (null, 30, 4.25, 7, 6);
insert into Compra_Produto values (null, 55, 2.25, 8, 6);

insert into Compra_Produto values (null, 25, 3.75, 9, 7);
insert into Compra_Produto values (null, 35, 2.25, 10, 7);
insert into Compra_Produto values (null, 45, 4.50, 1, 7);
insert into Compra_Produto values (null, 15, 1.75, 2, 7);

insert into Compra_Produto values (null, 50, 2.00, 1, 8);
insert into Compra_Produto values (null, 20, 3.50, 2, 8);
insert into Compra_Produto values (null, 30, 4.25, 3, 8);

create table Caixa (
id_cai integer primary key auto_increment,
data_abertura_cai date not null,
data_fechamento_cai date,
saldo_inicial_cai double not null,
valor_creditos_cai double,
valor_debitos_cai double,
saldo_final_cai double,
status_cai varchar (100) not null,
id_fun_fk int not null,
foreign key (id_fun_fk) references Funcionario (id_fun)
);

insert into Caixa values (null, '2022-05-02', '2022-05-02', 400.00, 0, 100.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-05', '2022-05-05', 500.00, 0, 200.00, 300.00, 'Fechado', 3);
insert into Caixa values (null, '2022-05-08', '2022-05-08', 600.00, 0, 300.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-11', '2022-05-11', 700.00, 0, 400.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-14', '2022-05-14', 800.00, 0, 500.00, 300.00, 'Fechado', 3);
insert into Caixa values (null, '2022-05-17', '2022-05-17', 900.00, 0, 600.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-20', '2022-05-20', 1000.00, 0, 700.00, 300.00, 'Fechado', 3);
insert into Caixa values (null, '2022-05-23', '2022-05-23', 1100.00, 0, 800.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-26', '2022-05-26', 1200.00, 0, 900.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-29', '2022-05-29', 1300.00, 0, 1000.00, 300.00, 'Fechado', 2);
insert into Caixa values (null, '2022-05-30', null, 300.00, 0, 200.00, 100.00, 'Aberto', 3);

create table Recebimento (
id_rec integer primary key auto_increment,
data_vencimento_rec date,
valor_rec double,
parcela_rec varchar(100),
status_rec varchar (100),
forma_recebimento_rec varchar (100),
data_recebimento_rec date,
id_fun_fk integer,
id_cai_fk integer,
id_ven_fk integer not null,
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_cai_fk) references Caixa (id_cai),
foreign key (id_ven_fk) references Venda (id_ven)
);

-- Recebimentos para a Venda 1
insert into Recebimento values (null, '2022-06-01', 100.00, '1/2', 'Fechado', 'Cartão Stone', '2022-06-01', 2, 1, 1);
insert into Recebimento values (null, '2022-07-01', 100.00, '2/2', 'Aberto', null, null, null, null, 1);

-- Recebimentos para a Venda 2
insert into Recebimento values (null, '2022-06-02', 150.00, '1/3', 'Fechado', 'Dinheiro', '2022-06-02', 3, 1, 2);
insert into Recebimento values (null, '2022-07-02', 150.00, '2/3', 'Aberto', null, null, null, null, 2);
insert into Recebimento values (null, '2022-08-02', 150.00, '3/3', 'Aberto', null, null, null, null, 2);

-- Recebimentos para a Venda 3
insert into Recebimento values (null, '2022-06-03', 80.00, '1/2', 'Fechado', 'Boleto Bancário', '2022-06-03', 3, 1, 3);
insert into Recebimento values (null, '2022-07-03', 80.00, '2/2', 'Aberto', null, null, null, null, 3);

-- Recebimentos para a Venda 4
insert into Recebimento values (null, '2022-06-04', 200.00, '1/1', 'Fechado', 'Pix', '2022-06-04', 2, 1, 4);

-- Recebimentos para a Venda 5
insert into Recebimento values (null, '2022-06-05', 90.00, '1/3', 'Fechado', 'Cartão Visa', '2022-06-05', 2, 2, 5);
insert into Recebimento values (null, '2022-07-05', 90.00, '2/3', 'Aberto', null, null, null, null, 5);
insert into Recebimento values (null, '2022-08-05', 90.00, '3/3', 'Aberto', null, null, null, null, 5);

-- Recebimentos para a Venda 6
insert into Recebimento values (null, '2022-06-06', 120.00, '1/2', 'Fechado', 'Transferência Bancária', '2022-06-06', 3, 2, 6);
insert into Recebimento values (null, '2022-07-06', 120.00, '2/2', 'Aberto', null, null, null, null, 6);

-- Recebimentos para a Venda 7
insert into Recebimento values (null, '2022-06-07', 300.00, '1/1', 'Fechado', 'Dinheiro', '2022-06-07', 3, 3, 7);

-- Recebimentos para a Venda 8
insert into Recebimento values (null, '2022-06-08', 180.00, '1/2', 'Fechado', 'Boleto Bancário', '2022-06-08', 2, 4, 8);
insert into Recebimento values (null, '2022-07-08', 180.00, '2/2', 'Aberto', null, null, null, null, 8);

-- Recebimentos para a Venda 9
insert into Recebimento values (null, '2022-06-09', 250.00, '1/3', 'Fechado', 'Cartão Mastercard', '2022-06-09', 3, 5, 9);
insert into Recebimento values (null, '2022-07-09', 250.00, '2/3', 'Fechado', 'Cartão Mastercard', '2022-07-09', 3, 5, 9);
insert into Recebimento values (null, '2022-08-09', 250.00, '3/3', 'Aberto', null, null, null, null, 9);

-- Recebimentos para a Venda 10
insert into Recebimento values (null, '2022-06-10', 350.00, '1/2', 'Fechado', 'Pix', '2022-06-10', 6, 6, 10);
insert into Recebimento values (null, '2022-07-10', 350.00, '2/2', 'Aberto', null, null, null, null, 10);

-- Recebimentos para a Venda 11
insert into Recebimento values (null, '2022-06-11', 150.00, '1/1', 'Fechado', 'Transferência Bancária', '2022-06-11', 3, 7, 11);

-- Recebimentos para  a Venda 12
insert into Recebimento values (null, '2022-06-12', 80.00, '1/2', 'Fechado', 'Cartão Visa', '2022-06-12', 3, 8, 12);
insert into Recebimento values (null, '2022-07-12', 80.00, '2/2', 'Aberto', null, null, null, null, 12);

-- Recebimentos para a Venda 13
insert into Recebimento values (null, '2022-06-13', 170.00, '1/1', 'Fechado', 'Dinheiro', '2022-06-13', 3, 9, 13);

-- Recebimentos para a Venda 14
insert into Recebimento values (null, '2022-06-14', 90.00, '1/2', 'Fechado', 'Boleto Bancário', '2022-06-14', 2, 10, 14);
insert into Recebimento values (null, '2022-07-14', 90.00, '2/2', 'Aberto', null, null, null, null, 14);

-- Recebimentos para a Venda 15
insert into Recebimento values (null, '2022-06-15', 200.00, '1/3', 'Fechado', 'Cartão Mastercard', '2022-06-15', 2, 11, 15);
insert into Recebimento values (null, '2022-07-15', 200.00, '2/3', 'Fechado', 'Cartão Mastercard', '2022-07-15', 2, 11, 15);
insert into Recebimento values (null, '2022-08-15', 200.00, '3/3', 'Aberto', null, null, null, null, 15);

-- Recebimentos para a Venda 16
insert into Recebimento values (null, '2022-06-16', 120.00, '1/1', 'Fechado', 'Pix', '2022-06-16', 6, 11, 16);

-- Recebimentos para a Venda 17
insert into Recebimento values (null, '2022-06-17', 300.00, '1/2', 'Fechado', 'Transferência Bancária', '2022-06-17', 2, 11, 17);
insert into Recebimento values (null, '2022-07-17', 300.00, '2/2', 'Aberto', null, null, null, null, 17);

-- Recebimentos para a Venda 18
insert into Recebimento values (null, '2022-06-18', 180.00, '1/3', 'Fechado', 'Cartão Visa', '2022-06-18', 3, 11, 18);
insert into Recebimento values (null, '2022-07-18', 180.00, '2/3', 'Fechado', 'Cartão Visa', '2022-07-18', 3, 11, 18);
insert into Recebimento values (null, '2022-08-18', 180.00, '3/3', 'Aberto', null, null, null, null, 18);

-- Recebimentos para a Venda 19
insert into Recebimento values (null, '2022-06-19', 250.00, '1/1', 'Fechado', 'Boleto Bancário', '2022-06-19', 3, 11, 19);

-- Recebimentos para a Venda 20
insert into Recebimento values (null, '2022-06-20', 350.00, '1/2', 'Fechado', 'Dinheiro', '2022-06-20', 2, 11, 20);
insert into Recebimento values (null, '2022-07-20', 350.00, '2/2', 'Aberto', null, null, null, null, 20);


create table Despesa (
id_des integer primary key auto_increment,
descricao_des varchar (200),
valor_des double,
numero_documento_des integer,
forma_pagamento_des varchar (200),
id_for_fk int,
foreign key (id_for_fk) references Fornecedor (id_for)
);

insert into despesa values (null, 'Conta de agua ref. Maio/2022', 200.00, 1234564544, 'A Vista', 1);
insert into Despesa values (null, 'Conta de energia ref. Maio/2022', 400.00, 1234564545, 'Boleto', 2);
insert into Despesa values (null, 'Manutenção de elevadores', 1000.00, 1234564546, 'Transferência Bancária', 3);
insert into Despesa values (null, 'Limpeza e higienização de piscina', 300.00, 1234564547, 'Dinheiro', 4);
insert into Despesa values (null, 'Compra de materiais de limpeza', 150.00, 1234564548, 'Cartão de Crédito', 5);
insert into Despesa values (null, 'Manutenção de jardim', 250.00, 1234564549, 'A Vista', 6);
insert into Despesa values (null, 'Compra de produtos de higiene', 180.00, 1234564550, 'Boleto Bancário', 7);
insert into Despesa values (null, 'Compra de alimentos para café da manhã', 350.00, 1234564551, 'Dinheiro', 8);
insert into Despesa values (null, 'Manutenção de ar condicionado', 500.00, 1234564552, 'Cartão de Débito', 9);
insert into Despesa values (null, 'Compra de roupas de cama e banho', 700.00, 1234564553, 'Transferência Bancária', 10);
insert into Despesa values (null, 'Serviços de segurança', 600.00, 1234564554, 'A Vista', 11);

create table Pagamento (
id_pag integer primary key auto_increment,
data_vencimento_pag date,
valor_pag float,
parcela_pag varchar (100),
status_pag varchar (100),
forma_pagamento_pag varchar (100),
data_pagamento_pag date,
id_fun_fk integer,
id_cai_fk integer,
id_des_fk integer,
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_cai_fk) references Caixa (id_cai),
foreign key (id_des_fk) references Despesa (id_des)
);

insert into pagamento values (null, '2022-06-01', 200.00, '1/1', 'Pago', 'Conta Banco Brasil', '2022-06-01', 1, 1, 1);
insert into Pagamento values (null, '2022-06-02', 400.00, '1/1', 'Pago', 'Transferência Bancária', '2022-06-02', 2, 2, 2);
insert into Pagamento values (null, '2022-06-03', 1000.00, '1/1', 'Pago', 'Dinheiro', '2022-06-03', 3, 3, 3);
insert into Pagamento values (null, '2022-06-04', 300.00, '1/1', 'Pago', 'Cartão de Crédito', '2022-06-04', 4, 4, 4);
insert into Pagamento values (null, '2022-06-05', 150.00, '1/1', 'Pago', 'Boleto Bancário', '2022-06-05', 5, 5, 5);
insert into Pagamento values (null, '2022-06-06', 250.00, '1/1', 'Pago', 'Transferência Bancária', '2022-06-06', 6, 6, 6);
insert into Pagamento values (null, '2022-06-07', 180.00, '1/1', 'Pago', 'Dinheiro', '2022-06-07', 7, 7, 7);
insert into Pagamento values (null, '2022-06-08', 350.00, '1/1', 'Pago', 'Cartão de Crédito', '2022-06-08', 8, 8, 8);
insert into Pagamento values (null, '2022-06-09', 500.00, '1/1', 'Pago', 'Boleto Bancário', '2022-06-09', 9, 9, 9);
insert into Pagamento values (null, '2022-06-10', 700.00, '1/1', 'Pago', 'Dinheiro', '2022-06-10', 10, 10, 10);
insert into Pagamento values (null, '2022-06-11', 600.00, '1/1', 'Pago', 'Transferência Bancária', '2022-06-11', 1, 11, 11);
