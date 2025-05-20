#Leyukezer Cruz de Lima

#bd mecanica 9.0 Exercicios de Regexp

use bd_mecanica_9;

#1. Liste todos os clientes cujo nome começa com a letra "J".
select * from cliente where (nome_cli regexp ('^[jJ]'));

#2. Encontre os produtos cujo nome termina com a letra "a".
select * from produto where (descricao_prod regexp ('[aA]$'));

#3. Liste os clientes que nasceram na década de 60.
select * from cliente where (data_nascimento_cli regexp ('^..6'));

#4. Encontre os clientes cujo nome seja "Lucas" ou "Pedro".
select * from cliente where (nome_cli regexp ('lucas|pedro'));

#5. Liste os clientes cujo nome começa com "M", "N" ou "O".
select * from cliente where (nome_cli regexp ('^[mnoMNO]'));

#6. Encontre os clientes cujo nome não começa com "L", "M" ou "N".
select * from cliente where (nome_cli regexp('^[^lmn]'));

#7. Liste os produtos que contenham pelo menos um dígito entre 2 ou 0 no nome.
select * from produto where (descricao_prod regexp ('[0-2]{1,}'));

#8. Liste os produtos com exatamente 5 caracteres no nome (letras e números).
select * from produto where (descricao_prod regexp ('^[0-9a-z ]{5}$'));

#9. Liste os e-mails dos clientes que estejam no formato nome@dominio.com.
select * from cliente where (email_cli regexp ('^[0-9a-z_+$]+@[a-z]\.[a-z]{2,}'));

#10. Liste os telefones dos clientes que sigam o padrão (XX) XXXX-XXXX.
select * from cliente where (telefone_cli regexp ('^\\([0-9]{2)\\) [0-9]{4}\-[0-9]{4}$'));

#11. Selecione o nome e cpf dos clientes que estão no formato correto: 000.000.000-00.
select * from cliente where (cpf_cli regexp ('^[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}$'));

#12. Selecione a razão e o CNPJ dos fornecedores que estão no formato correto: 00.000.000/0000-00
select * from fornecedor where (cnpj_forn regexp ('^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}\-[0-9]{2}$'));