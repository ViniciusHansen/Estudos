-- 1)      Gatilho para impedir a inserção ou atualização de Clientes com o mesmo CPF.
-- onde: cliente
-- operações: INSERT e UPDATE
-- quando: BEFORE
-- nivel: EACH ROW

create or replace function verifica_cpf() returns trigger as
$$
begin
	if (select 1 from cliente where cpf = new.cpf) then
		raise exception 'CPF já cadastrado'
	end if;
	return new;
end;
$$
language plpgsql;

create trigger verifica_cpf before insert or update on cliente 
	for each row execute procedure verifica_cpf();


--2)      Gatilho para impedir a inserção ou atualização de Mecânicos com idade menor que 20 anos.
-- onde: mecanico
-- operações: INSERT e UPDATE
-- quando: BEFORE
-- nivel: EACH ROW
create or replace function verifica_mecanico_20() returns trigger as
$$
begin
	if (new.idade < 20) then
		raise exception 'Mecânico tem idade menor que 20 anos'
	end if;
	return new;
end;
$$
language plpgsql;
-- caso uma execption seja lançada, o comando inteiro é cancelado

create trigger verifica_mecanico_20 before insert or update on mecanico
	for each row execute procedure verifica_mecanico_20()


--3)Gatilho para atribuir um cods (sequencial) para um novo setor inserido.
-- onde: setor
-- quando: BEFORE 
-- nivel: FOR EACH ROW
-- operações: INSERT 

create sequence seq_cods start 5;


create or replace function define_cods() returns trigger as
$$
begin
	new.cods := nextval('seq_cods');
	return new;
end;
$$
language plpgsql;


create trigger define_cods before insert on setor
	for each row execute procedure define_cods()


select * from setor

insert into setor (nome) values ('setor teste')

--4)Gatilho para impedir a inserção de um mecânico ou cliente com CPF inválido.
-- onde: mecanico e cliente
-- quando: BEFORE --restrição
-- nivel: FOR EACH ROW
-- operações:  INSERT e UPDATE

create or replace function verifica_cpf() returns trigger as
$$
begin
	if(not validaCPF(new.cpf)) then
		raise exception 'CPF inválido';
	end if;
	return new;
end;
$$
language plpgsql;

create trigger verifica_cpf before insert or update on mecanico
	for each row execute procedure verifica_cpf();

create trigger verifica_cpf before insert or update on cliente
	for each row execute procedure verifica_cpf();
	
--5)Gatilho para impedir que um mecânico seja removido caso não exista
-- outro mecânico com a mesma função.
-- onde: mecanico
-- operações: DELETE e UPDATE
-- quando: BEFORE
-- nivel: FOR EACH ROW

create or replace function impedeexclusao() returns trigger as
$$
begin
	if (TG_OP = 'DELETE') then
		if ((select COUNT(codm) from mecanico
			where funcao = old.funcao) < 2) then
				raise exception 'Unico mecanico na funcao';
		end if;
	elseif (TG_OP = 'UPDATE') then
		if ((old.funcao <> new.funcao) and ((select COUNT(codm) from mecanico
		where funcao = old.funcao) < 2)) then raise exception 'Unico mecanico na funcao';
		end if;
	end if;
	return new;
end;
$$
language plpgsql;

create trigger impedeexclusao before update or delete on mecanico
	for each row execute procedure impedeexclusao() 

delete from mecanico where codm = 2

update mecanico set funcao = 'teste 1'
	where codm = 2


--6)      Gatilho que ao inserir, atualizar ou remover um mecânico,
-- reflita as mesmas modificações na tabela de Cliente. Em caso de atualização,
-- se o mecânico ainda não existir na tabela de Cliente, deve ser inserido.
-----------------------------------------------------------------------------------
-- onde: mecanico
-- quando: AFTER
-- ops: INSERT, UPDATE & DELETE
-- nivel: FOR EACH ROW

create or replace function atualizaCliente() returns trigger as
$$
begin
	if (TG_OP = 'INSERT') then
		insert into cliente values(new.*);
	elseif (IG_OP = 'DELETE') then
		delete from cliente where cpf = new.cpf;
	elseif (IG_OP = 'UPDATE') then
		if (select 1 from cliente where cpf = new.cpf) then
			update cliente set 
				nome = new.nome,
				idade = new.idade,
				endereco = new.endereco,
				cidade = new.cidade
			where cpf = new.cpf;
		else
			insert into cliente (new.*);
		endif;
	endif;
	return null;
end;
$$
language plpgsql;

create trigger atualizaCliente AFTER INSERT or UPDATE or DELETE on
	cliente FOR EACH ROW execute procedure atualizaCliente();

create sequence seq_cliente start 10;

create or replace function nwe_cods() returns trigger as
$$
begin
	new.codc = nextval('seq_cliente');
end;
$$
language plpgsql;

create trigger new_cods before insert on
	cliente for each row execute procedure new_cods();

--7) Gatilho para impedir que um conserto seja inserido na tabela Conserto
--   se o mecânico já realizou mais de 20 horas extras no mês.
------------------------------------------------------------------------------
-- onde: conserto
-- quando: BEFORE
-- ops: INSERT, UPDATE 
-- nivel: FOR EACH ROW

--cada conserto é uma hora trabalhada

CREATE OR REPLACE FUNCTION impede_mecanico() RETURNS TRIGGER AS
$$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM conserto 
        WHERE codm = NEW.codm AND EXTRACT(MONTH FROM data) = EXTRACT(MONTH FROM NEW.data)
    ) > 20 THEN
        RAISE EXCEPTION 'Mecânico já realizou mais de 20 horas extras no mês';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER impede_mecanico BEFORE INSERT OR UPDATE ON conserto
    FOR EACH ROW EXECUTE PROCEDURE impede_mecanico();



--8) Gatilho para impedir que mais de 1 conserto seja agendado no mesmo setor na mesma hora. 
---------------------------------------------------------------------------------------------
-- onde: conserto
-- quando: BEFORE
-- ops: INSERT, UPDATE 
-- nivel: FOR EACH ROW

CREATE OR REPLACE FUNCTION impede_conserto() RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM conserto AS c
        JOIN mecanico AS m ON c.codm = m.codm
        JOIN veiculo AS v ON c.codv = v.codv
        WHERE m.cods = (SELECT cods FROM mecanico WHERE codm = NEW.codm) 
          AND c.hora = NEW.hora 
          AND c.data = NEW.data
    ) THEN
        RAISE EXCEPTION 'Já existe um conserto agendado no mesmo setor na mesma hora';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER impede_conserto BEFORE INSERT OR UPDATE ON conserto
    FOR EACH ROW EXECUTE PROCEDURE impede_conserto();


