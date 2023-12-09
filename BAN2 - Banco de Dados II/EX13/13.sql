-- - Faça a criação dos índices e as modificações na especificação das consultas que achar necessário para melhorar a sua otimização.

-- - Avalie a otimização realizada analisando a consulta por meio da ferramenta Explain Analyze do pgAdmin.

-- 1)Recupere o CPF e o nome dos mecânicos que trabalham nos setores maiores que 100 e menores que 200.

explain analyse select cpf, nome from mecanico where cods between 100 and 200

create index idx_mec_cods on mecanico using btree(cods)

-- 2)Recupere o CPF e nome dos mecânicos que atenderam no dia 13/06/2018.
create index idx_conserto_data on conserto using hash(data)
create index idx_conserto_codm on conserto using hash(codm)

explain analyse
select cpf, nome from mecanico join conserto using(codm) where data = '13/06/2018'

-- 3)Recupere o nome do mecânico, o nome do cliente e a hora do conserto para os consertos realizados de 12/06/2018 à 25/09/2018.
drop index idx_conserto_data

create index idx_conserto_data on conserto using btree(data)

explain analyse
select m.nome, c.nome, co.hora 
from mecanico m join conserto co using(codm) join veiculo v using(codv) join cliente c using(codc) 
where co.data between date('12/06/2018') and date('25/09/2018')
-- muda o indice conserto data para btree devido ao intervalo

-- btree é melhor para intervalos
-- hash é melhor para comparações exatas

-- 4)Recupere o nome e a função de todos os mecânicos, e o número e o nome dos setores para os mecânicos que tenham essa informação.
select m.nome, m.funcao, s.cods, s.nome from mecanico m left join setor s using(cods)
-- não tem muito o que otimizar

-- 5)Recupere o nome de todos os mecânicos, e as datas dos consertos para os mecânicos que têm consertos feitos
-- (deve aparecer apenas um registro de nome de mecânico para cada data de conserto).
select distinct m.nome, c.data from mecanico m join conserto c using(codm)

-- 6)Recupere a média da quilometragem de todos os veículos dos clientes.

create index idx_veic_km on veiculo using hash(quilometragem)

explain analyse
select avg(quilometragem) from veiculo where codc is not null
--antes:         "Planning Time: 0.047 ms" 	"Execution Time: 1.791 ms"
--depois do idx: "Planning Time: 0.055 ms"  "Execution Time: 1.343 ms"

-- 7)Recupere a soma da quilometragem dos veículos de cada cidade onde residem seus proprietários.
create index idx_cli_cidade on cliente using btree(cidade)

explain analyse
select cidade, sum(quilometragem) from cliente join veiculo using(codc) group by cidade

-- 8)Recupere a quantidade de consertos feitos por cada mecânico durante o período de 12/06/2018 até 19/010/2018
create index idx_conserto_data on conserto using btree(data)

explain analyse
select codm, count(*) from conserto where data between '12/06/2018' and '19/010/2018'
group by codm

select * from conserto

-- 9)Recupere a quantidade de consertos feitos agrupada pela marca do veículo.
create index idx_veiculo_marca on veiculo using hash(marca)
drop index idx_veiculo_marca

explain analyse
select v.marca, count(*) from conserto c join veiculo v using(codv) group by marca
-- antes do idx:	"Planning Time: 0.181 ms"	"Execution Time: 9.005 ms"
-- depois: 			"Planning Time: 0.169 ms" 	"Execution Time: 4.494 ms"

-- 10)Recupere o modelo, a marca e o ano dos veículos que têm quilometragem maior que a média de quilometragem de todos os veículos.
--já utiliza o indice criado na 6)
explain analyse
select v.modelo, v.marca, v.ano from veiculo v where v.quilometragem > (select avg(quilometragem) from veiculo)

-- 11)Recupere o nome dos mecânicos que têm mais de um conserto marcado para o mesmo dia.
create index idx_mec_codm on mecanico using hash(codm)
drop index idx_mec_codm

explain analyse
select m.nome as consertos from mecanico m join conserto c using(codm)
group by codm, data having count(*) > 1

-- antes do idx:	"Planning Time: 0.207 ms"	"Execution Time: 13.108 ms"
-- depois do idx:	"Planning Time: 0.183 ms"	"Execution Time: 6.451 ms"