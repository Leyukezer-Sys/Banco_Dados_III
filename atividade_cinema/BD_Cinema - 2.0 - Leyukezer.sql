#Banco de Dados do Cinema 2.0
# Leyukezer Cruz

use bd_cinema_2;

#EXERCÍCIOS

#1: Selecione o nome, o CPF, o sexo (nome) e o tipo sanguíneo (fator e rh) dos Clientes. Garanta que todos os clientes sejam mostrados, mesmo aqueles sem relação com Sexo ou Tipo Sanguíneo. Selecione apenas os clientes do sexo Masculino e com tipo sanguíneo positivo.
select
Cliente.nome_cli as Nome,
Cliente.cpf_cli as Cpf,
Sexo.nome_sex as Sexo,
Tsa.fator_tsa as Fator,
Tsa.rh_tsa as Rh
from
Cliente 
left join Sexo on (Cliente.id_sex_fk = Sexo.id_sex)
left join Tipo_Sanguineo as Tsa on (Cliente.id_tsa_fk = Tsa.id_tsa)
where
((cliente.id_sex_fk = 1) and (Tsa.rh_tsa = '+'));

#2: Selecione o nome, o CPF, o salário, o sexo (nome) e a função (nome) dos Funcionários. Garanta que todas as funções sejam mostradas, mesmo aquelas sem relação com Funcionário. Selecione apenas os funcionários com o nome da função terminada em 'ar' ou 'or'.
select
funcionario.nome_fun as Nome,
funcionario.cpf_fun as Cpf,
concat("R$ ",format(funcionario.salario_fun,2,'pt-BR')) as Salario,
sexo.nome_sex as Sexo,
funcao.nome_func as Funcao
from
funcionario right join sexo on (funcionario.id_sex_fk = sexo.id_sex)
right join funcao on (funcionario.id_func_fk = funcao.id_func)
where
((funcao.nome_func like "%ar")or(funcao.nome_func like "%or"));

select * from funcao;

#3: Selecione o número, a data, o saldo inicial, o saldo final e o funcionário (nome) dos Caixas. Garanta que todos os funcionários sejam mostrados, mesmo aqueles sem relação com Caixa. Selecione apenas os caixas com saldo final superior a mil reais.
select
caixa.numero_cai as Numero,
date_format(caixa.data_cai, '%d/%m/%Y') as Data_Caixa,
concat('R$ ',format(caixa.saldo_inicial_cai,2,'pt-BR')) as Saldo_Inicial,
concat('R$ ',format(caixa.saldo_final_cai,2,'pt-BR')) as Saldo_Final,
funcionario.nome_fun as Funcionario
from
caixa right join funcionario on (caixa.id_fun_fk = funcionario.id_fun)
where
(caixa.saldo_final_cai > 1000);

#4: Selecione o valor, a data, a parcela, o status, a forma, o caixa (número e data) e despesa (descrição, valor e vencimento) dos Pagamentos. Selecione apenas os pagamentos com status Aberto e com data nos meses 5 ao 10.

select 
concat('R$ ', format(pagamento.valor_pag, 2, 'pt-BR')) as Valor,
date_format(pagamento.data_pag, '%d/%m/%Y') as Data_Pagamento,
pagamento.parcela_pag as Parcela,
pagamento.status_pag as Status_Pagamento,
pagamento.forma_pag as Forma_Pagamento,
caixa.numero_cai as Caixa,
date_format(caixa.data_cai, '%d/%m/%Y') as Data_Caixa,
despesa.descricao_desp as Descricao,
concat('R$ ', format(despesa.valor_desp, 2, 'pt-BR')) as Valor_Despesa,
date_format(despesa.vencimento_desp, '%d/%m/%Y') as Vencimento
from
pagamento inner join caixa on (pagamento.id_cai_fk = caixa.id_cai)
inner join despesa on (despesa.id_desp = pagamento.id_desp_fk)
where
((pagamento.status_pag like "aberto")and(month(pagamento.data_pag) between 5 and 10));

#5: Selecione o título, o gênero, a duração e a classificação (nome) dos Filmes. Garanta que todas as classificações sejam mostradas, mesmo aquelas sem relação com filme. Selecione apenas os filmes com diretor informado e duração inferior a 2 horas.
select
filme.titulo_film as Titulo,
filme.genero_film as Genero,
concat(hour(filme.duracao_film),' hora e ',minute(filme.duracao_film), ' minutos') as Duracao,
classificacao.nome_cla as Classificacao
from
filme right join classificacao on (filme.id_cla_fk = classificacao.id_cla)
where
((filme.diretor_film <> '')and(hour(filme.duracao_film) < 2))
order by 
filme.titulo_film;

#6: Selecione o número, a fileira, o status e a sala (nome) das Poltronas. Selecione apenas as poltronas com status Livre da fileira inferior a 50.
select
poltrona.numero_polt as Numero,
poltrona.fileira_polt as Fileira,
poltrona.status_polt as Status_Poltrona,
sala.nome_sala as Sala
from
poltrona inner join sala on (poltrona.id_sala_fk = sala.id_sala)
where
((poltrona.status_polt like "livre")and(poltrona.fileira_polt < 50));

#7: Selecione a hora de início, a data, a hora do filme, a sala (nome e número) e o filme (título) da Sessão. Selecione apenas as sessões matutinas e noturnas.
select
concat(hour(sessao.hora_inicio_ses), ':', minute(sessao.hora_inicio_ses),'h') as Inicio,
date_format(sessao.data_ses,'%d/%m/%Y') as Data_Sessao,
concat(hour(sessao.hora_fim_ses),':',minute(sessao.hora_fim_ses),'h') as Hora_Filme,
sala.nome_sala as Sala,
sala.numero_sala as Numero,
filme.titulo_film as Filme
from
sessao inner join sala on (sessao.id_sala_fk = sala.id_sala)
inner join filme on (sessao.id_film_fk = filme.id_film)
where
(hour(sessao.hora_inicio_ses) < 12) or (hour(sessao.hora_inicio_ses)> 17);

#8: Selecione o valor, a data e a sessão (hora do início) do Ingresso. Selecione apenas os ingressos que possuem código de barras com o dígito 01 e com data da sessão iniciada no primeiro semestre de 2021.
select
concat('R$ ', format(ingresso.valor_ing, 2, 'pt-BR')) as Valor,
date_format(ingresso.data_ing, '%d/%m/%Y') as Data_Ingresso,
concat(hour(sessao.hora_inicio_ses), ':', minute(sessao.hora_inicio_ses), ' hrs') as Sessao
from
ingresso inner join sessao on (ingresso.id_ses_fk = sessao.id_ses)
where
((ingresso.cod_barras_ing like "%01%") and (month(sessao.data_ses) between 1 and 6) and (year(sessao.data_ses) = 2021));

#9: Selecione o valor, a hora, a data, a poltrona (número), o ingresso (valor), o funcionário (nome), o cliente (nome) das Vendas. Você deverá garantir que TODOS os clientes sejam listados, mesmo aqueles sem vendas relacionadas. Ordene pelo nome do cliente.
select
concat('R$ ',format(venda.valor_vend, 2, 'pt-BR')) as Valor,
concat(hour(venda.hora_vend),':',minute(venda.hora_vend),' hrs') as  Hora,
date_format(venda.data_vend, '%d/%m/%Y') as Data_Venda,
concat('P',poltrona.numero_polt, ' F', poltrona.fileira_polt) as Poltrona,
concat('R$ ', format(ingresso.valor_ing, 2, 'pt-BR')) as Valor,
funcionario.nome_fun as Funcionario,
cliente.nome_cli as Cliente
from
venda inner join poltrona on (venda.id_polt_fk = poltrona.id_polt)
inner join ingresso on (venda.id_ing_fk = ingresso.id_ing)
inner join funcionario on (venda.id_fun_fk = funcionario.id_fun)
right join cliente on (venda.id_cli_fk = cliente.id_cli)
order by
cliente.nome_cli;

#10: Selecione o valor, a data, os produtos_vendidos (quantidade_venda e valor_venda) e o produto (nome) das Vendas.
select
concat('R$ ',format(venda.valor_vend, 2, 'pt-BR')) as Valor,
date_format(venda.data_vend, '%d/%m/%Y') as Data_Venda,
venda_produto.qtd_itens_vend_prod as Quantidade_Venda,
concat('R$ ',format(venda_produto.valor_vend_prod, 2, 'pt-BR')) as Valor_Venda,
produto.nome_prod as Produto
from
venda_produto inner join venda on (venda_produto.id_vend_fk = venda.id_vend)
inner join produto on (venda_produto.id_prod_fk = produto.id_prod);
