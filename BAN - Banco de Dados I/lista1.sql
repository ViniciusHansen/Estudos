-- Lista 1 P2
/*
1)
Formule uma expressão em SQL que retorne id e título de pares de artigos diferentes mas que foram publicados em um mesmo estado (uf).
Garanta que um mesmo par de artigos não seja retornado na resposta, nem mesmo em posições invertidas.

Exemplo de retorno da expressão:
id	titulo						id	titulo 
34	ClusterRDF: um novo SGBD 	56	Tunning de SGBDs NoSQL 
34	ClusterRDF: um novo SGBD	72	Um modelo de Mapeamento XML-Relacional  
56	Tunning de SGBDs NoSQL 		72 	 Um modelo de Mapeamento XML-Relacional
 ...	... 	 	 
 */
 
 select distinct a1.artigoid, a1.titulo, a2.artigoid, a2.titulo
 from artigos a1, artigos a2, edicoes e1, edicoes e2
 where a1.edicaoid = e1.edicaoid and a2.edicaoid = e2.edicaoid and e1.uf = e2.uf and a1.artigoid < a2.artigoid
 						
 						
 SELECT a1.artigoid, a1.titulo, a2.artigoid, a2.titulo
 FROM artigos a1 NATURAL JOIN edicoes e1 JOIN edicoes e2 ON e1.uf=e2.uf
 JOIN artigos a2 ON a2.edicaoid=e2.edicaoid and a1.artigoid<a2.artigoid;
 												-- compara metade da base, não repete pares


/*
2)
Crie expressões em SQL que retornem o ano e a cidade das edições que tiveram a maior quantidade de participantes.
Forneça pelo menos duas expressões que sejam capazes de retornar estes dados.
*/

select e.ano, e.cidade
from edicoes e
where e.qtdparticipantes = (
	select max(qtdparticipantes)
	from edicoes
	where e.qtdparticipantes is not null
)


select e.ano, e.cidade
from edicoes e
where e.qtdparticipantes >= all(
	select e.qtdparticipantes
	from edicoes e
	where e.qtdparticipantes is not null
)


/*
3)
Faça uma expressão em SQL que retorne o nome dos autores que publicaram artigos de todos os tipos.
*/


select au.nome
from autores au 
join autoresartigo aa on au.autorid = aa.autorid
group by au.nome
having count(distinct aa.artigoid) = (
    select count(distinct tipoid)
    from artigos
)


SELECT nome FROM autores au WHERE
  NOT EXISTS(Select * From tipos t WHERE
	 NOT EXISTS(SELECT * From autoresartigo aa natural join artigos a
			    WHERE aa.autorid=au.autorid AND t.tipoid=a.tipoid));

SELECT nome FROM autores au WHERE
  NOT EXISTS(Select * From tipos t WHERE
	 NOT EXISTS(SELECT * From autoresartigo aa WHERE
				EXISTS(Select * From artigos a
			           WHERE a.artigoid=aa.artigoid AND aa.autorid=au.autorid AND
					   t.tipoid=a.tipoid)));

SELECT nome FROM autores au WHERE
(SELECT COUNT(distinct tipoid) FROM artigos natural join autoresartigo aa
WHERE aa.autorid=au.autorid) = (Select count(*) FROM tipos);

/*
4)
Formule uma expressão em SQL que retorne o id e título de todos os artigos, bem como o nome dos seus respectivos tipos.
Caso o artigo não possua tipo, apresentar o nome do tipo como nulo ou branco.
*/

select distinct a.artigoid, a.titulo, t.nome
from artigos a left join tipos t on a.tipoid = t.tipoid



/*
5)

Formule expressões em SQL que retornem o id, nome e gênero de autores que publicaram artigos que tem tipo com nome igual à 'Graduação'.
Forneça pelo menos duas expressões que sejam capazes de retornar estes dados.

Exemplo de retorno da expressão:
id	nome				gênero 
34	Roberta Pereira 	f 
56	Ronaldo Mello		m 
75	Renato Fileto		m 
 ...	... 	 
*/

select au.autorid, au.nome, au.genero
from autores au
join autoresartigo aa on au.autorid = aa.autorid
join artigos ar on aa.artigoid = ar.artigoid
where ar.tipoid = (
	select distinct ar.tipoid
	from artigos ar join tipos t on t.tipoid = ar.tipoid
	where t.nome = 'Graduação'
)


select au.autorid, au.nome, au.genero
from autores au
join autoresartigo aa on au.autorid = aa.autorid
join artigos ar on aa.artigoid = ar.artigoid
join tipos t on t.tipoid = ar.tipoid
where t.nome = 'Graduação'










