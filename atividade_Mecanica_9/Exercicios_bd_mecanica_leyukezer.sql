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
# 4. Selecione a data e o valor da Compra, razão social do Fornecedor e os nomes, quantidade e valor dos Produtos comprados no ano de 2023. Você também deverá adicionar colunas na consulta que retorne a média e a soma dos valores de compras e a média, soma, máximo e mínimo da quantidade e do valor pago nos itens da compra (produtos). Ordem pelo nome do fornecedor.
# 5. Selecione a data e o valor da Venda, nome do Cliente e os nomes, quantidade e valor dos Produtos vendidos no ano de 2023 e 2022. Você também deverá adicionar colunas na consulta que retorne a média e a soma dos valores de vendas e a média, soma, máximo e mínimo da quantidade e do valor pago nos itens da venda (produtos). Ordem pelo nome do cliente.
# 6. Selecione o código, a data, o valor e a forma de pagamento dos Pagamentos, o id, status e a data do Caixa, o nome do Funcionário e a descrição, data de vencimento e o valor da Despesa. Você também deverá adicionar uma coluna na consulta que retorne o valor médio, máximo, mínimo e a soma dos pagamentos. Você não poderá mostrar pagamento referentes a Compras.
# 7. Selecione o nome fantasia e o CNPJ do Fornecedor, assim como a quantidade, valor médio e a soma do valor total das Compras que ele participou. Você deverá garantir que todos os fornecedores sejam listados independente de terem relação com compra. Ordene de forma decrescente pela soma das compras.
# 8. Selecione nome e o CPF do Cliente, assim como a quantidade, valor médio e a soma do valor total das Vendas que ele participou. Você deverá garantir que todos as vendas sejam listadas independente de terem relação com cliente. Ordene pelo nome do cliente. Adicione uma condição para mostrar somente as vendas com status de recebimento “Pago”.
# 9. Selecione o nome e o CPF do Cliente, descricao do Produto, quantidade do item e valor total do item que o cliente comprou durante o ano 2023. Saiba que valor total do item corresponde a valor do item * quantidade do item que foi vendido.
# 10. Selecione o nome do Funcionário, os dados do Caixa e a soma total dos recebimentos que aconteceram no caixa.
# 11. Crie visões para cada uma das consultas. Depois, para cada consulta, crie um código de uso da visão com pelo menos duas condições.
