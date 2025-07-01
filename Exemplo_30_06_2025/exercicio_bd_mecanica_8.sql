/*# Implemente a ideia apresentada no slide
anterior:
 Crie um procedimento para inserir um novo
Itens_Venda. Nesse procedimento faça a
verificação de estoque, caso tenha estoque faz o
INSERT e informe o usuário. Caso não tenha
informe o usuário sobre a falta de estoque;
 Crie um gatilho para identificar o INSERT em
Itens_Venda e fazer a baixa do estoque;
*/
#Gatilho para baixar estoque do produto

delimiter $$
create trigger baixar_produto_atualizar_venda after insert on 
itens_venda for each row
begin
	#exercicio I
	update produto set
		quant_prod = quant_prod - new.quant_itv
	where
	(id_prod = new.id_prod_fk);
    
    #Exercicio II
	update venda set
		valor_total_vend = valor_total_vend + (new.quant_itv*new.valor_itv)
	where
	(id_vend = new.id_vend_fk);
end;
$$ delimiter ;

delimiter $$
create procedure inserir_item(quantidade int, valor float, produto int, venda int)
begin
declare estoque int;
set estoque = (select quant_prod from produto where (id_prod = produto));
if(quantidade <= estoque)then
	insert into itens_venda values (null, quantidade,valor,produto,venda);
    select 'Item adicionado na venda!' as confirmação;
else
	select concat('Estoque do produto #',produto,  ' indisponível! Quantidade Disponível: ', estoque) as alerta;
end if;

end;
$$ delimiter ;

call inserir_item(100,1000,10,3);

#Desafio Jackson

delimiter $$
create trigger atualizar_produto_venda after delete on 
itens_venda for each row
begin
	update produto set
		quant_prod = quant_prod + old.quant_itv
	where
	(id_prod = old.id_prod_fk);
    
	update venda set
		valor_total_vend = valor_total_vend - (old.quant_itv*old.valor_itv)
	where
	(id_vend = old.id_vend_fk);
end;
$$ delimiter

delimiter $$
create procedure excluir_item(item int)
begin
delete from itens_venda where (id_itv = item);
end;
$$ delimiter ;

call excluir_item(10);

/*
Crie um gatilho para positivar o estoque do PRODUTO
após ele ser inserido na tabela Itens_Compra;
a) Atualize a quant_prod na tabela PRODUTO,
aumentando o estoque do produto de acordo o
quant_itc informada;
b) Atualize o valor_prod da tabela PRODUTO, de
acordo com o valor_itc, adicionando um lucro de 40%
em cima do valor do produto comprado;
c) Atualize o valor_total_comp da tabela Compra de
acordo com os itens inseridos na tabela Itens_compra
*/

delimiter $$
create trigger atualizar_produto_compra after insert on 
itens_compra for each row
begin

update produto set quant_prod = quant_prod + new.quant_itc where (id_prod = new.id_prod_fk);

update produto set valor_prod = new.valor_itc * 1.4 where (id_prod = new.id_prod_fk);

update compra set valor_total_comp = valor_total_comp + (new.valor_itc*quant_itc) where (id_comp = new.id_comp_fk);
end;
$$ delimiter ;

#Inserir itens compra

create pricedure 