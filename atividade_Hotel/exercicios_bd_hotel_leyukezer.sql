#Aluno Leyukezer Cruz
#Banco de Dados para Hotel com regras de negócio:
#1. Uma hospedagem por quarto. Caso o hospede mude de quarto, uma nova hospedagem deve ser realizada.
#2. Somente um hospede é registrado na hospedagem.

Use BD_Hotel_6;

# EXERCÍCIOS

#1 Liste o nome do cliente e a quantidade total de hospedagens que ele realizou, usando uma subconsulta para contar as hospedagens. 
select
hospede.nome_hos as nome,
(select count(*) from hospedagem where (hospedagem.id_hos_fk = hospede.id_hos)) as total_hospedagem
from
hospede
order by
total_hospedagem desc;

#2 Mostre o nome e o CPF do cliente e a última data (subconsulta) em que ele realizou o check-in em uma hospedagem.
select
hospede.nome_hos as nome,
hospede.cpf_hos as cpf,
date_format((select max(hospedagem.data_checkin_hosp) from hospedagem where (hospedagem.id_hos_fk = hospede.id_hos)),'%d/%m/%Y') as ultimo_checkin
from
hospede
order by
ultimo_checkin desc;

#3 Selecione o número do quarto e a quantidade total de hospedagens feitas no quarto. 
select
quarto.numero_qua as numero,
(select count(hospedagem.id_qua_fk) from hospedagem where (hospedagem.id_qua_fk = quarto.id_qua)) as total_hospedagem
from
quarto
order by
total_hospedagem desc;

#4 Selecione o nome do cliente, a soma de produtos vendidos para ele e a soma de serviços vendidos para ele. 
select
hospede.nome_hos as nome,
(select venda.valor_produtos_ven from venda where(venda.id_hosp_fk = hospedagem.id_hosp)) as total_produtos,
(select venda.valor_servicos_ven from venda where(venda.id_hosp_fk = hospedagem.id_hosp)) as total_servicos
from
hospede left join hospedagem on (hospede.id_hos = hospedagem.id_hos_fk)
order by
total_produtos desc;

#5 Liste os números dos quartos e a quantidade de vezes que o mesmo já foi usado em uma hospedagem. 
select
quarto.numero_qua as numero,
(select count(*) from hospedagem where (hospedagem.id_qua_fk = quarto.id_qua)) as quant_hospedagem
from
quarto
order by
quant_hospedagem desc;


#6 Mostre os dados da hospedagem e os dados da venda gerada para ela. 
select
hospedagem.data_checkin_hosp as data_chekin,
hospedagem.hora_checkin_hop as hora_chekin,
hospedagem.data_checkout_hosp as data_checkout,
hospedagem.hora_checkout_hosp as hora_checkout,
hospedagem.status_hosp as status_hospedagem,
hospede.nome_hos as hospede,
quarto.numero_qua as quarto,
(select venda.valor_hospedagem_ven from venda where (venda.id_hosp_fk = hospedagem.id_hosp)) as valor_hospedagem,
(select venda.valor_produtos_ven from venda where (venda.id_hosp_fk = hospedagem.id_hosp)) as valor_produto,
(select venda.valor_servicos_ven from venda where (venda.id_hosp_fk = hospedagem.id_hosp)) as valor_servico,
(select venda.valor_total_ven from venda where (venda.id_hosp_fk = hospedagem.id_hosp)) as valor_total
from
hospedagem,hospede,quarto
where
((hospedagem.id_hos_fk = hospede.id_hos)and(hospedagem.id_qua_fk = quarto.id_qua));

#7 Aumente em 15% o valor da diária de todos os quartos que têm uma diária menor que a diária média dos quartos. 
set @media = (select avg(quarto.valor_qua) from quarto);
update
quarto
set
quarto.valor_qua = 1.15 * quarto.valor_qua where (quarto.valor_qua < @media);

#8 Aumente em 20% o valor da diária dos quartos classificados como "luxo", desde que estejam abaixo da média de diárias dos quartos de luxo. 
set @media_luxo = (select avg(quarto.valor_qua) from quarto where (quarto.tipo_qua like 'luxo'));
update
quarto
set
quarto.valor_qua = 1.2 * quarto.valor_qua
where
((quarto.tipo_qua like 'luxo') and (quarto.valor_qua < @media_luxo));

#9 Diminua em 10% o valor da diária dos quartos que nunca foram utilizadas em uma hospedagem.
update
quarto 
set
quarto.valor_qua = quarto.valor_qua - (0.1 * quarto.valor_qua)
where
(quarto.id_qua not in (select id_qua_fk from hospedagem));

#10 Mostre os dados do quarto junto com o total de vezes que o mesmo foi limpo, o valor total de produtos disponíveis no quarto e a quantidade total de produtos disponíveis no quarto.
select
quarto.numero_qua as numero,
quarto.descricao_qua as descricao,
quarto.tipo_qua as tipo,
quarto.valor_qua as diaria,
quarto.andar_qua as andar,
(select count(*) from quarto_servico_limpeza as quarto_limpo where (quarto_limpo.id_qua_fk = quarto.id_qua)) as vezes_limpo,
(select sum(quarto_produto.quant_qpro * produto.valor_pro) from quarto_produto, produto where ((quarto_produto.id_pro_fk = produto.id_pro)and (quarto_produto.id_qua_fk = quarto.id_qua))) as total_produtos,
(select sum(quarto_produto.quant_qpro) from quarto_produto where (quarto_produto.id_qua_fk = quarto.id_qua)) as quantidade_produtos
from
quarto;