# Aluno: Leyukezer Cruz de Lima

#ATIVIDADE Banco de Dados da Mecanica 9.0

use bd_mecanica_9;

# 1. Selecione o nome, cpf, renda, data de nascimento, nome do Sexo, dados do Endereço, nome da Cidade e nome do Estado dos Clientes com renda entre mil e 20 mil reais e nascidos entre 1950 e 1999 e que sejam do sexo Masculino e que moram em endereços do tipo “Rua” ou “Avenida”. Você também deverá adicionar uma coluna na consulta que retorne o valor médio das compras dos clientes. Por fim ordene pelo nome do cliente.
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
concat('R$ ', format(cliente.renda_familiar_cli, 2, 'pt-BR')) as renda,
cliente.data_nascimento_cli as data_nascimento,
sexo.nome_sex as sexo,
concat(endereco.rua_end,', ', endereco.numero_end,' - ', endereco.bairro_end) as endereco,
cidade.nome_cid as cidade,
estado.nome_est as estado,
concat('R$ ', format((select avg(venda.valor_total_vend) from venda where (venda.id_cli_fk = cliente.id_cli)), 2, 'pt-BR')) as media_compras
from
cliente inner join sexo on (sexo.id_sex = cliente.id_sex_fk)
inner join endereco on (endereco.id_end = cliente.id_end_fk)
inner join cidade on (cidade.id_cid = endereco.id_cid_fk)
inner join estado on (estado.id_est = cidade.id_est_fk)
where
((cliente.renda_familiar_cli between 1000 and 20000)and(year(cliente.data_nascimento_cli) between 1950 and 1999) and (sexo.id_sex = 1)and((endereco.rua_end like "rua%")or(endereco.rua_end like "av%")))
order by
cliente.nome_cli;

# 2. Selecione o nome, cpf, função, nome do Sexo, dados do Endereço, nome da Cidade, nome do Estado e nome do Departamento dos Funcionários com salário superior a 1 mil reais e 
# que possuam sobrenome “silva” ou “santos” ou “souza” e que sejam nascidos após a década de 70 e que morem em estados da região “Norte” e “Sul” e “Sudeste”. 
# Você também deverá adicionar uma coluna na consulta que retorne a média das vendas realizadas pelos funcionários. Por fim ordene pelo nome do cliente. Por fim ordene pelo nome do funcionário.
select
funcionario.nome_func  as nome,
funcionario.cpf_func as cpf,
cargo.nome_carg as funcao,
sexo.nome_sex as sexo,
concat(endereco.rua_end,', ', endereco.numero_end,' - ', endereco.bairro_end) as endereco,
cidade.nome_cid as cidade,
estado.nome_est as estado,
departamento.nome_dep as departamento,
concat('R$ ', format((select avg(venda.valor_total_vend) from venda where (venda.id_func_fk = funcionario.id_func)), 2, 'pt-BR')) as media_vendas
from
funcionario inner join cargo on (cargo.id_carg = funcionario.id_carg_fk)
inner join sexo on (sexo.id_sex = funcionario.id_sex_fk)
inner join endereco on (endereco.id_end = funcionario.id_end_fk)
inner join departamento on (departamento.id_dep = funcionario.id_dep_fk)
inner join cidade on (cidade.id_cid = endereco.id_cid_fk)
inner join estado on (estado.id_est = cidade.id_est_fk)
where
((funcionario.salario_func > 1000)and ((funcionario.nome_func like "%silva%")or(funcionario.nome_func like "%santos%")or(funcionario.nome_func like "%souza%")) and (year(funcionario.data_nascimento_func)>1970) and ((estado.regiao_est like "norte")or(estado.regiao_est like "sul")or(estado.regiao_est like "sudeste")))
order by
funcionario.nome_func;

# 3. Selecione o nome do Cliente e os dados dos seus Carros. Você deverá garantir que todos os clientes sejam mostrados independente de terem carro ou não. Crie uma condição para mostrar somente carros com motorização 1.0 e com 4 portas. Ordene pelo modelo do carro.
select
cliente.nome_cli as nome,
carro.modelo_car as carro,
carro.cor_car as cor,
carro.marca_car as marca,
carro.placa_car as placa,
carro.portas_car as portas
from
cliente left join carro on (carro.id_cli_fk = cliente.id_cli)
where
((carro.modelo_car like "%1.0") and (carro.portas_car like "4%"))
order by
carro.modelo_car;


# 4. Selecione a data e o valor da Compra, razão social do Fornecedor e os nomes, quantidade e valor dos Produtos comprados no ano de 2023. 
# Você também deverá adicionar colunas na consulta que retorne a média e a soma dos valores de compras e a média, soma, máximo e mínimo da quantidade e do valor pago nos itens da compra (produtos). Ordem pelo nome do fornecedor.
select
compra.data_comp as data_compra,
concat('R$ ',format(compra.valor_total_comp, 2, 'pt-BR')) as valor_compra,
fornecedor.razao_social_forn as fornecedor,
fornecedor.nome_fantasia_forn as nome_fornecedor,
fornecedor.representante_forn as representante,
concat('R$ ',format((select avg(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)), 2, 'pt-BR')) as media_compras,
concat('R$ ',format((select sum(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)),2,'pt-BR')) as total_compras,
concat('R$ ',format((select avg(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)),2,'pt-BR')) as media_valor,
concat('R$ ',format((select sum(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)), 2, 'pr-BR')) as total_valor,
concat('R$ ',format((select max(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)), 2, 'pt-BR')) as maior_valor_itens,
concat('R$ ',format((select min(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)), 2, 'pt-BR')) as menor_valor_itens,
format((select avg(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)), 0, 'pt-BR') as media_itens,
(select sum(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as total_itens,
(select max(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as maior_quantidade_itens,
(select min(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as menor_quantidade_itens
from
compra inner join fornecedor on (fornecedor.id_forn = compra.id_forn_fk)
where
(year(compra.data_comp) = 2023)
order by
fornecedor.nome_fantasia_forn;

# 5. Selecione a data e o valor da Venda, nome do Cliente e os nomes, quantidade e valor dos Produtos vendidos no ano de 2023 e 2022. 
# Você também deverá adicionar colunas na consulta que retorne a média e a soma dos valores de vendas e a média, soma, máximo e mínimo da quantidade e do valor pago nos itens da venda (produtos). Ordem pelo nome do cliente.
select
venda.data_vend as data_venda,
concat('R$ ', format(venda.valor_total_vend, 2, 'pt-BR')) as total_venda,
cliente.nome_cli as cliente,
produto.descricao_prod as produto,
itens_venda.quant_itv as quantidade,
concat('R$ ', format(itens_venda.valor_itv, 2, 'pt-BR')) as valor,
concat('R$ ', format((select avg(venda.valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)), 2, 'pt-BR')) as media_venda,
concat('R$ ', format((select sum(venda.valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)), 2, 'pt-BR')) as soma_venda,
concat('R$ ', format((select avg(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)), 2, 'pt-BR')) as media_valor_itens,
concat('R$ ', format((select sum(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)), 2, 'pt-BR')) as soma_valor_itens,
concat('R$ ', format((select max(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)), 2, 'pt-BR')) as valor_maximo_itens,
concat('R$ ', format((select min(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)), 2, 'pt-BR')) as valor_minimo_itens
from
venda inner join cliente on (venda.id_cli_fk = cliente.id_cli)
inner join itens_venda on (itens_venda.id_vend_fk = venda.id_vend)
inner join produto on (itens_venda.id_prod_fk = produto.id_prod)
where
(year(venda.data_vend)between 2022 and 2023)
order by
cliente.nome_cli;

# 6. Selecione o código, a data, o valor e a forma de pagamento dos Pagamentos, o id, status e a data do Caixa, o nome do Funcionário e a descrição, data de vencimento e o valor da Despesa. 
# Você também deverá adicionar uma coluna na consulta que retorne o valor médio, máximo, mínimo e a soma dos pagamentos. Você não poderá mostrar pagamento referentes a Compras.
select
pagamento.id_pag as codigo,
pagamento.data_pagamento_pag as data_pagamento,
pagamento.data_vencimento_pag as data_vencimento,
concat('R$ ', format(pagamento.valor_pag, 2, 'pt-BR')) as valor_pago,
pagamento.forma_pagamento_pag as forma_pagamento,
caixa.id_cai as caixa,
caixa.status_cai as status_caixa,
caixa.data_abertura_cai as data_caixa,
funcionario.nome_func as funcionario,
despesa.descricao_desp as despesa,
pagamento.data_vencimento_pag as vencimento,
concat('R$ ', format(despesa.valor_desp, 2, 'pt-BR')) as valor_despesa,
concat('R$ ', format((select avg(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR')) as media_pagamento,
concat('R$ ', format((select max(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR')) as pagamento_maximo,
concat('R$ ', format((select min(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR')) as pagamento_minimo,
concat('R$ ', format((select sum(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR')) as total_pagamento
from
pagamento inner join caixa on (pagamento.id_cai_fk = caixa.id_cai)
inner join funcionario on (pagamento.id_func_fk = funcionario.id_func)
inner join despesa on (pagamento.id_desp_fk = despesa.id_desp);

# 7. Selecione o nome fantasia e o CNPJ do Fornecedor, assim como a quantidade, valor médio e a soma do valor total das Compras que ele participou. 
# Você deverá garantir que todos os fornecedores sejam listados independente de terem relação com compra. Ordene de forma decrescente pela soma das compras.
select
fornecedor.nome_fantasia_forn as nome_fantasia,
(select count(*) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as quantidade_compras,
concat('R$ ', format((select avg(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)),2, 'pt-BR')) as  media_compra,
concat('R$ ', format((select sum(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)),2, 'pt-BR')) as  total_compra
from
fornecedor 
order by
(select sum(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)) desc;

# 8. Selecione nome e o CPF do Cliente, assim como a quantidade, valor médio e a soma do valor total das Vendas que ele participou.
# Você deverá garantir que todos as vendas sejam listadas independente de terem relação com cliente. Ordene pelo nome do cliente. Adicione uma condição para mostrar somente as vendas com status de recebimento “Pago”.
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
(select count(*) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')) as quantidade_compras,
concat('R$ ', format((select avg(venda.valor_total_vend) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')), 2, 'pt-BR')) as media_compras,
concat('R$ ', format((select sum(venda.valor_total_vend) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')), 2, 'pt-BR')) as total_compras
from cliente
order by
cliente.nome_cli;

# 9. Selecione o nome e o CPF do Cliente, descricao do Produto, quantidade do item e valor total do item que o cliente comprou durante o ano 2023. Saiba que valor total do item corresponde a valor do item * quantidade do item que foi vendido.
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
produto.descricao_prod as produto,
itens_venda.quant_itv as quantidade_produto,
concat('R$ ',format((itens_venda.quant_itv*itens_venda.valor_itv), 2, 'pt-BR')) as total
from 
cliente inner join venda on (venda.id_cli_fk = cliente.id_cli) 
inner join itens_venda on (itens_venda.id_vend_fk = venda.id_vend)
inner join produto on (itens_venda.id_prod_fk = produto.id_prod)
where
(year(venda.data_vend) = 2023);

# 10. Selecione o nome do Funcionário, os dados do Caixa e a soma total dos recebimentos que aconteceram no caixa.
select
funcionario.nome_func as funcionario,
caixa.id_cai as caixa,
caixa.data_abertura_cai as aberto_dia,
caixa.data_fechamento_cai as fechado_dia,
concat('R$ ', format(caixa.saldo_inicial_cai, 2, 'pt-BR')) as saldo_abertura,
concat('R$ ', format(caixa.troco_cai, 2, 'pt-BR')) as troco,
concat('R$ ', format(caixa.valor_creditos_cai, 2, 'pt-BR')) as credito_caixa,
concat('R$ ', format(caixa.valor_debitos_cai, 2, 'pt-BR')) as debito_caixa,
concat('R$ ', format(caixa.saldo_final_cai, 2, 'pt-BR')) as saldo_fechamento,
caixa.status_cai as status_caixa,
(select sum(recebimento.valor_rec) from recebimento where ((recebimento.id_cai_fk = caixa.id_cai))) as total_recebimento
from
caixa, funcionario, recebimento
where
((recebimento.id_cai_fk = caixa.id_cai) and (recebimento.id_func_fk = funcionario.id_func));

# 11. Crie visões para cada uma das consultas. Depois, para cada consulta, crie um código de uso da visão com pelo menos duas condições.

-- View Exercicio 1
create view vendas_clientes_baixa_renda as 
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
cliente.renda_familiar_cli as renda,
cliente.data_nascimento_cli as data_nascimento,
sexo.nome_sex as sexo,
concat(endereco.rua_end,', ', endereco.numero_end,' - ', endereco.bairro_end) as endereco,
cidade.nome_cid as cidade,
estado.nome_est as estado,
(select avg(venda.valor_total_vend) from venda where (venda.id_cli_fk = cliente.id_cli)) as media_compras
from
cliente inner join sexo on (sexo.id_sex = cliente.id_sex_fk)
inner join endereco on (endereco.id_end = cliente.id_end_fk)
inner join cidade on (cidade.id_cid = endereco.id_cid_fk)
inner join estado on (estado.id_est = cidade.id_est_fk)
where
((cliente.renda_familiar_cli between 1000 and 20000)and(year(cliente.data_nascimento_cli) between 1950 and 1999) and (sexo.id_sex = 1)and((endereco.rua_end like "rua%")or(endereco.rua_end like "av%")))
order by
cliente.nome_cli;

select * from vendas_clientes_baixa_renda where ((vendas_clientes_baixa_renda.renda < 6000) and (endereco like "rua%"));

-- View Exercicio 2
create view funcionarios_regiao_norte_sul_sudeste as
select
funcionario.nome_func  as nome,
funcionario.cpf_func as cpf,
cargo.nome_carg as funcao,
sexo.nome_sex as sexo,
concat(endereco.rua_end,', ', endereco.numero_end,' - ', endereco.bairro_end) as endereco,
cidade.nome_cid as cidade,
estado.nome_est as estado,
departamento.nome_dep as departamento,
(select avg(venda.valor_total_vend) from venda where (venda.id_func_fk = funcionario.id_func)) as media_vendas
from
funcionario inner join cargo on (cargo.id_carg = funcionario.id_carg_fk)
inner join sexo on (sexo.id_sex = funcionario.id_sex_fk)
inner join endereco on (endereco.id_end = funcionario.id_end_fk)
inner join departamento on (departamento.id_dep = funcionario.id_dep_fk)
inner join cidade on (cidade.id_cid = endereco.id_cid_fk)
inner join estado on (estado.id_est = cidade.id_est_fk)
where
((funcionario.salario_func > 1000)and ((funcionario.nome_func like "%silva%")or(funcionario.nome_func like "%santos%")or(funcionario.nome_func like "%souza%")) and (year(funcionario.data_nascimento_func)>1970) and ((estado.regiao_est like "norte")or(estado.regiao_est like "sul")or(estado.regiao_est like "sudeste")))
order by
funcionario.nome_func;

select * from funcionarios_regiao_norte_sul_sudeste where ((endereco like "av.%")and(departamento like 'financeiro'));

-- View Exercicio 3
create view carros_cliente as
select
cliente.nome_cli as nome,
carro.modelo_car as carro,
carro.cor_car as cor,
carro.marca_car as marca,
carro.placa_car as placa,
carro.portas_car as portas
from
cliente left join carro on (carro.id_cli_fk = cliente.id_cli)
where
((carro.modelo_car like "%1.0") and (carro.portas_car like "4%"))
order by
carro.modelo_car;

select * from carros_cliente where ((nome like 't%') and (cor like 'azul') );

-- View Exercicio 4
create view compras_2023 as
select
compra.data_comp as data_compra,
compra.valor_total_comp as valor_compra,
fornecedor.razao_social_forn as fornecedor,
fornecedor.nome_fantasia_forn as nome_fornecedor,
fornecedor.representante_forn as representante,
(select avg(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as media_compras,
(select sum(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as total_compras,
(select avg(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as media_valor,
(select sum(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as total_valor,
(select max(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as maior_valor_itens,
(select min(itens_compra.valor_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp))as menor_valor_itens,
format((select avg(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)), 0, 'pt-BR') as media_itens,
(select sum(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as total_itens,
(select max(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as maior_quantidade_itens,
(select min(itens_compra.quant_itc) from itens_compra where (itens_compra.id_comp_fk = compra.id_comp)) as menor_quantidade_itens
from
compra inner join fornecedor on (fornecedor.id_forn = compra.id_forn_fk)
where
(year(compra.data_comp) = 2023)
order by
fornecedor.nome_fantasia_forn;

select * from compras_2023 where ((maior_valor_itens < 30)and(nome_fornecedor like 'fiat'));

-- View Exercicio 5
create view  vendas_2022_2023 as
select
venda.data_vend as data_venda,
venda.valor_total_vend as total_venda,
cliente.nome_cli as cliente,
produto.descricao_prod as produto,
itens_venda.quant_itv as quantidade,
itens_venda.valor_itv as valor,
(select avg(venda.valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)) as media_venda,
(select sum(venda.valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)) as soma_venda,
(select avg(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)) as media_valor_itens,
(select sum(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)) as soma_valor_itens,
(select max(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)) as valor_maximo_itens,
(select min(itens_venda.valor_itv) from itens_venda where (itens_venda.id_vend_fk = venda.id_vend)) as valor_minimo_itens
from
venda inner join cliente on (venda.id_cli_fk = cliente.id_cli)
inner join itens_venda on (itens_venda.id_vend_fk = venda.id_vend)
inner join produto on (itens_venda.id_prod_fk = produto.id_prod)
where
(year(venda.data_vend)between 2022 and 2023)
order by
cliente.nome_cli;

select * from vendas_2022_2023 where ((cliente like 'c%')and(quantidade<7));

-- View Exercicio 6
create view pagamento_despesas as
select
pagamento.id_pag as codigo,
pagamento.data_pagamento_pag as data_pagamento,
pagamento.data_vencimento_pag as data_vencimento,
format(pagamento.valor_pag, 2, 'pt-BR') as valor_pago,
pagamento.forma_pagamento_pag as forma_pagamento,
caixa.id_cai as caixa,
caixa.status_cai as status_caixa,
caixa.data_abertura_cai as data_caixa,
funcionario.nome_func as funcionario,
despesa.descricao_desp as despesa,
pagamento.data_vencimento_pag as vencimento,
format(despesa.valor_desp, 2, 'pt-BR') as valor_despesa,
format((select avg(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR') as media_pagamento,
format((select max(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR') as pagamento_maximo,
format((select min(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR') as pagamento_minimo,
format((select sum(pagamento.valor_pag) from pagamento where ((pagamento.id_comp_fk is null) and (pagamento.id_func_fk = funcionario.id_func))), 2, 'pt-BR') as total_pagamento
from
pagamento inner join caixa on (pagamento.id_cai_fk = caixa.id_cai)
inner join funcionario on (pagamento.id_func_fk = funcionario.id_func)
inner join despesa on (pagamento.id_desp_fk = despesa.id_desp);

select * from pagamento_despesas where ((valor_pago > 100) and (forma_pagamento like 'dinheiro'));

-- View Exercicio 7
create view compras_fornecedor as
select
fornecedor.nome_fantasia_forn as nome_fantasia,
(select count(*) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as quantidade_compras,
(select avg(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as  media_compra,
(select sum(compra.valor_total_comp) from compra where (compra.id_forn_fk = fornecedor.id_forn)) as  total_compra
from
fornecedor 
order by
total_compra desc;

select * from compras_fornecedor where ((quantidade_compras >= 1) and (total_compra > 10000));

-- View Exercicio 8
create view vendas_clientes as 
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
(select count(*) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')) as quantidade_compras,
(select avg(venda.valor_total_vend) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')) as media_compras,
(select sum(venda.valor_total_vend) from venda, recebimento where (venda.id_cli_fk = cliente.id_cli)and (recebimento.id_vend_fk = venda.id_vend) and(recebimento.status_rec like 'Pago')) as total_compras
from cliente
order by
cliente.nome_cli;

select * from vendas_clientes where ((media_compras is not null)and(total_compras > 1000));

-- View Exercicio 9
create view produtos_cliente_2023 as
select
cliente.nome_cli as nome,
cliente.cpf_cli as cpf,
produto.descricao_prod as produto,
itens_venda.quant_itv as quantidade_produto,
(itens_venda.quant_itv*itens_venda.valor_itv) as total
from 
cliente inner join venda on (venda.id_cli_fk = cliente.id_cli) 
inner join itens_venda on (itens_venda.id_vend_fk = venda.id_vend)
inner join produto on (itens_venda.id_prod_fk = produto.id_prod)
where
(year(venda.data_vend) = 2023);

select * from produtos_cliente_2023 where ((quantidade_produto < 10)and(total < 100));

-- View Exercicio 10
create view recebimento_caixa_funcionario as 
select
funcionario.nome_func as funcionario,
caixa.id_cai as caixa,
caixa.data_abertura_cai as aberto_dia,
caixa.data_fechamento_cai as fechado_dia,
caixa.saldo_inicial_cai as saldo_abertura,
caixa.troco_cai as troco,
caixa.valor_creditos_cai as credito_caixa,
caixa.valor_debitos_cai as debito_caixa,
caixa.saldo_final_cai as saldo_fechamento,
caixa.status_cai as status_caixa,
(select sum(recebimento.valor_rec) from recebimento where ((recebimento.id_cai_fk = caixa.id_cai))) as total_recebimento
from
caixa, funcionario, recebimento
where
((recebimento.id_cai_fk = caixa.id_cai) and (recebimento.id_func_fk = funcionario.id_func));

select * from recebimento_caixa_funcionario where ((troco > 100 )and(credito_caixa < 600));