CREATE DATABASE bd_gestao_vistorias_leyukezer;

USE bd_gestao_vistorias_leyukezer;

CREATE TABLE estado(
id_est INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_est VARCHAR(40) NOT NULL,
uf_est VARCHAR(40)
);

INSERT INTO estado(nome_est,uf_est) VALUES(
'RONDÔNIA',
'RO'
),(
'AMAZONAS',
'AM'
),(
'MATO GROSSO',
'MT'
);

CREATE TABLE cidade(
id_cid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_cid VARCHAR(45) NOT NULL,
id_est_fk INT NOT NULL,
FOREIGN KEY(id_est_fk) REFERENCES estado(id_est)
);

INSERT INTO cidade(nome_cid, id_est_fk) VALUES(
'JI-PARANÁ',
1
),(
'OURO PRETO DO OESTE',
1
),(
'PRESIDENTE MÉDICI',
1
);

CREATE TABLE endereco(
id_end INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cep_end VARCHAR(9) NOT NULL,
logradouro_end VARCHAR(80) NOT NULL,
numero_end VARCHAR(7) NOT NULL,
bairro_end VARCHAR(20) NOT NULL,
id_cid_fk INT NOT NULL,
FOREIGN KEY(id_cid_fk) REFERENCES cidade(id_cid)
);

INSERT INTO endereco(
cep_end,
logradouro_end,
numero_end,
bairro_end,
id_cid_fk
) VALUES (
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
),(
'76900-005',
'Avenida Marechal Rondon',
'135',
'União',
1
),(
'76907-394',
'Rua Elias Cardoso Balau',
'453',
'São Bernardo',
1
),(
'76907-226',
'Rua do Ouro',
'919',
'Novo Horizonte',
1
),(
'76914-846',
'Avenida Transcontinental',
'1534-A',
'Primavera',
1
),(
'76913-257',
'Rua Coqueiros',
'811',
'União II',
1
),(
'76912-706',
'Rua Castanheira',
'944',
'Jorge Teixeira',
1
),(
'76906-766',
'Rua Márcio Sotte dos Anjos',
'465',
'Colina Park II',
1
),(
'76913-247',
'Rua Coqueiros',
'635',
'União II',
1
);

CREATE TABLE sexo (
  id_sex INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_sex VARCHAR(20) NOT NULL,
  descricao VARCHAR(80)
);

INSERT INTO sexo (nome_sex)VALUES (
'MASCULINO'
),(
'FEMININO'
);

CREATE TABLE estado_civil(
id_estc INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_estc VARCHAR(45) NOT NULL,
descricao_estc VARCHAR(80)
);

INSERT INTO estado_civil(nome_estc) VALUES (
'SOLTEIRO(A)'
),(
'CASADO(A)'
),(
'VIUVO(A)');

CREATE TABLE orgao_emissor (
  id_org INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_org VARCHAR(45) NOT NULL,
  sigla_org VARCHAR(10),
  descricao_org VARCHAR(45)
);

INSERT INTO orgao_emissor(nome_org, sigla_org) VALUES (
'Secretaria de Segurança Pública de Rondônia',
'SSP/RO'
),(
'Coordenação-Geral de Privilégios e Imunidades',
'CGPI'
),(
'Conselho Nacional de Imigração',
'CNIG'
);

CREATE TABLE tipo_servico (
  id_tip INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_tip VARCHAR(45) NOT NULL
);

INSERT INTO tipo_servico(nome_tip) VALUES(
'TRANSFERÊNCIA'),(
'CAUTELAR'),(
'EMPLACAMENTO');

CREATE TABLE filiais (
  id_fil INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_fil VARCHAR(45) NOT NULL
);

INSERT INTO filiais(nome_fil) VALUES(
'ALFA VISTORIAS'),(
'CENTRAL VISTORIAS'),(
'JI-PARANÁ - VISTORIA VEICULAR');

CREATE TABLE funcao (
  id_funcao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_funcao VARCHAR(45) NOT NULL
);

INSERT INTO funcao(nome_funcao) VALUES (
'ADMINISTRADOR(A)'),(
'ASSISTENTE'),(
'ATENDENTE');

CREATE TABLE marca_veiculo (
  id_mar INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_mar VARCHAR(45) NOT NULL
);

INSERT INTO marca_veiculo(nome_mar) VALUES(
'FIAT'),(
'VOLKSWAGEN'),(
'CHEVROLET'),(
'YAMAHA'),(
'HONDA'),(
'MERCEDES-BENZ');

CREATE TABLE cor_veiculo (
  id_cor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_cor VARCHAR(45) NOT NULL
);

INSERT INTO cor_veiculo(nome_cor) VALUES (
'BRANCO'),(
'PRETO'),(
'CINZA'),(
'VERMELHO');

CREATE TABLE categoria_veiculo (
  id_cat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_Cat VARCHAR(45) NOT NULL
);

INSERT INTO categoria_veiculo(nome_cat) VALUES (
'MOTO'),(
'CARRO'),(
'CAMINHÃO');

CREATE TABLE contato (
  id_con INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  imagem_con BLOB,
  contatoUm_con VARCHAR(16) NOT NULL,
  contatoDois_con VARCHAR(16),
  contatoTres_con VARCHAR(16),
  emailUm_con VARCHAR(85),
  emailDois_con VARCHAR(85)
);

INSERT INTO contato (imagem_con, contatoUm_con,contatoDois_con, contatoTres_con, emailUm_con,emailDois_con) VALUES(
NULL,
'(69)92153-8341',
'(69)93637-4836',
NULL,
'wenjing5577@uorak.com',
NULL
),(
NULL,
'(69)93885-8473',
NULL,
NULL,
'christof4324@uorak.com',
NULL
),(
NULL,
'(69)93555-3113',
'(69)92857-2114',
'(69)92471-7762',
'diakite3556@uorak.com',
'amanda1842@uorak.com'
),(
NULL,
'(69)92570-3872',
'(69)98328-5653',
NULL,
'fiscal@lizemanoelmarcenariame.com.br',
NULL
),(
NULL,
'(69) 2544-5675',
'(69) 99579-9852',
NULL,
'fabricacao@luciaepedrohenriqueesportesltda.com.br',
NULL
),(
NULL,
'(69) 3596-3820',
'(69) 98661-0884',
NULL,
'contabilidade@biancaesaratelasltda.com.br',
NULL
),(
NULL,
'(69) 3422-4523',
NULL,
NULL,
'impeljpdistribuidora@gmail.com',
NULL
),(
NULL,
'(69) 2805-4834',
'(69) 98479-7054',
NULL,
'autopecas@autocarltda.com.br',
NULL),(
NULL,
'(69) 2602-4612',
'(69) 99413-6642',
NULL,
'brenda-fogaca86@techs.com.br',
NULL
),(
NULL,
'(69) 2984-7457',
'(69) 99298-9000',
NULL,
'accont@techs.com.br',
NULL
),(
NULL,
'(69) 2958-6770',
'(69) 99364-9796',
NULL,
'hasnia8609@uorak.com',
NULL
);

CREATE TABLE pessoa_fisica (
  id_pf INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cpf_pf VARCHAR(14) NOT NULL,
  nomeCompleto_pf VARCHAR(80) NOT NULL,
  rg_pf VARCHAR(12),
  dataNasc_pf DATE,
  id_sex_fk INT,
  id_org_fk INT,
  id_end_fk INT NOT NULL,
  id_con_fk INT NOT NULL,
  FOREIGN KEY (id_sex_fk) REFERENCES sexo(id_sex),
  FOREIGN KEY (id_org_fk) REFERENCES orgao_Emissor(id_org),
  FOREIGN KEY (id_end_fk) REFERENCES endereco(id_end),
  FOREIGN KEY (id_con_fk) REFERENCES contato(id_con)
);

INSERT INTO pessoa_fisica(cpf_pf,nomeCompleto_pf,rg_pf,dataNasc_pf,id_sex_fk,id_org_fk,id_end_fk,id_con_fk) VALUES (
'625.774.142-42',
'Leonardo João Manoel Nunes',
'31.475.039-3',
'2004-01-16',
1,
1,
3,
1
),(
'911.163.472-37',
'Isaac Gael Fábio Fernandes',
'44.318.792-7',
'2002-04-04',
1,
1,
2,
2
),(
'043.471.412-70',
'Eduardo Anderson Moraes',
'20.430.242-0',
'2001-07-25',
1,
1,
1,
3
),(
'027.344.032-26',
'Brenda Elza Fogaça',
'47.371.800-5',
'2001-03-17',
2,
1,
9,
9
),(
'739.268.062-57',
'Antonella Emily Patrícia Moreira',
'35.501.751-9',
'1998-04-01',
2,
1,
10,
10
),(
'872.483.332-04',
'Laís Emanuelly Elaine Pereira',
'49.203.597-0',
'1997-02-06',
2,
1,
11,
11
);

CREATE TABLE pessoa_juridica (
  id_pj INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cnpj_pj VARCHAR(20) NOT NULL,
  rasaoSocial_pj VARCHAR(45) NOT NULL,
  nomeFantasia_pj VARCHAR(45),
  inscricaoEstadual_pj VARCHAR(45),
  atividadeEconomica_pj VARCHAR(45),
  situacao_pj BOOLEAN NOT NULL DEFAULT TRUE,
  responsavel_pj VARCHAR(45),
  id_con_fk INT NOT NULL,
  id_end_fk INT NOT NULL,
  fornecedor_pj BOOLEAN NOT NULL DEFAULT FALSE,
  empresa_pj BOOLEAN NOT NULL DEFAULT FALSE,
  FOREIGN KEY (id_con_fk) REFERENCES Contato(id_con),
  FOREIGN KEY (id_end_fk) REFERENCES Endereco(id_end)
);

INSERT INTO pessoa_juridica(rasaoSocial_pj,cnpj_pj,inscricaoEstadual_pj,reponsavel_pj,situacao_pj,id_con_fk,id_end_fk) VALUES (
'Liz e Manoel Marcenaria ME',
'29.242.744/0001-02',
'0521626791611-2',
NULL,
TRUE,
4,
4
),(
'Lúcia e Pedro Henrique Esportes Ltda',
'12.678.165/0001-04',
'4226434373991-5',
NULL,
TRUE,
5,
5
),(
'Bianca e Sara Telas Ltda',
'52.905.885/0001-71',
'9760114600365-4',
NULL,
TRUE,
6,
6
);

INSERT INTO pessoa_juridica(fornecedor_pj,rasaoSocial_pj,cnpj_pj,inscricaoEstadual_pj,reponsavel_pj,situacao_pj,id_con_fk,id_end_fk) VALUES (
TRUE,
'Impel Distribuidora de Auto Peças',
'29.996.912/0001-47',
'0367021371387-5',
NULL,
TRUE,
7,
7
);

INSERT INTO pessoa_juridica(empresa_pj,rasaoSocial_pj,cnpj_pj,inscricaoEstadual_pj,reponsavel_pj,situacao_pj,id_con_fk,id_end_fk) VALUES (
TRUE,
'AutoCar Acessorios e auto peças',
'35.884.527/0001-00',
'8504735424403-5',
NULL,
TRUE,
8,
8
);

CREATE TABLE funcionario (
  id_fun INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_estc_fk INT,
  dataContrat_fun DATE,
  dataDispen_fun DATE,
  remuneracao_fun DOUBLE,
  situacao_fun BOOLEAN NOT NULL DEFAULT TRUE,
  id_fil_fk INT NOT NULL,
  id_funcao_fk INT NOT NULL,
  id_pf_fk INT NOT NULL,
  FOREIGN KEY (id_fil_fk) REFERENCES Filiais(id_fil),
  FOREIGN KEY (id_funcao_fk) REFERENCES Funcao(id_funcao),
  FOREIGN KEY (id_pf_fk) REFERENCES Pessoa_Fisica(id_pf)
);

INSERT INTO funcionario(id_pf_fk,id_estc_fk,dataCotrat, dataDispen_fun, remuneracao_fun, situacao_fun, id_fil_fk, id_funcao_fk) VALUES(
4,
2,
'2024-06-17',
NULL,
1875.50,
NULL,
3,
2
),(
5,
1,
'2025-04-04',
NULL,
2450.87,
NULL,
3,
3
),(
6,
1,
'2024-07-23',
NULL,
1450.65,
NULL,
3,
1
);	

CREATE TABLE servico (
  id_ser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  valor_ser DOUBLE NOT NULL,
  tempo_estiamdo_ser TIME,
  garantia_ser INT,
  id_tip_fk INT,
  FOREIGN KEY (id_tip_fk) REFERENCES Tipo_Servico(id_tip)
);

INSERT INTO servico(valor_ser, tempo_estiamdo_ser, garantia_ser, id_tip_fk) VALUES (
250.00,
'01:00:00',
30,
1
),(
180.00,
'00:45:00',
15,
2
),(
300.00,
'01:30:00',
60,
3
);

CREATE TABLE veiculo (
  id_vei INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  placa_vei VARCHAR(45) NOT NULL,
  ano_vei VARCHAR(45),
  modelo_vei VARCHAR(45) NOT NULL,
  id_mar_fk INT,
  id_cor_fk INT,
  id_cat_fk INT,
  chassis_vei VARCHAR(45),
  renavam_vei VARCHAR(45),
  vincular_cliente_vei TINYINT,
  Veiculocol VARCHAR(45),
  id_pf_fk INT,
  id_pj_fk INT,
  FOREIGN KEY (id_mar_fk) REFERENCES Marca(id_mar),
  FOREIGN KEY (id_cor_fk) REFERENCES Cor(id_cor),
  FOREIGN KEY (id_cat_fk) REFERENCES Categoria(id_cat),
  FOREIGN KEY (id_pf_fk) REFERENCES Pessoa_Fisica(id_pf),
  FOREIGN KEY (id_pj_fk) REFERENCES Pessoa_Juridica(id_pj)
);

INSERT INTO veiculo(placa_vei, ano_vei, modelo_vei, id_mar_fk, id_cor_fk, id_cat_fk, chassis_vei, renavam_vei, vincular_cliente_vei, Veiculocol, id_pf_fk, id_pj_fk) VALUES (
'NXY1D23',
'2020',
'UNO MILLE',
1,
1,
2,
'9BWZZZ377VT004251',
'12345678900',
1,
NULL,
1,
NULL
),(
'AZK9E34',
'2021',
'BIZ 125',
5,
2,
1,
'9C2JC3010ER500001',
'98765432111',
1,
NULL,
2,
NULL
),(
'JKL3F45',
'2022',
'ACTROS 2546',
6,
3,
3,
'WDB9340321L123456',
'19283746500',
1,
NULL,
NULL,
3
);

CREATE TABLE cliente_venda (
  id_cli INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_vei_fk INT NOT NULL,
  id_pj_fk INT,
  id_pf_fk INT,
  FOREIGN KEY (id_vei_fk) REFERENCES Veiculo(id_vei),
  FOREIGN KEY (id_pj_fk) REFERENCES Pessoa_Juridica(id_pj),
  FOREIGN KEY (id_pf_fk) REFERENCES Pessoa_Fisica(id_pf)
);

INSERT INTO cliente_venda(id_vei_fk, id_pj_fk, id_pf_fk) VALUES (
1,
NULL,
1
),(
2,
NULL,
2
),(
3,
1,
NULL
);

CREATE TABLE caixa (
  id_cai INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  status_cai BOOLEAN NOT NULL DEFAULT TRUE,
  nome_cai VARCHAR(45) NOT NULL,
  saldo_cai DOUBLE NOT NULL
);

INSERT INTO caixa(status_cai, nome_cai, saldo_cai) VALUES (
TRUE,
'Caixa Principal',
10000.00
),(
FALSE,
'Caixa 02',
5500.50
),(
TRUE,
'Caixa Interno',
2300.75
);

CREATE TABLE encargo_bancario (
  id_enc INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  aliquota_enc DOUBLE NOT NULL,
  tipo_enc VARCHAR(45) NOT NULL,
  dispositivo_enc VARCHAR(45) NOT NULL,
  operacao_enc VARCHAR(45) NOT NULL
);

INSERT INTO encargo_bancario(aliquota_enc, tipo_enc, dispositivo_enc, operacao_enc) VALUES (
2.5,
'JUROS',
'MAQUININHA 2453',
'VENDA A PRAZO'
),(
1.2,
'TAXA',
'MAQUININHA 5403',
'SERVIÇO'
),(
0.9,
'MULTA',
'MAQUININHA 2453',
'PAGAMENTO EM ATRASO'
);

CREATE TABLE plano_de_contas (
  id_pla INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  descricao_pla VARCHAR(45) NOT NULL,
  abreviatura_pla VARCHAR(45) NOT NULL,
  naturaza_pla ENUM('CREDORA', 'DEBITORA') NOT NULL,
  observacao_pla VARCHAR(45)
);

INSERT INTO plano_de_contas(descricao_pla, abreviatura_pla, naturaza_pla, observacao_pla) VALUES (
'Receitas com Serviços',
'RCS',
'CREDORA',
'Receita operacional'
),(
'Despesas com Material',
'DMT',
'DEBITORA',
'Compra de insumos'
),(
'Salários Funcionários',
'SLR',
'DEBITORA',
'Pagamento de salários'
);

CREATE TABLE venda (
  id_ven INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_ven DATE NOT NULL,
  hora_ven TIME NOT NULL,
  id_cai_fk INT NOT NULL,
  id_cli_fk INT NOT NULL,
  id_fun_fk INT NOT NULL,
  desconto_ven DOUBLE,
  subtotal_ven DOUBLE NOT NULL,
  total_ven DOUBLE NOT NULL,
  FOREIGN KEY (id_cai_fk) REFERENCES Caixa(id_cai),
  FOREIGN KEY (id_cli_fk) REFERENCES Cliente_Venda(id_cli),
  FOREIGN KEY (id_fun_fk) REFERENCES Funcionario(id_fun)
);

INSERT INTO venda(data_ven, hora_ven, id_cai_fk, id_cli_fk, id_fun_fk, desconto_ven, subtotal_ven, total_ven) VALUES (
'2025-04-01',
'10:30:00',
1,
1,
1,
0.20,
250.00,
200.00
),(
'2025-04-02',
'14:45:00',
2,
2,
2,
0.00,
180.00,
180.00
),(
'2025-04-03',
'09:20:00',
3,
3,
3,
0.10,
600.00,
540.00
),(
'2025-04-07',
'12:30:00',
1,
2,
2,
0.20,
1000.00,
800.00
);

CREATE TABLE servico_Venda (
  id_ser_ven INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  id_ser_fk INT NOT NULL,
  unidade_ser_ven VARCHAR(5) NOT NULL,
  quantidade_ser_ven INT,
  valor_total_ser_ven DOUBLE NOT NULL,
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven),
  FOREIGN KEY (id_ser_fk) REFERENCES Servico(id_ser)
);

INSERT INTO servico_Venda(id_ven_fk, id_ser_fk, unidade_ser_ven, quantidade_ser_ven, valor_total_ser_ven) VALUES (
1,
1,
'SER',
1,
250.00
),(
2,
2,
'SER',
1,
180.00
),(
3,
3,
'SER',
1,
300.00
),(
4,
3,
'PROD',
4,
250.00
);

CREATE TABLE venda_a_prazo (
  id_venp INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  tipo_venp VARCHAR(45) NOT NULL,
  parcela_venp INT NOT NULL,
  id_enc_fk INT NOT NULL,
  emissao_venp DATE NOT NULL,
  observacao_venp VARCHAR(45),
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven),
  FOREIGN KEY (id_enc_fk) REFERENCES Encargo_Bancario(id_enc)
);

INSERT INTO venda_a_prazo(id_ven_fk, tipo_venp, parcela_venp, id_enc_fk, emissao_venp, observacao_venp) VALUES (
1,
'CARTÃO DE CRÉDITO',
3,
1,
'2025-04-01',
'Parcelado'
),(
2,
'CARTÃO DE DÉBITO',
2,
2,
'2025-04-02',
NULL
),(
3,
'PROMISSÓRIA',
4,
3,
'2025-04-03',
'Parcelado'
);

CREATE TABLE recebimento (
  id_rec VARCHAR(45) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_venp_fk INT NOT NULL,
  data_rec DATE NOT NULL,
  hora_rec TIME NOT NULL,
  tipo_rec VARCHAR(45),
  FOREIGN KEY (id_venp_fk) REFERENCES Venda_a_Prazo(id_venp)
);

INSERT INTO recebimento(id_venp_fk, data_rec, hora_rec, tipo_rec) VALUES (
1,
'2025-04-05',
'08:00:00',
'CARTÃO DE CRÉDITO'
),(
2,
'2025-04-06',
'09:15:00',
'CARTÃO DE DÉBITO'
),(
3,
'2025-04-07',
'10:45:00',
'DINHEIRO'
);

CREATE TABLE venda_a_vista (
  id_venv INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  tipo_venv VARCHAR(45) NOT NULL,
  emissao_venv DATE NOT NULL,
  observacao VARCHAR(45),
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven)
);

INSERT INTO venda_a_vista(id_ven_fk, tipo_venv, emissao_venv, observacao) VALUES (
4,
'PIX',
'2025-04-07',
NULL
);

CREATE TABLE recebimento_avulso (
  id_avu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_avu DATE NOT NULL,
  hora_avu TIME NOT NULL,
  id_cai_fk INT NOT NULL,
  valor_avu DOUBLE NOT NULL,
  descricao_avu VARCHAR(45) NOT NULL,
  id_pla_fk INT NOT NULL,
  forma_pagamento_avu VARCHAR(45) NOT NULL,
  observacao_avu VARCHAR(45),
  FOREIGN KEY (id_cai_fk) REFERENCES Caixa(id_cai),
  FOREIGN KEY (id_pla_fk) REFERENCES Plano_de_Contas(id_pla)
);

CREATE TABLE despesa (
  id_des INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_des DATE NOT NULL,
  id_pj_fk INT NOT NULL,
  descricao_des VARCHAR(45) NOT NULL,
  valor_des DOUBLE NOT NULL,
  vencimento_des DATE NOT NULL,
  FOREIGN KEY (id_pj_fk) REFERENCES Pessoa_Juridica(id_pj)
);

CREATE TABLE pagamento (
id_pag VARCHAR(45) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_des_fk INT NOT NULL,
id_cai_fk INT NOT NULL,
id_pla_fk INT NOT NULL,
status_pag BOOLEAN NOT NULL DEFAULT TRUE,
FOREIGN KEY (id_des_fk) REFERENCES Despesa(id_des),
FOREIGN KEY (id_cai_fk) REFERENCES Caixa(id_cai),
FOREIGN KEY (id_pla_fk) REFERENCES Plano_de_Contas(id_pla)
);