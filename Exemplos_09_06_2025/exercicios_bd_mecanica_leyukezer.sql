#Leyukezer cruz
#Exercicio bd_mecanica
use bd_mecanica_9;

#1. Crie e teste um procedimento para cadastrar um novo Produto e garanta que nenhum produto seja inserido com nome repetido;

DELIMITER $$
create procedure inserirProduto(descricao varchar(50), marca varchar(50), quantidade int, valor double, tamanho varchar(50), tipo varchar(50))
begin
declare teste int;

set teste = (select count(*) from produto where descricao_prod like descricao); 

if (teste = 0) then
		insert into produto Values (null, descricao, marca, quantidade, valor,tamanho,tipo);
		select 'O Produto foi cadastrado com sucesso!' as Confirmacao;
else

select 'Produto já cadastrada' as Alerta;

end if;

end;
$$ DELIMITER ;

call inserirProduto('Faro do compass 2023', 'Jeep', 10, 2000, 'Medio', 'Farol');

#2. Crie um procedimento para inserir um novo Cliente e garanta que as chaves estrangeiras informadas realmente existam nas tabelas deorigem.

delimiter $$
create procedure inserirCliente(nome varchar(200), estado_civil varchar(50), cpf varchar(20), rg varchar(30), data_nascimento date, renda_familiar float, telefone varchar(50), celular varchar(50), sexo int, endereco int)
begin
declare testeSexo, testeEndereco, testeNome int;

set testeSexo = (select id_sex from sexo where (id_sex = sexo));

set testeEndereco = (select id_end from endereco where id_end = endereco);

set testeNome = (select count(*) from cliente where nome_cli like nome);

if (testeSexo is not null) then
	if(testeEndereco is not null) then
		insert into cliente values (null, nome, estado_civil, cpf, rg, data_nascimento, renda_familiar, telefone, celular, sexo, endereco);
		select 'Cliente foi Cadastrado com sucesso!' as Confirmação;
    else
		select concat('Endereco #',endereco,' informado não existe') as Alert;
    end if;
else
	select 'Sexo Informado não existe' as Alert;
end if;
end;
$$ delimiter ;

call inserirCliente('Tom Jobim', 'CASADO', '123.123.123-23', '1234058 SSP', '1980-06-21', 5000, null, '(69) 99028-4732', 1,30);

#3.Crie e teste um procedimento para atualizar os dados de um Carro existente, garantindo que todos os atributos sejam preenchidos
delimiter $$
create procedure atualizarCarro(carro int, modelo varchar(100), cor varchar(50), portas varchar(50), placa varchar(50), marca varchar(50), cliente int)
begin
update carro set modelo_car = modelo, cor_car = cor, portas_car = portas, placa_car = placa, marca_car = marca, id_cli_fk = cliente where id_car = carro;
select 'Cliente Atualizado com sucesso!' as Confirmação;
end;
$$ delimiter ;

call atualizarCarro(2, 'Palio 1.0 Turbo', 'Branco', '4 Portas', 'QIO-1298', '', 2);

#4.Crie e teste um procedimento que retorne por uma variável de saída o número total de Clientes cadastrados no sistema da mecanica

delimiter $$
create procedure retornarTotalClientes(out total int)
begin
	set total = (select count(*) from cliente);
	select 'Contagem realizada com sucesso' as Confirmação;
end;
$$ delimiter ;

call retornarTotalClientes(@result);
select @result as Quantidade_Clientes;

#5. Crie e teste um procedimento para inserir um novo item da venda. Porém só permita a inserção se houver estoque no produto de acordo com a quantidade a ser inserida.

delimiter $$
create procedure inserirItem(quantidade float, valor float, produto int, venda int)
begin
declare testeEstoque int;
declare nomeProduto varchar(50);

set testeEstoque = (select quant_prod from produto where (id_prod = produto));

set nomeProduto = (select descricao_prod from produto where (id_prod = produto));

if(testeEstoque > quantidade)then
	insert into itens_venda values (null, quantidade, valor, produto,venda);
    update produto set quant_prod = quant_prod - quantidade where (id_prod = produto);
	select concat('O Item ', nomeProduto,' inserido com sucesso!') as Confirmação;
else
	select concat('O Item ', nomeProduto,' inserido com sucesso!') as Alerta;
end if;
end;
$$ delimiter ;

call inserirItem(5, 10.50, 2, 1);

#6. Crie e teste um procedimento para inserir um novo item na compra. Porém você deverá atualizar o estoque do produto após a inserção. Também
#deverá atualizar o valor do produto, utilizando como base o valor de compra com um adicional de 75%.

delimiter $$
$$ delimiter ;