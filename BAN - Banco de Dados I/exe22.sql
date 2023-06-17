-- EXE - Subconsultas no where
--1) Faça uma expressão SQL que utilize o operador IN e que retorne o nome e CPF dos médicos que também são pacientes do hospital.
select distinct m.nome,m.cpf
from medicos m,pacientes
where m.cpf in (select cpf from pacientes)

--2) Faça uma expressão SQL que utilize o operador IN e que retorne o nome e idade dos médicos que têm consulta com a paciente Ana.
select distinct m.nome,m.idade 
from medicos m,consultas c,pacientes p 
where m.codm in (select codm from consultas c,pacientes p where p.nome='Ana')

--3)Faça uma expressão SQL que utilize o operador IN e que retorne o número e andar dos ambulatórios onde nenhum médico dá atendimento.
select distinct a.nroa,a.andar 
from ambulatorios a 
where a.nroa in (
	select a.nroa
	from ambulatorios a
	except 
	select a.nroa 
	from ambulatorios a,medicos m 
	where m.nroa = a.nroa)

--4)Faça uma expressão SQL que utilize o operador IN e que retorne o nome, CPF e idade dos pacientes que têm consultas marcadas sempre para dias anteriores ao dia 16.
select distinct p.nome,p.cpf,p.idade 
from pacientes p,consultas c 
where c.codp=p.codp and c.data in (
	select c.data 
	from consultas c 
	except 
	select c.data 
	from consultas c 
	where extract(day from c.data) >16)

--5)Faça uma expressão SQL que utilize o operador ANY/ALL e que retorne o números e andares de todos os ambulatórios, exceto o de menor capacidade.
select a.nroa,a.andar 
from ambulatorios a 
where a.capacidade > any(
	select capacidade 
	from ambulatorios)

--6)Faça uma expressão SQL que utilize o operador ANY/ALL e que retorne o nome e idade dos médicos que têm consulta com a paciente Ana.
select distinct m.nome,m.idade 
from medicos m,consultas c,pacientes p 
where p.nome = any(
	select p.nome 
	from pacientes p 
	where p.nome = 'Ana') and m.codm=c.codm and p.codp=c.codp

--7)Faça uma expressão SQL que utilize o operador ANY/ALL e que retorne o nome e a idade do médico mais jovem (sem usar função MIN!).
select m.nome,m.idade 
from medicos m 
where m.idade <= all(
	select idade 
	from medicos)

--8)Faça uma expressão SQL que utilize o operador ANY/ALL e que retorne o nome e CPF dos pacientes com consultas marcadas para horários anteriores a todos os horários de consultas marcadas para o dia 12 de Novembro de 2006.
select distinct p.nome,p.cpf 
from pacientes p,consultas c 
where c.hora < all(
	select c.hora 
	from consultas c 
	where c.data = date('2006-11-12'))

--9)Faça uma expressão SQL que utilize o operador EXISTS e que retorne o nome e idade dos médicos que têm consulta com a paciente Ana.
select distinct m.nome,m.idade 
from medicos m,consultas c 
where exists(
	select * 
	from consultas c,pacientes p 
	where c.codp=p.codp and p.nome='Ana')

--10)Faça uma expressão SQL que utilize o operador EXISTS e que retorne o número do ambulatório com a maior capacidade (sem usar função MAX!).
select a.nroa 
from ambulatorios a 
where not exists(
	select * 
	from ambulatorios 
	where capacidade > a.capacidade)

