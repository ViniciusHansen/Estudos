/*
1) buscar os IDs e títulos dos filmes dos anos 2002 e 2003 com duração superior a 90
e inferior a 120. Exibir o resultado ordenado por título;
*/
select f.id, f.titulo
from filmes f
where (f.ano=2002 or f.ano=2003) and f.duracao > 90 and f.duracao < 120
order by f.titulo

/*
2) buscar os IDs e nomes dos funcionários do noturno que também são clientes e
realizaram reservas em 01/10/2006;
*/
select fu.id, fu.nome
from funcionarios fu join clientes c
on fu.cpf=c.cpf and fu.turno = 'N'
where exists(
	select *
	from reservas r
	where r.cliente = c.id and r.dataR = date('2006-10-01')
)

/*
3) buscar os títulos e nomes de estilos dos filmes locados em 30/09/2006 e 01/10/2006; 
Exibir o resultado ordenado de forma decrescente por estilo e de forma crescente por título;
*/

select f.titulo, e.nome
from filmes f join estilos e
on f.estilo = e.id
where exists(
	select *
	from locacoes l
	where l.filme = f.id 
	and (l.datar = date('2006-09-30') or l.datar = date('2006-10-01'))
)
order by e.nome desc, f.titulo


/*
4) buscar os nomes e endereços dos clientes de Florianópolis e os nomes dos clientes que eles são
responsáveis;
*/
select cr.id, cR.nome, cR.endereco,cr.cidade, cre.nome, cre.id
from clientes cR left join clientes cre
on cre.responsavel = cR.id
where cR.cidade = 'Florianópolis'

/*
5) buscar os nomes e endereços dos clientes que já entregaram DVDs com atraso;
*/

select c.nome, c.endereco
from clientes c
where exists(
	select *
	from locacoes l
	where l.datad > l.datapd and c.id = l.cliente
)


/*
6) buscar os nomes, cidades e endereços dos funcionários do diurno (manhã e tarde) 
e dos clientes com reserva;
*/

select f.nome,f.cidade,f.endereco
from funcionarios f
where f.turno = 'M' or f.turno = 'T'

union

select distinct c.nome,c.cidade,c.endereco
from clientes c join reservas r
on r.cliente = c.id

/*
7) buscar as identificações (ID+filme) das cópias do filme X-Men 3 que estão 
disponíveis para locação ou reserva em 30/11/2006;
*/

select c.id, c.filme
from copias c
where c.filme = (
	select id
	from filmes
	where titulo = 'X-Men 3'
)
and not exists(
	select *
	from reservas r
	where datares = date('2006-11-30') and c.filme = r.filme 
	and (r.dataR < date('2006-11-30') and date('2006-11-30') < r.dataPD) 
)
and not exists(
	select *
	from locacoes l
	where c.filme = l.filme 
	and (l.dataR < date('2006-11-30') and date('2006-11-30') < l.dataD) 
)

/*
8) buscar os IDs, nomes e fones dos clientes que já locaram tanto filmes em
VHS quanto filmes em DVD;
*/

select distinct c.id,c.nome,c.fone
from clientes c join locacoes l
on c.id = l.cliente
where exists(
	select *
	from copias co
	where l.filme = co.filme and co.midia = 'VHS'
) and exists(
	select *
	from copias co
	where l.filme = co.filme and co.midia = 'DVD'
)

/*
9) buscar pares de identificadores de cópias diferentes que pertencem ao mesmo filme, 
sem repetir ummesmo par na resposta;
*/
select distinct cp1.id,cp2.id
from copias cp1 join copias cp2
on cp1.filme = cp2.filme
where cp1.id < cp2.id


/*
10) buscar os IDs, nomes e fones dos clientes que locaram apenas filmes de ação e 
de suspense;
*/
select distinct  cl.id,cl.nome,cl.fone
from clientes cl join locacoes l
on l.cliente = cl.id
where not exists (
	select *
	from filmes f join estilos e
	on f.estilo = e.id
	where l.filme = f.id and e.nome != 'ação' and e.nome != 'suspense'
)


/*
11) buscar os IDs, nomes e fones dos clientes de Florianópolis que já locaram todos 
os VHS legendados;
*/
select distinct  cl.id,cl.nome,cl.fone
from clientes cl join locacoes l
on l.cliente = cl.id
where cl.cidade = 'Florianópolis' and exists(
	select *
	from copias cp join filmes f
	on cp.filme = f.id
	where cp.midia = 'VHS' and cp.tipo = 'legendado'
)



/*
12) buscar os IDs e títulos dos filmes de ação que possuem duração superior a 
duração de todos os filmes de suspense, terror e drama.
*/

select fA.id, fA.titulo
from filmes fA join estilos e
on e.id = fA.estilo
where e.nome = 'ação'
and fA.duracao > all(
	select fB.duracao
	from filmes fB join estilos e
	on e.id = fB.estilo
	where (e.nome = 'suspense' or e.nome = 'terror' or e.nome='drama')
)






