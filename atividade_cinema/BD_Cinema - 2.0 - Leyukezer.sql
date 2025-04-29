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
Cliente left join Sexo on (Cliente.id_sex_fk = Sexo.id_sex)
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
funcionario inner join sexo on (funcionario.id_sex_fk = sexo.id_sex)
right join funcao on (funcionario.id_func_fk = funcao.id_func)
where
((funcao.nome_func like "%ar")or(funcao.nome_func like "%or"));

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


#5: Selecione o título, o gênero, a duração e a classificação (nome) dos Filmes. Garanta que todas as classificações sejam mostradas, mesmo aquelas sem relação com filme. Selecione apenas os filmes com diretor informado e duração inferior a 2 horas.

#6: Selecione o número, a fileira, o status e a sala (nome) das Poltronas. Selecione apenas as poltronas com status Livre da fileira inferior a 50.

#7: Selecione a hora de início, a data, a hora do filme, a sala (nome e número) e o filme (título) da Sessão. Selecione apenas as sessões matutinas e noturnas.

#8: Selecione o valor, a data e a sessão (hora do início) do Ingresso. Selecione apenas os ingressos que possuem código de barras com o dígito 01 e com data da sessão iniciada no primeiro semestre de 2021.

#9: Selecione o valor, a hora, a data, a poltrona (número), o ingresso (valor), o funcionário (nome), o cliente (nome) das Vendas. Você deverá garantir que TODOS os clientes sejam listados, mesmo aqueles sem vendas relacionadas. Ordene pelo nome do cliente.

# Exercício 10: Selecione o valor, a data, os produtos_vendidos (quantidade_venda e valor_venda) e o produto (nome) das Vendas.
