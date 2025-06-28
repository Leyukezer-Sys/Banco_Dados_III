#aluno: Leyukezer Cruz de Lima
#Sistema para Empresa de Transporte Rodoviario

use bd_rodoviaria_leyukezer;

#RF1 - CADASTRAR ESTADO
delimiter $$
create procedure cadastrar_estado(nome varchar(200), sigla varchar(2), regiao varchar(200))
begin
declare count_estado int;
set count_estado = (select count(*) from estado where (nome_est like nome));

	if(count_estado = 0)then
		if(nome <> '' and nome is not null)then
			if(sigla <> '' and sigla is not null)then
				if(length(sigla) = 2)then
					insert into estado values (null, nome, sigla, regiao);
                    select concat("O Estado de ", nome, " foi cadastrado com sucesso!") as confirmação;
                else
					select "O atributo Sigla aceita apenas 2 caracteres!" as alerta;
                end if;
            else
				select "o atributo Sigla não pode ser nulo ou vazio!" as alerta;
			end if;
		else
			select "o atributo Nome não pode ser nulo ou vazio!" as alerta;
		end if;
	else
		select concat("O estado ", nome, " já está cadastrado!") as alerta;
	end if;
 
end;
$$ delimiter ;

#TESTE: Insira 10 Estados do Brasil, entre eles devem constar obrigatoriamente: RO, MT, AC, AM e MS.
call cadastrar_estado("RONDÔNIA", 'RO', "NORTE");
call cadastrar_estado("MATO-GROSSO", 'MT', "CENTRO-OESTE");
call cadastrar_estado("ACRE", 'AC', "NORTE");
call cadastrar_estado("AMAZONAS", 'AM', "NORTE");
call cadastrar_estado("MATO GROSSO DO SUL", 'MS', "CENTRO-OESTE");


#RF2 – CADASTRAR CIDADE
delimiter $$
create procedure cadastrar_cidade(nome varchar(200), populacao int, estado int)
begin
declare count_estado, count_cidade int;
declare tipologia varchar(300);

set count_estado = (select count(*) from estado where (id_est = estado));
set count_cidade = (select count(*) from cidade where (nome_cid like nome));
	
    if(populacao >= 500000)then
		set tipologia = "Grande";
	elseif(populacao >= 100000)then
		set tipologia = "Média";
	else
		set tipologia = "Pequena";
	end if;

	if(count_estado = 1)then
		if(count_cidade = 0)then
			insert into cidade values (null, nome, populacao, tipologia, estado);
            select concat("A cidade ", nome, " foi cadastrada com sucesso!") as confirmação;
        else
			select concat("A cidade ", nome, " já esta cadastrada!") as alerta;
		end if;
    else
		select concat("O Estado #", estado, " não existe no sistema!") as alerta;
	end if;

end;
$$ delimiter ;

#TESTE: Chame o procedimento e insira 10 cidades de RO, 03 de MT, 02 de AC, 03 de AM e 02 de MS
call cadastrar_cidade("JI-PARANÁ", 124333, 1);
call cadastrar_cidade("PORTO VELHO", 548692, 1);
call cadastrar_cidade("ARIQUEMES", 107849, 1);
call cadastrar_cidade("CACOAL", 91838, 1);
call cadastrar_cidade("VILHENA", 104754, 1);
call cadastrar_cidade("GUJARÁ-MIRIM", 46906, 1);
call cadastrar_cidade("PIMENTA BUENO", 36028, 1);
call cadastrar_cidade("ROLIM DE MOURA", 55722, 1);
call cadastrar_cidade("OURO PRETO DO OESTE", 38700, 1);
call cadastrar_cidade("BURITIS", 35743, 1);
call cadastrar_cidade("CUIABÁ", 630309, 2);
call cadastrar_cidade("RONDONÓPOLIS", 240315, 2);
call cadastrar_cidade("SINOP", 147161, 2);
call cadastrar_cidade("RIO BRANCO", 419452, 3);
call cadastrar_cidade("CRUZEIRO DO SUL", 89274, 3);
call cadastrar_cidade("MANAUS", 2219580, 4);
call cadastrar_cidade("PARINTINS", 116792, 4);
call cadastrar_cidade("ITACOATIARA", 99357, 4);
call cadastrar_cidade("CAMPO GRANDE", 916001, 5);
call cadastrar_cidade("DOURADOS", 225495, 5);


#RF3 – CADASTRAR ENDEREÇO
delimiter $$
create procedure cadastrar_endereco(rua varchar(300), numero int, bairro varchar(100), cep varchar(100), cidade int)
begin
declare count_cidade int;
declare endereco_nao_existe bool;

set cep = replace(cep, '-','');
set cep = replace(cep, '.','');

set count_cidade = (select count(*) from cidade where (id_cid = cidade));

if ((select count(*) from endereco where ((rua_end like rua)and(numero_end like numero)and(bairro_end like bairro)and(cep_end like cep)and(id_cid_fk = cidade))) > 0) then
	set endereco_nao_existe = false;
else
	set endereco_nao_existe = true;
end if;

if (count_cidade > 0) then
	if (endereco_nao_existe) then
		if(length(trim(cep)) = 8) then
			insert into endereco values (null, rua, numero, bairro, cep, cidade);
            select concat("O endereço ", rua, " foi cadastrado com sucesso!") as Confirmação;
        else
			select concat("O cep ", cep, " está incorreto ou inválido!") as alerta;
        end if;
	else
		select concat("O endereço ", rua,", ", numero," - ", bairro, " ", cep, " - ", (select nome_cid from cidade where id_cid = cidade), " Já está cadastrado!") as alerta;
    end if;
else
	select concat("A cidade #", cidade, " não existe no sistema!") as alerta;
end if;

end; 
$$ delimiter ;

#TESTE:  Chame o procedimento e insira 10 endereços aleatórios;
call cadastrar_endereco("Av. Marechal Rondon", 1024, "Centro", "76804-010", 2);
call cadastrar_endereco("Rua Manoel Franco", 1632, "Nova Brasilia", "76908-610", 1);
call cadastrar_endereco("Rua T-15", 87, "Setor 2", "76873-040", 3);
call cadastrar_endereco("Av. Belo Horizonte", 1950, "Centro", "76964-600", 5);
call cadastrar_endereco("Travessa Ipê Roxo", 43, "Incra 6", "76962-220", 7);
call cadastrar_endereco("Rua São Paulo", 348, "Green Ville", "76960-310", 4);
call cadastrar_endereco("Rua Dom Pedro II", 120, "Jardim Tropical", "76890-140", 8);
call cadastrar_endereco("Av. Capitão Sílvio", 650, "Liberdade", "76850-580", 6);
call cadastrar_endereco("Rua dos Pioneiros", 734, "Setor Novo", "76920-380", 9);
call cadastrar_endereco("Rua do Comércio", 1599, "Setor 3", "76820-530", 10);


#RF4 – CADASTRAR CLIENTE
delimiter $$
create procedure cadastrar_cliente(nome varchar(300), cpf varchar(20), rg varchar(20), data_nascimento date, celular varchar(100), email varchar(300), sexo int, endereco int)
begin
declare count_sexo, count_endereco, count_cpf, idade int;
declare data_valida bool;

set count_sexo = (select count(*) from sexo where (id_sex = sexo) );

set count_endereco = (select count(*) from endereco where (id_end = endereco));

set count_cpf = (select count(*) from cliente where (cpf_cli like cpf));

if(data_nascimento > curdate())then
	set data_valida  = false;
elseif(year(data_nascimento)< 1900 )then
	set data_valida = false;
else
	set data_valida = true;
end if;

set cpf = replace(cpf, '-','');
set cpf = replace(cpf, '.','');
set cpf = trim(cpf);

set idade = (year(curdate())-year(data_nascimento));

if(count_sexo = 1)then
	if(count_endereco = 1)then
		if(count_cpf = 0)then
			if(data_valida)then
				if((select count(*) where email like "%@%") = 1)then
					insert into cliente values (null, nome, cpf, rg, data_nascimento, idade, celular, email, sexo, endereco);
                    select concat("Cliente ", nome, " cadastrado com sucesso!") as confirmação;
                else
					select concat("O email ", email, " é inválido!") as alerta;
                end if;
            else
				select concat("A data ", date_format(data_nascimento, '%d/%m/%Y'), " é inválida!") as alerta;
            end if;
        else
			select concat("o Cpf ", cpf, " já está cadastrado!") as alerta;
        end if;
    else
		select concat("O endereço #", endereco, " não existe no sistema!") as alerta;
    end if;
else
	select concat("O sexo #", sexo, " não existe no sistema!") as alerta;
end if;

end;
$$ delimiter ;

# TESTE: Chame o procedimento e insira 05 clientes aleatórios;
call cadastrar_cliente("Leyukezer Cruz", "000.000.000-00", '1619308 SSPRO', '2002-06-21', '(69) 98523-3453', "accont@email.com", 1, 2);
call cadastrar_cliente("Victor dos Santos Amaral", "111.111.111-11", '1425673 SSPRO', '2001-11-03', '(69) 99999-1111', "victor@email.com", 1, 1);
call cadastrar_cliente("Jackson Henrique da Silva Bezerra", "222.222.222-22", '52315 SSPRO', '1994-07-15', '(69) 98888-2222', "jackson@email.com", 1, 6);
call cadastrar_cliente("Bruno Santos Ferreira", "333.333.333-33", '1424352 SSPRO', '1998-04-27', '(69) 97777-3333', "bruno@email.com", 1, 8);
call cadastrar_cliente("Lucas Gabriel Barbosa Machado", "444.444.444-44", '512623 SSPRO', '2000-12-09', '(69) 96666-4444', "lucas@email.com", 1, 10);


#RF5 - CADASTRAR FUNCIONÁRIO
delimiter $$
create procedure cadastrar_funcionario(nome varchar(300),cpf varchar(20),rg varchar(50), data_nascimento date, salario double, funcao varchar(50), data_contratacao date, celular varchar(300), email varchar(300), sexo int, departamento int, endereco int)
begin
declare count_sexo, count_departamento, count_endereco, count_cpf int;
declare verificar_data_contratacao, verificar_data_nascimento bool;

set count_sexo = (select count(*) from sexo where (id_sex = sexo));
set count_departamento = (select count(*) from departamento where (id_dep = departamento));
set count_endereco = (select count(*) from endereco where(id_end = endereco));
set count_cpf = (select count(*) from funcionario where (cpf_fun like cpf));

set cpf = replace(cpf, '-','');
set cpf = replace(cpf, '.','');
set cpf = trim(cpf);

if(data_contratacao is null)then
	set verificar_data_contratacao = true;
elseif(data_contratacao <= curdate())then
	set verificar_data_contratacao = true;
else
	set verificar_data_contratacao = false;
end if;

if(data_nascimento is null)then
	set verificar_data_nascimento = true;
elseif(data_nascimento < curdate())then
	set verificar_data_nascimento = true;
else
	set verificar_data_nascimento = false;
end if;

if(count_sexo = 1)then
	if(count_departamento = 1)then
		if(count_endereco = 1)then	
			if(count_cpf = 0)then
				if(nome <> '' and nome is not null)then
					if(cpf <> '' and cpf is not null)then
						if(salario <> '' and salario is not null)then
							if(funcao <> '' and funcao is not null)then
								if(celular <> '' and celular is not null)then
									if(email <> '' and email is not null)then
										if(verificar_data_contratacao)then
											if(verificar_data_nascimento)then
												if(salario > 1412.00)then
													insert into funcionario values (null, nome, cpf, rg, data_nascimento, salario, funcao, data_contratacao, celular, email, sexo, departamento, endereco);
													select concat("O Funcionario ", nome, " foi cadastrado com sucesso!") as confirmação;
                                                else
													select concat("O salário de R$", format(salario, 2, 'pt-BR'), " é abaixo do sálario mínimo!") as alerta;
												end if;
											else
												select concat("A data de nascimento (", data_nascimento,") é inválida!") as alerta;
											end if;
                                        else
											select concat("A data de contratacao (", data_contratacao,") é inválida!") as alerta;
                                        end if;
									else
										select concat("O email é obrigatório no cadastro!") as alerta;
									end if;
                                else
									select concat("O celular é obrigatório no cadastro!") as alerta;
								end if;
							else
								select concat("A função é obrigatória no cadastro!") as alerta;
							end if;
						else
							select concat("O salário é obrigatório no cadastro!") as alerta;
						end if;
					else
						select concat("O cpf é obrigatório no cadastro!") as alerta;
					end if;
                else
					select concat("O nome é obrigatório no cadastro!") as alerta;
				end if;
            else
				select concat("o Cpf ", cpf, " já está cadastrado!") as alerta;
            end if;
        else
			select concat("O endereco #", endereco, " não existe no sistema!") as alerta;
		end if;
    else
		select concat("O departamento #", departamento, " não existe no sistema!") as alerta;
    end if;
else
	select concat("O sexo #", sexo, " não existe no sistema!") as alerta;
end if;

end;
$$ delimiter ;

# TESTE: Chame o procedimento e insira 04 Funcionários aleatórios com as Atendente, Motorista, Gerente, Mecânico
call cadastrar_funcionario('Caian Henrique Soares de Oliveira', '123.456.789-00', '198273 SSPRO', '2000-05-12', 1450.20, 'Atendente', curdate(), '(69) 98743-8734', 'caian.henrique@gmail.com', 1, 1, 3);
call cadastrar_funcionario('Katielly Bordin Santos', '987.654.321-11', '457892 SSPRO', '2001-11-27', 1850.00, 'Motorista', '2024-05-27', '(69) 98421-9821', 'katielly.santos@gmail.com', 2, 2, 4);
call cadastrar_funcionario('Jairo Alves dos Anjos', '321.987.654-22', '378216 SSPRO', '2003-03-10', 3250.90, 'Gerente', '2023-02-28', '(69) 99945-1123', 'jairo.anjos@ifro.edu.br', 1, 4, 5);
call cadastrar_funcionario('Nathalia Mariano Lopes', '654.321.987-33', '599821 SSPRO', '1998-08-04', 2680.50, 'Mecânico', '2025-03-26', '(69) 98123-4567', 'nathalia.lopes@gmail.com', 2, 3, 7);


#RF6 - CADASTRAR ÔNIBUS
delimiter $$
create procedure cadastrar_onibus(modelo varchar(100), marca varchar(100), placa varchar(50), capacidade int)
begin
declare count_onibus, verificar_placa int;

set count_onibus = (select count(*) from onibus where(placa_oni like placa));

set verificar_placa = (select count(placa) where (placa regexp '^[A-Z]{3}\-[0-9]{4}$'));

if(count_onibus = 0)then
	if(verificar_placa = 1)then
		if(capacidade between 48 and 60)then
			insert into onibus values(null, modelo, marca, placa, capacidade);
            select concat("O onibus ", modelo, " foi cadastrado com sucesso!") as confirmação;
		else
			select concat("A capacidade de ", capacidade, " poltronas é invalida! precisa ser: minimo 48, máximo 60!") as alert;
		end if;
	else
		select concat("A placa ", placa, " é inválida!(ex: NDD-1010)") as alert;
	end if;
else
	select concat("A Placa ", placa, " Já existe no sistema!") as alert;
end if;
end;
$$ delimiter ;

#TESTE: Chame o procedimento e insira 04 ônibus.
CALL cadastrar_onibus('Comil Campione', 'Mercedes-Benz', 'ABC-1234', 52);
CALL cadastrar_onibus('Marcopolo G7', 'Volvo', 'DEF-5678', 60);
CALL cadastrar_onibus('Caio Apache VIP', 'Scania', 'GHI-9012', 50);
CALL cadastrar_onibus('Irizar i6', 'Volkswagen', 'JKL-3456', 48);