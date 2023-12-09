 --Recupere o CPF e o nome dos mecânicos que trabalham nos setores número 1 e 2 (faça a consulta utilizado a cláusula IN).
/*
select m.cpf, m.nome
from mecanico m
where m.cods in (1,2)
*/

--Recupere o CPF e o nome dos mecânicos que trabalham nos setores 'Funilaria' e 'Pintura' (faça a consulta utilizando sub-consultas aninhadas).
/*
select m.cpf, m.nome
from mecanico m
where exists (select s.cods
			   from setor s
			   where m.cods = s.cods and (s.nome = 'Funilaria' or s.nome = 'Pintura'))
*/		   

--Recupere o CPF e nome dos mecânicos que atenderam no dia 13/06/2014 (faça a consulta usando INNER JOIN).
/*
select m.cpf, m.nome
from mecanico m join conserto c
on c.data = date('2014-06-13')
*/
--Recupere o nome do mecânico, o nome do cliente e a hora do conserto para os consertos realizados no dia 12/06/2014 (faça a consulta usando INNER JOIN).
/*
select m.nome,cl.nome, co.hora
from mecanico m join conserto co on m.codm = co.codm
join veiculo v on v.codv = co.codv
join cliente cl on cl.codc = v.codc
where co.data = date('2014-06-12')
*/

--Recupere o nome e a função de todos os mecânicos, e o número e o nome dos setores para os mecânicos que tenham essa informação.
/*
select m.nome, m.funcao, s.cods, s.nome
from mecanico m join setor s
on m.cods = s.cods
where m.cods is not null
*/

--Recupere o nome de todos os mecânicos, e as datas dos consertos para os mecânicos que têm consertos feitos (deve aparecer apenas um registro de nome de mecânico para cada data de conserto).
/*
select distinct m.nome, co.data
from mecanico m join conserto co
on m.codm = co.codm
*/

--Recupere a média da quilometragem de todos os veículos dos clientes.
/*
select AVG(v.quilometragem)
from veiculo v
*/
--Recupere a soma da quilometragem dos veículos de cada cidade onde residem seus proprietários.
/*
select c.cidade, sum(v.quilometragem) as media_km
from veiculo v join cliente c
on v.codc = c.codc
group by (c.cidade)
*/
--Recupere a quantidade de consertos feitos por cada mecânico durante o período de 12/06/2014 até 19/06/2014
/*
select c.codm, count(*) as total_consertos
from conserto c
group by (c.codm)
*/

--Recupere a quantidade de consertos feitos agrupada pela marca do veículo.
/*
select v.marca, count(*) as qtd_consertos
from conserto c join veiculo v
on c.codv = v.codv
group by (v.marca)
*/
--Recupere o modelo, a marca e o ano dos veículos que têm quilometragem maior que a média de quilometragem de todos os veículos.
/*
select distinct v.modelo, v.marca, v.ano
from veiculo v join veiculo v2
on v.codv > v2.codv
where v.quilometragem > (select avg(v3.quilometragem) from veiculo v3)
*/

--Recupere o nome dos mecânicos que têm mais de um conserto marcado para o mesmo dia.

select distinct m.nome, m.codm
from mecanico m join conserto c
on c.codm = m.codm
join conserto c2
on c.data = c2.data and c.hora != c2.hora and c.codm = c2.codm





