#Aluno: Leyukezer Cruz 
#script bd_agenciabancaria - versão 7.0

use bd_leyukezer;
/*
Exercicio 1: Crie um procedimento para inserir um novo depósito de acordo com as seguintes regras:

1) Garanta que os campos obrigatórios sejam preenchidos e que a FK de conta bancária realmente exista.

2) Só permita a inserção se o valor do depósito for MAIOR do que ZERO.

3) Verifique se o depósito é do tipo “Cheque” ou “Dinheiro”. Se for do tipo “Cheque” o valor do depósito não pode ser MAIOR do que 2000 reais. Se for do tipo “Dinheiro” o valor do depósito não pode ser MAIOR do que 5000 reais.

4) Não permita depósitos entre meia noite e 5h da manhã.

5) Garanta que a conta bancária alvo do depósito esteja ativa, ou seja, com a data de encerramento nula.

6) Informe o usuário na mensagem de confirmação se a conta alvodo depósito é do tipo corrente ou poupança;
*/

delimiter $$
create procedure novo_deposito(valor float, data_deposito date, hora time, tipo varchar(100), conta int)
begin
declare count_conta int;
declare data_encerramento date;

set data_encerramento = (select data_encerramento_con from conta_bancaria where (id_con = conta));

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

if (valor <> '' or valor is not null)then
	if (data_deposito is not null)then
		if (hora is not null)then
			if (tipo <> '' or tipo is not null)then
				if (conta <> '' or conta is not null)then
					if(count_conta <> 0)then
						if(hour(hora) > 05)then
							if( data_encerramento is null)then
								insert into deposito values (null, valor, data_deposito, hora, tipo, conta);
                                select concat('O deposito foi cadastrado para a conta do tipo ', (select tipo_con from conta_bancaria where (id_con = conta))) as confirmação;
                            else
								select concat('A conta #', conta, ' esta desativa desde o dia ', (data_encerramento)) as alerta;
							end if;
                        else
							select 'Os horarios permitidos para deposito são das 06h da manhã as 23h da noite' as alerta;
                        end if;
                    else
						select concat('A conta #', conta, ' não esta cadastrada no sistema!') as alerta;
					end if;
				else
					select 'A conta não pode ser vazia/nula!!' as alerta;
				end if;
			else
				select 'O tipo de deposito não pode ser vazio/nulo!!' as alerta;
			end if;
		else
			select 'A hora não pode ser vazia/nula!!' as alerta;
		end if;
	else
		select 'A data não pode ser vazia/nula!!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!!' as alerta;
end if;
end;
$$ delimiter ;

/*
Exercício 2: Crie um gatilho na tabela depósito para somar o valor do depósito no saldo da Conta Corrente do
cliente após a inserção de novo depósito.
Crie um gatilho na tabela depósito para subtrair o valor do depósito no saldo da Conta Corrente do
cliente após a exclusão de um depósito.
TESTE: Chame o procedimento do Exercício 1 e insira 40 depósitos em contas diferentes.
*/

delimiter $$
create trigger somar_deposito after insert on
deposito for each row
begin
	update conta_bancaria set
		saldo_con = saldo_con + new.valor_dep
	where
		id_con = new.id_con_fk;
end;
$$ delimiter ;

delimiter $$
create trigger debitar_deposito after delete on
deposito for each row
begin
	update conta_bancaria set
		saldo_con = saldo_con - old.valor_dep
	where
		id_con = old.id_con_fk;
end;
$$ delimiter ;

call novo_deposito(312.45, '2025-06-03', '06:42:00', 'dinheiro', 17);
call novo_deposito(198.00, '2025-06-12', '22:15:00', 'cheque', 44);
call novo_deposito(425.30, '2025-06-25', '14:08:00', 'dinheiro', 6);
call novo_deposito(150.00, '2025-06-09', '07:33:00', 'cheque', 29);
call novo_deposito(275.75, '2025-06-18', '11:47:00', 'dinheiro', 61);
call novo_deposito(90.00, '2025-06-01', '16:22:00', 'cheque', 18);
call novo_deposito(410.00, '2025-06-14', '13:05:00', 'dinheiro', 3);
call novo_deposito(130.25, '2025-06-22', '06:59:00', 'cheque', 52);
call novo_deposito(500.00, '2025-06-06', '17:10:00', 'dinheiro', 26);
call novo_deposito(210.00, '2025-06-30', '10:45:00', 'cheque', 64);
call novo_deposito(160.00, '2025-06-11', '07:12:00', 'dinheiro', 9);
call novo_deposito(300.00, '2025-06-04', '15:33:00', 'cheque', 38);
call novo_deposito(115.00, '2025-06-27', '06:21:00', 'dinheiro', 21);
call novo_deposito(350.00, '2025-06-15', '14:55:00', 'cheque', 59);
call novo_deposito(190.00, '2025-06-19', '11:03:00', 'dinheiro', 5);
call novo_deposito(275.00, '2025-06-10', '13:40:00', 'cheque', 43);
call novo_deposito(145.00, '2025-06-08', '10:27:00', 'dinheiro', 30);
call novo_deposito(220.00, '2025-06-21', '09:58:00', 'cheque', 14);
call novo_deposito(305.00, '2025-06-05', '12:36:00', 'dinheiro', 66);
call novo_deposito(125.00, '2025-06-28', '16:44:00', 'cheque', 1);
call novo_deposito(400.00, '2025-06-13', '06:03:00', 'dinheiro', 36);
call novo_deposito(95.00, '2025-06-02', '21:29:00', 'cheque', 27);
call novo_deposito(285.00, '2025-06-23', '15:12:00', 'dinheiro', 50);
call novo_deposito(170.00, '2025-06-26', '11:50:00', 'cheque', 11);
call novo_deposito(310.00, '2025-06-07', '10:18:00', 'dinheiro', 63);
call novo_deposito(135.00, '2025-06-29', '09:05:00', 'cheque', 22);
call novo_deposito(260.00, '2025-06-16', '13:17:00', 'dinheiro', 48);
call novo_deposito(100.00, '2025-06-24', '14:30:00', 'cheque', 6);
call novo_deposito(295.00, '2025-06-20', '06:50:00', 'dinheiro', 34);
call novo_deposito(185.00, '2025-06-17', '12:11:00', 'cheque', 17);
call novo_deposito(340.00, '2025-06-30', '16:00:00', 'dinheiro', 55);
call novo_deposito(150.00, '2025-06-03', '10:00:00', 'cheque', 2);
call novo_deposito(420.00, '2025-06-22', '15:45:00', 'dinheiro', 40);
call novo_deposito(110.00, '2025-06-06', '09:39:00', 'cheque', 13);
call novo_deposito(365.00, '2025-06-28', '11:22:00', 'dinheiro', 57);
call novo_deposito(240.00, '2025-06-12', '13:55:00', 'cheque', 32);
call novo_deposito(175.00, '2025-06-09', '08:15:00', 'dinheiro', 24);
call novo_deposito(390.00, '2025-06-25', '22:35:00', 'cheque', 16);
call novo_deposito(155.00, '2025-06-30', '10:10:00', 'dinheiro', 60);

/*
Exercicio 3: Crie um procedimento para inserir um novo Saque de acordo com as
seguinte regras:
1) A tarifa não deve ser recebida pelo procedimento, devendo ser
calculada automaticamente de acordo com as seguintes regras:
i. Se a conta for do tipo Corrente a tarifa é igual a 1,5% do valor sacado;
ii. Se a conta for do tipo Poupança a tarifa é igual a 1% do valor sacado;
2) Garanta que os campos obrigatórios sejam preenchidos e que a FK de
conta bancária realmente exista.
3) Só permita a inserção se houver saldo suficiente na Conta Bancária do
cliente, ou seja, o valor do saque deve ser MENOR ou IGUAL ao valor do
saldo + valor do limite da conta.
4) Não permita saques com valor superior a 3000 reais.
5) Não permita saque entre as 22h e as 6h da manhã.
6) Informe o usuário na mensagem de confirmação qual foi o valor da
tarifa do saque
*/

delimiter $$
create procedure novo_saque(valor float, data_saque date, hora time, local_saque varchar(100), conta int)
begin
declare count_conta int;
declare tarifa float;
declare valor_disponivel float;

if((select count(*) from conta_bancaria where ((id_con = conta) and (tipo_con like '%corrente%'))) <> 0)then
	set tarifa = 0.015 * valor;
else
	set tarifa = 0.01 * valor;
end if;

set valor_disponivel = (select saldo_con from conta_bancaria where (id_con = conta)) + (select valor_limite_con from conta_bancaria where (id_con = conta));

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

if (valor <> '' or valor is not null)then
	if (data_saque is not null)then
		if (hora is not null)then
			if (local_saque <> '' or local_saque is not null)then
				if (conta <> '' or conta is not null)then
					if(count_conta <> 0)then
						if((hour(hora) > 06) and (hour(hora) < 22))then
							if(valor <= 3000)then
								insert into saque values (null, valor, data_saque, hora, local_saque, tarifa, conta);
                                select concat('O saque foi cadastrado para a conta, a tarifa ficou de R$', format((tarifa), 2)) as confirmação;
                            else
								select concat('Não é possivel realizar saques acima de R$3000.00') as alerta;
							end if;
                        else
							select 'Os horarios permitidos para deposito são das 06h da manhã as 23h da noite' as alerta;
                        end if;
                    else
						select concat('A conta #', conta, ' não esta cadastrada no sistema!') as alerta;
					end if;
				else
					select 'A conta não pode ser vazia/nula!!' as alerta;
				end if;
			else
				select 'O local de saque não pode ser vazio/nulo!!' as alerta;
			end if;
		else
			select 'A hora não pode ser vazia/nula!!' as alerta;
		end if;
	else
		select 'A data não pode ser vazia/nula!!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!!' as alerta;
end if;
end;
$$ delimiter ;

/*
Exercicio 4: Crie um gatilho na tabela saque para subtrair o valor do saque no
saldo da Conta Corrente do cliente após a inserção de novo saque
de acordo com as seguintes regra:
1) Caso o saque utilize o valor do limite, você deverá subtrair
primeiro o valor do saque do saldo e a diferença no valor do
limite. Exemplo: “João possui 100 reais de saldo e 500 de limite e
deseja fazer um saque de 300 reais. O sistema deverá zerar o
saldo da conta e subtrair o valor restante (200 reais) do valor do
limite.”
2) Subtraia do saldo (se houver) ou limite (se não houver saldo) o
valor da tarifa. Caso a conta esteja usando o limite, e não for
suficiente para cobrir o valor da tarifa, subtraia o valor do saldo
deixando o mesmo negativo.
Crie um gatilho na tabela saque para somar o valor do saque e o
valor da tarifa no saldo e no valor do limite da conta corrente de
acordo com as regras anteriores após a exclusão de um saque.
TESTE: Chame o procedimento do Exercício 3 e insira 20 saques em
contas diferentes
*/

delimiter $$
create trigger debitar_saque after insert on
saque for each row
begin
	declare debitar_limite float;
    declare saldo_conta float;
    
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = new.id_con_fk));
    
	if((new.valor_saq + new.tarifa_saq) > saldo_conta)then
		set debitar_limite = (new.valor_saq + new.tarifa_saq) - saldo_conta;
        update conta_bancaria set saldo_con = 0, valor_limite_con = valor_limite_con - debitar_limite where (id_con = new.id_con_fk);
	else
        update conta_bancaria set saldo_con = saldo_con - (new.valor_saq + new.tarifa_saq) where (id_con = new.id_con_fk);
    end if;
end;
$$ delimiter ;

delimiter $$
create trigger restituir_saque after delete on
saque for each row
begin
        update conta_bancaria set valor_limite_con = valor_limite_con + (old.valor_saq + old.tarifa_saq) where (id_con = old.id_con_fk);
end;
$$ delimiter ;

call novo_saque(120.50, '2025-06-03', '07:45:00', 'caixa eletrônico', 12);
call novo_saque(250.00, '2025-06-07', '08:30:00', 'aplicativo de pagamento', 33);
call novo_saque(95.75, '2025-06-15', '09:10:00', 'caixa eletrônico', 5);
call novo_saque(310.00, '2025-06-21', '10:25:00', 'aplicativo de pagamento', 48);
call novo_saque(180.00, '2025-06-10', '11:40:00', 'caixa eletrônico', 27);
call novo_saque(220.00, '2025-06-18', '12:55:00', 'aplicativo de pagamento', 61);
call novo_saque(135.00, '2025-06-04', '13:15:00', 'caixa eletrônico', 9);
call novo_saque(400.00, '2025-06-12', '14:05:00', 'aplicativo de pagamento', 36);
call novo_saque(175.25, '2025-06-26', '15:30:00', 'caixa eletrônico', 2);
call novo_saque(90.00, '2025-06-06', '16:45:00', 'aplicativo de pagamento', 44);
call novo_saque(305.00, '2025-06-14', '17:20:00', 'caixa eletrônico', 18);
call novo_saque(150.00, '2025-06-09', '18:10:00', 'aplicativo de pagamento', 53);
call novo_saque(275.00, '2025-06-23', '19:35:00', 'caixa eletrônico', 30);
call novo_saque(125.00, '2025-06-11', '20:50:00', 'aplicativo de pagamento', 7);
call novo_saque(360.00, '2025-06-05', '07:20:00', 'caixa eletrônico', 59);
call novo_saque(200.00, '2025-06-17', '08:55:00', 'aplicativo de pagamento', 14);
call novo_saque(145.00, '2025-06-20', '09:45:00', 'caixa eletrônico', 41);
call novo_saque(330.00, '2025-06-28', '10:30:00', 'aplicativo de pagamento', 22);
call novo_saque(190.00, '2025-06-08', '11:15:00', 'caixa eletrônico', 64);
call novo_saque(285.00, '2025-06-30', '12:00:00', 'aplicativo de pagamento', 16);


/*
Exercício 5: Crie um procedimento para inserir um novo pagamento de acordo
 com as regras a seguir:
 1) Garanta que os campos obrigatórios sejam preenchidos e que a
 FK de conta bancária realmente exista.
 2) Só permita a inserção se houver saldo suficiente na Conta
 Corrente do cliente, ou seja, o valor do pagamento deve ser
 MENOR ou IGUAL ao valor do saldo da conta (saldo + limite).
 3) Só permita pagamentos entre 9h e 18h.
 4) A data e a hora do pagamento não devem ser inseridas na
 chamada, mas sim coletadas do sistema operacional. Com isso,
 verifique se a data do pagamento é superior a data do
 vencimento, caso seja, você deverá adicionar uma tarifa de 5%
 do valor do pagamento.Caso não seja,a tarifa é zerada.
 5) Garanta que o tipo de pagamento possível seja ‘Título’ ou
 ‘Convênio’;
 6) Verifique se código de barras do boleto possui exatamente 10
 caracteres para o tipo ‘Convênio’ e 20 caracteres para o tipo
 ‘Título’;
 7) Garanta que os beneficiários sejam pessoas jurídicas, assim,
 verifica que o nome digitado contem algum dos termos ‘ME’,
 ‘MEI’,‘LTDA’,‘EI’ou‘SA’.
*/

delimiter $$
create procedure novo_pagamento (valor float, tipo varchar(100), data_vencimento date, codigo_barras varchar(300), beneficiario varchar(300), conta int)
begin
declare data_pagamento date;
declare hora time;
declare saldo_limite, tarifa float;
declare count_conta int;

set count_conta = (select count(*) from conta_bancaria where (id_con = conta));

set data_pagamento = curdate();
set hora = curtime();

set saldo_limite = (select (saldo_con+valor_limite_con) from conta_bancaria where (id_con = conta));

if(data_pagamento < data_vencimento)then
	set tarifa = 0;
else
	set tarifa = valor * 0.05;
end if;

if(valor <> '' or valor is not null)then
	if(tipo <> '' or tipo is not null)then
		if(valor <> '' or valor is not null)then
			if( data_vencimento is not null)then
				if(codigo_barras <> '' or codigo_barras is not null)then
					if(beneficiario <> '' or beneficiario is not null)then
						if(count_conta <> 0)then
							if((hour(hora) > 08) and (hour(hora) < 19))then
								if((beneficiario like '%ME%') or (beneficiario like '%MEI%') or (beneficiario like '%LTDA%')or (beneficiario like '%EI%') or (beneficiario like '%SA%'))then
									if(tipo like 'T_tulo')then
										if(length(codigo_barras) = 20)then
											insert into pagamento values(null, valor, data_pagamento, hora, tipo, tarifa, data_vencimento, codigo_barras, beneficiario, conta);
                                            select 'O pagamento foi realizado com sucesso!' as confirmacao;
                                        else
											select 'O código de barras para título está incorreto!' as alerta;
                                        end if;
                                    elseif (tipo like 'Conv_nio') then
										if(length(codigo_barras) = 10)then
											insert into pagamento values(null, valor, data_pagamento, hora, tipo, tarifa, data_vencimento, codigo_barras, beneficiario, conta);
                                            select 'O pagamento foi realizado com sucesso!' as confirmacao;
                                        else
											select 'O código de barras para Convênio está incorreto!' as alerta;
                                        end if;
                                    else
										select 'Os tipos permitidos são Título ou Convênio!' as alerta;
                                    end if;
                                else
									select 'Os beneficiários precisam ser pessoas jurídicas!' as alerta;
                                end if;
                            else
								select 'Só é permitido pagamentos das 9h às 18h' as alerta;
                            end if;
						else
							select concat('A conta #',conta, ' não está cadastrada no sistema!') as alerta;
						end if;
					else
						select 'O beneficiario não pode ser vazio/nulo!' as alerta;
					end if;
				else
					select 'O codigo de barras não pode ser vazio/nulo!' as alerta;
				end if;
			else
				select 'A data de vencimento não pode ser vazio/nulo!' as alerta;
			end if;
		else
			select 'O valor não pode ser vazio/nulo!' as alerta;
		end if;
	else
		select 'O tipo de pagamento não pode ser vazio/nulo!' as alerta;
	end if;
else
	select 'O valor não pode ser vazio/nulo!' as alerta;
end if;

end;
$$ delimiter ;

/*
Exercício 6: Crie um gatilho na tabela pagamento para subtrair o valor do
 pagamento no saldo da Conta Corrente do cliente após a
 inserção de novo pagamento de acordo comas seguintes regra:
 1) Caso o pagamento utilize o valor do limite, você deverá
 subtrair primeiro o valor do pagamento do saldo e a
 diferença no valor do limite. Exemplo: “João possui 100 reais
 de saldo e 500 de limite e deseja fazer um pagamento de 300
 reais. O sistema deverá zerar o saldo da conta e subtrair o
 valor restante (200 reais) do valor do limite.”
 2) Subtraia do saldo (se houver) ou limite (se não houver saldo) o
 valor da tarifa. Caso a conta esteja usando o limite, e não for
 suficiente para cobrir o valor da tarifa, subtraia o valor do
 saldo deixando o mesmo negativo.
 Crie um gatilho na tabela pagamento para somar o valor do
 pagamento e o valor da tarifa no saldo e no valor do limite da
 conta corrente de acordo com as regras anteriores após a
 exclusão de um pagamento.
 TESTE
 : Chame o procedimento do Exercício 7 e insira 10
 pagamentos emcontas diferentes
*/

delimiter $$
create trigger debitar_pagamento after insert on
pagamento for each row
begin
	declare debitar_limite float;
    declare saldo_conta, limite_conta, valor_pagamento float;
    
    set valor_pagamento = (new.valor_pag + new.tarifa_pag);
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = new.id_con_fk));
    set limite_conta = (select valor_limite_con from conta_bancaria where (id_con = new.id_con_fk));
    
	if(valor_pagamento > (saldo_conta+limite_conta))then
		set debitar_limite = valor_pagamento - (saldo_conta+limite_conta);
        update conta_bancaria set saldo_con = 0 - debitar_limite, valor_limite_con = 0 where (id_con = new.id_con_fk);
	elseif(valor_pagamento > saldo_conta)then
		set debitar_limite = valor_pagamento - saldo_conta;
        update conta_bancaria set saldo_con = 0, valor_limite_con = valor_limite_con - debitar_limite where (id_con = new.id_con_fk);
	else
        update conta_bancaria set saldo_con = saldo_con - valor_pagamento where (id_con = new.id_con_fk);
    end if;
end;
$$ delimiter ;

delimiter $$
create trigger restituir_pagamento after delete on
pagamento for each row
begin
	declare saldo_conta, limite_conta, valor_pagamento, restituir float;
    
    set valor_pagamento = (old.valor_pag + old.tarifa_pag);
    set saldo_conta = (select saldo_con from conta_bancaria where (id_con = new.id_con_fk));
	
    if(saldo_conta < 0)then
		set restituir =  saldo_conta + valor_pagamento;
		update conta_bancaria set valor_limite_con = valor_limite_con + restituir where (id_con = old.id_con_fk);
    else
		update conta_bancaria set valor_limite_con = valor_limite_con + valor_pagamento where (id_con = old.id_con_fk);
    end if;
end;
$$ delimiter ;

call novo_pagamento(312.45, 'título', '2025-07-15', '12345678901234567890', 'AlfaTech MEI', 12);
call novo_pagamento(78.90, 'convênio', '2025-07-20', '9876543210', 'BetaCom LTDA', 33);
call novo_pagamento(459.00, 'título', '2025-06-18', '11223344556677889900', 'GammaCorp SA', 7);
call novo_pagamento(150.75, 'convênio', '2025-06-22', '5566778899', 'DeltaServiços EI', 21);
call novo_pagamento(99.99, 'título', '2025-06-25', '99887766554433221100', 'OmegaTech ME', 45);
call novo_pagamento(275.60, 'convênio', '2025-06-30', '4433221100', 'SigmaNet LTDA', 3);
call novo_pagamento(410.00, 'título', '2025-06-17', '66778899001122334455', 'Epsilon SA', 60);
call novo_pagamento(65.25, 'convênio', '2025-06-19', '3344556677', 'ZetaDigital MEI', 18);
call novo_pagamento(499.99, 'título', '2025-06-21', '12344321123443211234', 'ThetaCom LTDA', 52);
call novo_pagamento(120.00, 'convênio', '2025-06-23', '7788990011', 'LambdaServiços EI', 9);
