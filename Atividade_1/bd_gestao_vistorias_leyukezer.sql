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
),
(
'AMAZONAS',
'AM'
),
(
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
),
(
'OURO PRETO DO OESTE',
1
),
(
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
);

CREATE TABLE sexo (
  id_sex INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_sex VARCHAR(20) NOT NULL,
  descricao VARCHAR(80)
);

INSERT INTO sexo (nome_sex)VALUES (
'MASCULINO'
),
(
'FEMININO'
);

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

INSERT INTO tipo_servico(nome_tip) VALUES 
('TRANSFERÊNCIA'),
('CAUTELAR'),
('EMPLACAMENTO');

CREATE TABLE filiais (
  id_fil INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_fil VARCHAR(45) NOT NULL
);

INSERT INTO filiais(nome_fil) VALUES
('ALFA VISTORIAS'),
('CENTRAL VISTORIAS'),
('JI-PARANÁ - VISTORIA VEICULAR');

CREATE TABLE funcao (
  id_funcao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_funcao VARCHAR(45) NOT NULL
);

INSERT INTO funcao(nome_funcao) VALUES 
('ADMINISTRADOR(A)'),
('ASSISTENTE'),
('ATENDENTE');

CREATE TABLE marca_veiculo (
  id_mar INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_mar VARCHAR(45) NOT NULL
);

INSERT INTO marca_veiculo(nome_mar) VALUES
('FIAT'),
('VOLKSWAGEN'),
('CHEVROLET'),
('YAMAHA'),
('HONDA'),
('MERCEDES-BENZ');

CREATE TABLE cor_veiculo (
  id_cor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_cor VARCHAR(45) NOT NULL
);

INSERT INTO cor_veiculo(nome_cor) VALUES 
('BRANCO'),
('PRETO'),
('CINZA'),
('VERMELHO');

CREATE TABLE categoria_veiculo (
  id_cat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_Cat VARCHAR(45) NOT NULL
);

INSERT INTO categoria_veiculo(nome_cat) VALUES 
('MOTO'),
('CARRO'),
('CAMINHÃO');

CREATE TABLE contato (
  id_con INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  imagem_con BLOB,
  contatoUm_con VARCHAR(45) NOT NULL,
  contatoDois_con VARCHAR(45),
  contatoTres_con VARCHAR(45),
  emailUm_con VARCHAR(45),
  emailDois_con VARCHAR(45)
);

CREATE TABLE caixa (
  id_cai INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  status_cai VARCHAR(45) NOT NULL,
  nome_cai VARCHAR(45) NOT NULL,
  saldo_cai DOUBLE NOT NULL
);

CREATE TABLE encargo_bancario (
  id_enc INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  aliquota_enc VARCHAR(45) NOT NULL,
  tipo_enc VARCHAR(45) NOT NULL,
  dispositivo_enc VARCHAR(45) NOT NULL,
  operacao_enc VARCHAR(45) NOT NULL
);

CREATE TABLE plano_de_contas (
  id_pla INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  descricao_pla VARCHAR(45) NOT NULL,
  abreviatura_pla VARCHAR(45) NOT NULL,
  naturaza_pla VARCHAR(45) NOT NULL,
  observacao_pla VARCHAR(45)
);

CREATE TABLE pessoa_fisica (
  id_pf INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cpf_pf VARCHAR(14) NOT NULL,
  nomeCompleto_pf VARCHAR(80) NOT NULL,
  rg_pf VARCHAR(8),
  dataNasc_pf VARCHAR(45),
  id_sex_fk INT,
  id_org_fk INT,
  id_end_fk INT NOT NULL,
  id_con_fk INT NOT NULL,
  FOREIGN KEY (id_sex_fk) REFERENCES Sexo(id_sex),
  FOREIGN KEY (id_org_fk) REFERENCES Orgao_Emissor(id_org),
  FOREIGN KEY (id_end_fk) REFERENCES Endereco(id_end),
  FOREIGN KEY (id_con_fk) REFERENCES Contato(id_con)
);

CREATE TABLE pessoa_juridica (
  id_pj INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cnpj_pj VARCHAR(45) NOT NULL,
  rasaoSocial_pj VARCHAR(45) NOT NULL,
  nomeFantasia_pj VARCHAR(45),
  inscricaoEstadual_pj VARCHAR(45),
  atividadeEconomica_pj VARCHAR(45),
  situacao_pj INT,
  responsavel_pj VARCHAR(45),
  id_con_fk INT NOT NULL,
  id_end_fk INT NOT NULL,
  fornecedor_pj TINYINT NOT NULL DEFAULT 0,
  empresa_pj TINYINT NOT NULL DEFAULT 0,
  FOREIGN KEY (id_con_fk) REFERENCES Contato(id_con),
  FOREIGN KEY (id_end_fk) REFERENCES Endereco(id_end)
);

CREATE TABLE funcionario (
  id_fun INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  estado_civil_fun VARCHAR(45),
  data_contrat_fun DATETIME,
  data_dispen_fun DATETIME,
  remuneracao_fun DOUBLE,
  situacao TINYINT,
  id_fil_fk INT NOT NULL,
  id_funcao_fk INT NOT NULL,
  id_pf_fk INT NOT NULL,
  FOREIGN KEY (id_fil_fk) REFERENCES Filiais(id_fil),
  FOREIGN KEY (id_funcao_fk) REFERENCES Funcao(id_funcao),
  FOREIGN KEY (id_pf_fk) REFERENCES Pessoa_Fisica(id_pf)
);

CREATE TABLE servico (
  id_ser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  valor_ser DOUBLE NOT NULL,
  tempo_estiamdo_ser TIME,
  garantia_ser INT,
  id_tip_fk INT,
  FOREIGN KEY (id_tip_fk) REFERENCES Tipo_Servico(id_tip)
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

CREATE TABLE cliente_venda (
  id_cli INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_vei_fk INT NOT NULL,
  id_pj_fk INT,
  id_pf_fk INT,
  FOREIGN KEY (id_vei_fk) REFERENCES Veiculo(id_vei),
  FOREIGN KEY (id_pj_fk) REFERENCES Pessoa_Juridica(id_pj),
  FOREIGN KEY (id_pf_fk) REFERENCES Pessoa_Fisica(id_pf)
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
  total_ven VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_cai_fk) REFERENCES Caixa(id_cai),
  FOREIGN KEY (id_cli_fk) REFERENCES Cliente_Venda(id_cli),
  FOREIGN KEY (id_fun_fk) REFERENCES Funcionario(id_fun)
);

CREATE TABLE servico_Venda (
  id_ser_ven VARCHAR(45) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  id_ser_fk INT NOT NULL,
  unidade_ser_ven VARCHAR(45) NOT NULL,
  quantidade_ser_ven INT,
  valor_total_ser_ven DOUBLE NOT NULL,
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven),
  FOREIGN KEY (id_ser_fk) REFERENCES Servico(id_ser)
);

CREATE TABLE venda_a_prazo (
  id_venp INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  forma_pagamento_venp TINYINT NOT NULL,
  tipo_venp VARCHAR(45) NOT NULL,
  parcela_venp INT NOT NULL,
  id_enc_fk INT NOT NULL,
  emissao_venp VARCHAR(45) NOT NULL,
  observacao_venp VARCHAR(45),
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven),
  FOREIGN KEY (id_enc_fk) REFERENCES Encargo_Bancario(id_enc)
);

CREATE TABLE recebimento (
  id_rec VARCHAR(45) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_venp_fk INT NOT NULL,
  data_rec DATE NOT NULL,
  hora_rec TIME NOT NULL,
  tipo_rec VARCHAR(45),
  FOREIGN KEY (id_venp_fk) REFERENCES Venda_a_Prazo(id_venp)
);

CREATE TABLE venda_a_vista (
  id_venv INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_ven_fk INT NOT NULL,
  tipo_venv VARCHAR(45) NOT NULL,
  emissao_venv VARCHAR(45) NOT NULL,
  observacao VARCHAR(45),
  FOREIGN KEY (id_ven_fk) REFERENCES Venda(id_ven)
);

CREATE TABLE recebimento_avulso (
  id_avu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_avu DATE NOT NULL,
  hora_avu TIME NOT NULL,
  id_cai_fk INT NOT NULL,
  valor_avu VARCHAR(45) NOT NULL,
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
  `id_pj-fk` INT NOT NULL,
  descricao_des VARCHAR(45) NOT NULL,
  valor_des DOUBLE NOT NULL,
  vencimento_des DATE NOT NULL,
  FOREIGN KEY (`id_pj-fk`) REFERENCES Pessoa_Juridica(id_pj)
);

CREATE TABLE pagamento (
  id_pag VARCHAR(45) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_des_fk INT NOT NULL,
  id_cai_fk INT NOT NULL,
  id_pla_fk INT NOT NULL,
  status TINYINT NOT NULL,
  FOREIGN KEY (id_des_fk) REFERENCES Despesa(id_des),
  FOREIGN KEY (id_cai_fk) REFERENCES Caixa(id_cai),
  FOREIGN KEY (id_pla_fk) REFERENCES Plano_de_Contas(id_pla)
);