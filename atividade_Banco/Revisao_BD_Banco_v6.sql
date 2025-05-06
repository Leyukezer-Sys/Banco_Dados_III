# Revisao selects e subconsultas

use BD_Banco_v6;

# Exemplo Atualize o saldo (sem limite) das Conta Correntes de acordo com 
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

# Exemplo Atualize o Saldo (sem limite) das Conta Correntes de acordo com
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

# Exemplo Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
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

# Exemplo Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
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

# Exemplo Atualize o Saldo (sem limite) das Conta Correntes de acordo com a
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

# Exemplo Atualize o saldo (sem limite) das Conta Correntes de
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