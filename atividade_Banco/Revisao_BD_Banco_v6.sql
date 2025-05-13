# Revisao selects e subconsultas

use BD_Banco_v6;

#UPDATE COM SUBCONSULTAS CORRELACIONADAS

# Exemplo 1: Atualize o saldo (sem limite) das Conta Correntes de acordo com 
# a soma dos Depósitos (créditos) realizados. Utilize um Update com 
# subconsulta para essa tarefa.

update conta_corrente
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc + (
	select ifnull(sum(deposito.valor_dep), 0) 
	from deposito
	where
	(deposito.id_cc_fk = conta_corrente.id_cc)
);

# Exemplo 2: Atualize o Saldo (sem limite) das Conta Correntes de acordo com
# soma dos Pagamentos (débito) realizados. Utilize um Update com sub
# consulta para essa tarefa.

update conta_corrente
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc - (
	select
    ifnull(sum(pagamento.valor_pag), 0)
    from
    pagamento
    where
    (pagamento.id_cc_fk = conta_corrente.id_cc)
);

# Exemplo 3: Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
# soma dos Saques (débito) realizados. Utilize um Update com sub
# consulta para essa tarefa.

update conta_corrente
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc - (
	select
    ifnull(sum(saque.valor_saq), 0) 
    from 
    saque
    where
    (saque.id_cc_fk = conta_corrente.id_cc)
);

# Exemplo 4: Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
# soma das Transferência de Origem (débitos) realizadas. Utilize um
# Update com sub consulta para essa tarefa.

update
conta_corrente
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc - (
	select
    ifnull(sum(transferencia.valor_trans), 0)
    from
    transferencia
    where
    (transferencia.id_cc_origem_fk = conta_corrente.id_cc)
);

# Exemplo 5: Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
# soma das Transferência de Destino (créditos) recebidas. Utilize um
# Update com sub consulta para essa tarefa

update 
conta_corrente
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc + (
	select
    ifnull(sum(transferencia.valor_trans), 0)
    from
    transferencia
    where
    (transferencia.id_cc_destino_fk = conta_corrente.id_cc)
);

#UPDATE COM SUBCONSULTAS COM JOIN

# Exemplo 1: Atualize o saldo (sem limite) das Conta Correntes de
# acordo com a soma dos Depósitos (créditos) realizados. Utilize um
# Update com subconsulta para essa tarefa.

update
conta_corrente join (
	select deposito.id_cc_fk, sum(deposito.valor_dep) as soma_dep
    from 
    deposito
    group by
    deposito.id_cc_fk
    ) as somas on (conta_corrente.id_cc = somas.id_cc_fk)
set
conta_corrente.saldo_cc = conta_corrente.saldo_cc + somas.soma_dep;

# Exemplo 2:  Crie o atributo status e atualize o status de clientes para VIP onde a soma dos depósitos 
# seja 50 mil reais

alter table cliente add status_cli varchar(50);

update cliente join (
	select 
    conta_corrente.id_cli_fk,
    sum(deposito.valor_dep) as total_depositos
    from
    conta_corrente join deposito on (conta_corrente.id_cc = deposito.id_cc_fk)
    group by conta_corrente.id_cli_fk
) as tabela_temp on (cliente.id_cli = tabela_temp.id_cli_fk)
set
cliente.status_cli = 'VIP'
where
(tabela_temp.total_depositos > 500);

# UPDATE COM JOIN

# Exemplo 1: Adicione a sigla BB no nome das agencias do Banco do Brasil.

update agencia inner join banco on (banco.id_ban = agencia.id_ban_fk)
set
agencia.nome_ag = concat(agencia.nome_ag,' Centro - BB')
where
(banco.nome_ban like "%brasil%");

# Exemplo 2: Altere para R$ 300,00 o limite das contas de clientes homens da agencia 0951-2

update conta_corrente
join cliente on (conta_corrente.id_cli_fk = cliente.id_cli)
join agencia on (conta_corrente.id_ag_fk = agencia.id_ag)
set
conta_corrente.valorLimite_cc = conta_corrente.valorLimite_cc + 300
where
((cliente.sexo_cli='M')and(agencia.numero_ag = '0951-2'));

# Exemplo 3:Atualize as Conta_Corrente somando saldo + limite, apenas para clientes 
# com renda acima de 5000 e agência 'Centro’;

update conta_corrente as cc
join cliente as cli on (cc.id_cli_fk = cli.id_cli)
join agencia as ag on (cc.id_ag_fk = ag.id_ag)
set
cc.saldoComLimite_cc = cc.saldo_cc + cc.valorLimite_cc
where
((cli.renda_cli > 5000)and(ag.nome_ag = 'Centro'));