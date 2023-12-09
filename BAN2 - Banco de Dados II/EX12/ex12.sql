--1)      Crie um índice para cada uma das chaves estrangeiras presentes do esquema de dados.
create index idx_mecanico_cods on mecanico using HASH(cods);
create index idx_veiculo_codc on veiculo using HASH(codc);
create index idx_conserto_codm on conserto using HASH(codm);
create index idx_conserto_codv on conserto using HASH(codv);


--2)      Crie um índice para acelerar a busca dos mecânicos pela função.
create index idx_mecanico_funcao on mecanico using BTREE(substr(funcao,1,10));

select * from mecanico

--3)      Crie um índice para acelerar a ordenação dos consertos pela data e hora.
create index idx_conserto_data_hora on coserto using btree(data,hora);

--4)      Crie um índice para acelerar a busca de clientes pelo cpf.

create index idx_cliente_cpf on cliente using btree(cpf);

--5)      Crie um índice para acelerar a busca pelas primeiras 5 letras do nome dos clientes.

create index idx_cliente_5_letras on cliente using btree(substr(nome,1,5));
--6)      Crie um índice para acelerar a busca dos clientes com CPF com final XXX.XXX.XXX-55.

create index idx_cpf_final_55 on cliente using btree(cpf) where cpf like '%55';

select * from cliente