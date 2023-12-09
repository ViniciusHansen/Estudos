--1 a

-- onde: trabalha_em
-- quando: BEFORE
-- ops: INSERT, UPDATE 
-- nivel: FOR EACH ROW

CREATE OR REPLACE FUNCTION empregado_projeto()
RETURNS TRIGGER AS $$
BEGIN
    -- Aqui vai a lógica da sua função.
    -- Por exemplo, você pode usar NEW e OLD para acessar os valores das colunas antes e depois da mudança.
    if (select dno from empregado e where e.ssn = new.essn <> -- dep do func.
        select dnum from projeto p where p.pnumero = new.pno)-- dep do projeto
        then 
            RAISE EXCEPTION 'Um empregado não pode ser alocado em um projeto de outro departamento.';
    end if;
    RETURN NEW; -- ou RETURN OLD; dependendo do caso
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_empregado_projeto
BEFORE INSERT OR UPDATE OR DELETE ON trabalha_em
FOR EACH ROW EXECUTE PROCEDURE empregado_projeto;


--1 b

-- onde: trabalha_em
-- quando: AFTER
-- ops: INSERT, UPDATE, DELETE
-- nivel: FOR EACH ROW

CREATE OR REPLACE FUNCTION salario_projeto()
RETURNS TRIGGER AS $$
BEGIN
    if ( TG_OP = 'INSERT') then
        update empregado set salario = salario * 1.02
        where ssn = new.essn;
        RETURN NEW;
    elsif (TG_OP = 'DELETE') then
        update empregado set salario = salario * 0.98
        where ssn = old.essn
        RETURN OLD;
    end if;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_salario_projeto
BEFORE INSERT ON trabalha_em
FOR EACH ROW EXECUTE PROCEDURE salario_projeto;

CREATE TRIGGER trigger_salario_projeto_2
BEFORE DELETE ON trabalha_em
FOR EACH ROW EXECUTE PROCEDURE salario_projeto;

--1 c
-- onde: projeto
-- quando: BEFORE
-- ops: INSERT, UPDATE, DELETE
-- nivel: FOR EACH ROW

CREATE OR REPLACE FUNCTION verifica_qtd_projetos_empregados()
RETURNS TRIGGER AS $$
DECLARE
    qtd_empregados INT;
    qtd_projetos INT;
BEGIN
    -- Conta a quantidade de empregados no departamento
    SELECT COUNT(*) INTO qtd_empregados
    FROM EMPREGADO
    WHERE DNO = NEW.DNUM;

    -- Conta a quantidade de projetos no departamento
    SELECT COUNT(*) INTO qtd_projetos
    FROM PROJETO
    WHERE DNUM = NEW.DNUM;

    -- Verifica se a quantidade de empregados é menor que o dobro de projetos existentes
    IF qtd_empregados < (2 * qtd_projetos) THEN
        RAISE EXCEPTION 'Não é possível criar um novo projeto, pois o departamento % tem menos que o dobro de empregados comparado à quantidade de projetos.', NEW.DNUM;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER verifica_qtd_projetos_antes_de_criar
BEFORE INSERT ON PROJETO
FOR EACH ROW EXECUTE FUNCTION verifica_qtd_projetos_empregados();
