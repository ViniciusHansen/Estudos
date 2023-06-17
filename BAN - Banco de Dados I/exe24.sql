-- EXE -continuação subconsultas, ordenação e agrupamento
--1)
/*
Faça uma expressão SQL que retorne o nome e CPF dos médicos que têm consultas marcadas com todos os pacientes
*/
select distinct m.nome,m.cpf
from medicos m join consultas c on m.codm=c.codm
where not exists (
	select *
	from  pacientes p where not exists (
		select *
		from consultas c
		where c.codm=m.codm and c.codp=p.codp))

--2)
/*
Faça uma expressão SQL que retorne o nome e CPF dos médicos ortopedistas que têm consultas marcadas com todos os pacientes de Florianópolis.
*/
select m.nome,m.cpf
from medicos m
where m.especialidade = 'ortopedia' and not exists (
	select *
	from pacientes p
	where p.cidade='Florianopolis' and not exists(
		select *
		from consultas c
		where c.codm=m.codm and c.codp=p.codp))


--3)
/*
Faça uma expressão SQL que retorne todos os dados das consultas marcadas para a médica Maria. Faça esta expressão utilizando subconsulta na cláusula FROM.
*/
select c.*
from (select * from medicos m where m.nome='Maria') as m1 join consultas c
on c.codm = m1.codm


--4)
/*
Faça uma expressão SQL que retorne os dados de todos os funcionários ordenados pelo salário (decrescente) e pela idade (crescente). Buscar apenas os três primeiros funcionários nesta ordem.
*/
select f.*
from funcionarios f
order by f.salario desc, f.idade
limit 3


--5)
/*
Faça uma expressão SQL que retorne o nome do médico e o nome dos pacientes com consulta marcada, ordenado pela data e pela hora. Buscar apenas as tuplas 3 a 5, nesta ordem.
*/
select m.nome, p.nome
from medicos m, pacientes p, consultas c
where m.codm=c.codm and p.codp=c.codp
order by c.data, c.hora
limit 3 offset 2


--6)
/*
Faça uma expressão SQL que retorne as idades dos médicos e o total de médicos com a mesma idade.
*/
select distinct m.idade,count(*)
from medicos m
group by m.idade


--7)
/*
Faça uma expressão SQL que retorne andares onde existem ambulatórios cuja média de capacidade no andar seja >= 40,
*/
select a.andar
from ambulatorios a
group by a.andar
having avg(a.capacidade) >= 40


--8)
/*
Faça uma expressão SQL que retorne o nome dos médicos que possuem mais de uma consulta marcada.
*/
select m.nome
from medicos m, consultas c
where m.codm=c.codm
group by nome
having count(c.codm) > 1


--9)
/*
Faça uma expressão SQL capaz de passar para 21/11/2006 todas as consultas do médico Pedro marcadas antes do meio-dia.
*/
update consultas
set data = date('2006-11-21')
where codm = (select codm from medicos where nome='Pedro') and
hora < '12:00:00'


--10)
/*
O funcionário Caio (codf = 3) tornou-se médico. Sua especialidade é a mesma da médica Maria (codm = 2) e ele vai atender no mesmo ambulatório dela. Faça uma expressão SQL capaz de inserir Caio na tabela Médicos.
*/
insert medicos (codm, nome, idade, cpf, cidade, especialidade, nroa)
select
  6, --valor estático para a coluna codm -- podia ter feito o max(codm)+1
  f.nome,
  f.idade,
  f.cpf,
  f.cidade,
  m.especialidade,
  m.nroa
from funcionarios f cross join medicos m
where f.nome = 'Caio' and m.nome = 'Maria'
