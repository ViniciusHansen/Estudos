--1)      Função para inserção de um mecânico.

create or replace function insercao_mecanico (pcodm int, pcpf varchar(50), pnome varchar(50), pidade int, pende varchar(50), pcidade varchar(50), pfuncao varchar(50), pcods int)
returns void as
$$
	insert into mecanico(codm, cpf, nome, idade, endereco, cidade, funcao, cods) values(pcodm, pcpf,pnome,pidade,pende,pcidade, pfuncao,pcods) 
$$
language sql;

--2)      Função para exclusão de um mecânico. 

create or replace function remove_mecanico (pcodm int)
returns void as
$$
	delete from mecanico where codm = pcodm
$$
language sql;


--3)      Função única para inserção, atualizar e exclusão de um cliente.

create or replace function mecanico_utils (operacao int, pcodm int, pcpf varchar(50), pnome varchar(50), pidade int, pende varchar(50), pcidade varchar(50), pfuncao varchar(50), pcods int)
returns void as
$$
begin
	if (operacao = 0) --criar
	then insert into mecanico(codm, cpf, nome, idade, endereco, cidade, funcao, cods) values(pcodm, pcpf,pnome,pidade,pende,pcidade, pfuncao,pcods);
	elsif (operacao = 1) --atualizar
	then update mecanico set cpf=pcpf, idade=pidade,endereco=pende,cidade=pcidade,funcao=pfuncao,cods=pcods where codm=pcodm;
	elsif (operacao = 2) --remove
	then delete from mecanico where codm = pcodm;
	end if;
end;
$$
language plpgsql
--4)      Função que limite o cadastro de no máximo 10 setores na oficina mecânica.
create or replace function insercao_setor(pcods int, pnome varchar(50))
returns void as
$$
begin
    if (select count(*) from setor) < 10 then
        insert into setor(cods, nome) values(pcods, pnome);
    else
        raise exception 'Limite de 10 setores atingido!';
    end if;
end;
$$
language plpgsql;

--5)      Função que limita o cadastro de um conserto apenas se o mecânico não tiver mais de 3 consertos agendados para o mesmo dia.
create or replace function insercao_conserto(pcodm int, pcodv int, pdata date, phora time)
returns void as
$$
begin
    if (select count(*) from conserto where codm = pcodm and data = pdata) < 3 then
        insert into conserto(codm, codv, data, hora) values(pcodm, pcodv, pdata, phora);
    else
        raise exception 'Mecânico já possui 3 consertos agendados para o mesmo dia!';
    end if;
end;
$$
language plpgsql;

--6)      Função para calcular a média geral de idade dos Mecânicos e Clientes.
create or replace function media_idade()
returns float as
$$
declare
    media_mecanico float;
    media_cliente float;
begin
    select avg(idade) into media_mecanico from mecanico;
    select avg(idade) into media_cliente from cliente;
    return (media_mecanico + media_cliente) / 2;
end;
$$
language plpgsql;

--7)      Função única que permita fazer a exclusão de um Setor, Mecânico, Cliente ou Veículo.
create or replace function remove_generico(tipo varchar, codigo int)
returns void as
$$
begin
    if tipo = 'setor' then
        delete from setor where cods = codigo;
    elsif tipo = 'mecanico' then
        delete from mecanico where codm = codigo;
    elsif tipo = 'cliente' then
        delete from cliente where codc = codigo;
    elsif tipo = 'veiculo' then
        delete from veiculo where codv = codigo;
    end if;
end;
$$
language plpgsql;

--8)      Considerando que na tabela Cliente apenas codc é a chave primária, faça uma função que remova clientes com CPF repetido, deixando apenas um cadastro para cada CPF. Escolha o critério que preferir para definir qual cadastro será mantido: aquele com a menor idade, que possuir mais consertos agendados, etc. Para testar a função, não se esqueça de inserir na tabela alguns clientes com este problema.
create or replace function remove_cpf_duplicado()
returns void as
$$
begin
    delete from cliente where (cpf, idade) not in (select cpf, min(idade) from cliente group by cpf);
end;
$$
language plpgsql;

--9) Função para calcular se o CPF é válido.
create or replace function valida_cpf(pcpf char(11))
returns boolean as
$$
declare
    soma int;
    resto int;
    digito1 int;
    digito2 int;
    i int;
begin
    -- Cálculo do primeiro dígito verificador
    soma := 0;
    for i in 1..9 loop
        soma := soma + cast(substring(pcpf from i for 1) as int) * (11 - i);
    end loop;
    
    resto := soma % 11;
    if resto < 2 then
        digito1 := 0;
    else
        digito1 := 11 - resto;
    end if;

    -- Cálculo do segundo dígito verificador
    soma := 0;
    for i in 1..9 loop
        soma := soma + cast(substring(pcpf from i for 1) as int) * (12 - i);
    end loop;
    soma := soma + digito1 * 2; -- Adiciona o primeiro dígito verificador multiplicado por 2
    
    resto := soma % 11;
    if resto < 2 then
        digito2 := 0;
    else
        digito2 := 11 - resto;
    end if;

    -- Verifica se os dígitos calculados são iguais aos fornecidos
    if digito1 = cast(substring(pcpf from 10 for 1) as int) and digito2 = cast(substring(pcpf from 11 for 1) as int) then
        return true;
    else
        return false;
    end if;
end;
$$
language plpgsql;

--10) Função que calcula a quantidade de horas extras de um mecânico em um mês de trabalho.
create or replace function horas_extras_mecanico(pcodm int, pmes int, pano int)
returns int as
$$
declare
    horas_trabalhadas int;
    horas_extras int;
begin
    -- Calcula o número total de consertos (horas trabalhadas) no mês e ano especificados para o mecânico
    select count(*)
    into horas_trabalhadas
    from conserto
    where codm = pcodm and extract(month from data) = pmes and extract(year from data) = pano;

    -- Calcula as horas extras
    if horas_trabalhadas > 160 then
        horas_extras := horas_trabalhadas - 160;
    else
        horas_extras := 0;
    end if;

    return horas_extras;
end;
$$
language plpgsql;

