/*
Descrição: Considerando o esquema de dados apresentado abaixo, que modela uma mecânica automotiva e está disponível na página da disciplina, faça a especificação dos comandos SQL para a criação das seguintes visões:

Setor (cods, nome)

Mecanico (codm, cpf, nome, idade, endereco, cidade, funcao, cods)

    cods referencia Setor

Cliente(codc, cpf, nome, idade, endereco, cidade)

Veiculo (codv, renavam, modelo, marca, ano, quilometragem, codc)

    codc referencia Cliente

Conserto (codm, codv, data, hora)

    codm referencia Mecanico

    codv referencia Veiculo
*/


--1)      Mostre o nome e a função dos mecânicos.

create view view_mec_nome_func as 
select m.nome, m.funcao
from mecanico m

select * from view_mec_nome_func

--2)      Mostre o modelo e a marca dos veículos dos clientes.

create view modelo_marca_veiculo as
select v.modelo, v.marca
from veiculo v

select * from modelo_marca_veiculo

--3)      Mostre o nome dos mecânicos, o nome dos clientes, o modelo dos veículos e a data e hora dos consertos realizados.
create view mecanico_cliente_modelo_data as
select m.nome as mecanico_nome, c.nome as cliente_nome, v.modelo, co.data
from mecanico m join conserto co on m.codm = co.codm
join veiculo v on co.codv = v.codv 
join cliente c on v.codc = c.codc

select * from mecanico_cliente_modelo_data

--4)      Mostre o ano dos veículos e a média de quilometragem para cada ano.
create view ano_media_km as
select ano, avg(quilometragem)
from veiculo 
group by ano

select * from ano_media_km

--5)      Mostre o nome dos mecânicos e o total de consertos feitos por um mecânico em cada dia.
create view mecanico_consertos_por_dia as 
select m.nome as nome_mecanico, count(*) as quant_consert, c.data as data_conserto
from mecanico m join conserto c on m.codm = c.codm
group by c.data, m.nome

select * from mecanico_consertos_por_dia

--6)      Mostre o nome dos setores e o total de consertos feitos em um setor em cada dia.
create view nome_setores_total_concertos_por_dia as
select s.nome, c.data, COUNT(*) as total_concertos
from setor s join mecanico m on s.cods=m.cods
join conserto c on m.codm = c.codm
group by s.nome, c.data

select * from nome_setores_total_concertos_por_dia

--7)      Mostre o nome das funções e o número de mecânicos que têm uma destas funções.

create view mecanicos_por_funcao as
select m.funcao, COUNT(*) as total_mecanicos
from mecanico m
group by m.funcao

select * from mecanicos_por_funcao

--8)      Mostre o nome dos mecânicos e suas funções e, para os mecânicos que estejam alocados a um setor, informe também o número e nome do setor.

create view mecanico_funcao_setor as
select m.nome, m.funcao, s.cods, s.nome as nome_setor
from mecanico m left join setor s on s.cods = m.cods

select * from mecanico_funcao_setor


--9)      Mostre o nome das funções dos mecânicos e a quantidade de consertos feitos agrupado por cada função.

create view funcoes_consertos as
select m.funcao, COUNT(*) as total_consertos
from mecanico m join conserto c on m.codm=c.codm
group by m.funcao

select * from funcoes_consertos



