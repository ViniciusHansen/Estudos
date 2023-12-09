--1)Insira todos os mecânicos e setores de uma única transação.
begin transaction;

INSERT INTO setor VALUES
(1, 'Elétrica'),
(2, 'Mecânica'),
(3, 'Funilaria'),
(4, 'Pintura');
INSERT INTO mecanico VALUES
(1, '10000100000', 'João', 40, 'América', 'Joinville', 'som', 1),
(2, '10000110000', 'Luiz', 42, 'Vila Nova', 'Joinville', 'motor', 2),
(3, '11000100000', 'Pedro', 51, 'Cobrasol', 'São José', 'câmbio', 2),
(4, '11000110000', 'Carlos', 28, 'Trindade', 'Florianópolis', 'estofado', null),
(5, '11000111000', 'Márcio', 33, 'Pantanal', 'Florianópolis', 'desamassa', 3);
end transaction;

rollback

select * from mecanico

--2)Insira os clientes e seus consertos em uma única transação. !!!!!!!!!!!!!!
begin transaction;
INSERT INTO cliente VALUES (1, '20000200000', 'Ana', 20, 'América', 'Joinville'),
(2, '20000220000', 'Paulo', 24, 'Saguaçú', 'Joinville'),
(3, '22000200000', 'Lucia', 30, 'Vila Nova', 'Joinville'),
(4, '11000110000', 'Carlos', 28, 'Trindade', 'Florianópolis'),
(5, '51000110000', 'Carlos', 44, 'Centro', 'Florianópolis'),
(6, '71000111000', 'João', 38, 'Praia Comprida', 'São José'),
(7, '10000110000', 'Luiz', 42, 'Vila Nova', 'Joinville');

INSERT INTO veiculo VALUES (1, '2000010000', 'Ka', 'Ford', '2013', 1200.300, 1),
(2, '3000011000', 'Celta', 'GM', '2014', 1220.800, 2),
(3, '4100010000', 'Palio', 'Fiat', '2012', 51000.200, 3),
(4, '5100011000', 'C3', 'Citroen', '2015', 5000.700, 4),
(5, '6100011100', 'Fox', 'VW', '2011', 79000.900, 5),
(6, '7100011100', 'Palio', 'Fiat', '2010', 110000.450, 6),
(7, '7100011111', 'Gol', 'VW', '2009', 130000.500, 7);

INSERT INTO conserto VALUES (1, 1, '12/06/2014', '14:00'),
(1, 4, '13/06/2014', '10:00'),
(2, 1, '13/06/2014', '09:00'),
(2, 2, '13/06/2014', '11:00'),
(2, 3, '14/06/2014', '14:00'),
(2, 4, '14/06/2014', '17:00'),
(3, 1, '19/06/2014', '18:00'),
(3, 3, '12/06/2014', '10:00'),
(3, 4, '19/06/2014', '13:00'),
(4, 4, '20/06/2014', '13:00');
end transaction;

select * from cliente
rollback
--3)Incremente em 1 a idade dos mecânicos e clientes em uma única transação.
begin transaction;
update cliente set idade = idade + 1;
update mecanico set idade = idade + 1;
end transaction;

--4)Insira um novo setor com cods 5 e atualize os mecânicos alocados ao setor 2 para 5 em uma única transação.
begin transaction;
insert into setor values (5,'Novo setor');
update mecanico set cods = 5 where cods = 2;
end transaction;

--5)Atualize o nome das cidades dos mecânicos e clientes para maiúsculo em uma única transação.
begin transaction;
update mecanico set cidade = upper(cidade);
update cliente set nome = upper(nome);
end transaction;
select * from cliente

--6)Concatene na frente do nome dos mecânicos a abreviação 'Mec. ' e no nome do clientes a abreviação 'Cli. ' em uma única transação.
begin transaction;
update mecanico set nome = 'Mec. '||nome;
update cliente set nome = 'Cli. '||nome;
end transaction;

--7)Atualize o cods dos mecânicos alocados no setor 3 para 4 e exclua o setor de cods 3.
begin transaction;
update mecanico set cods = 4 where cods = 3;
delete from setor where cods = 3;
end transaction;
rollback

select * from setor
select * from mecanico