create table pessoa(
    ssn int PRIMARY KEY,
    pnome varchar(50),
    minicial varchar(50),
    unome varchar(50),
    dnasc date,
    sexo char(1),
    rua varchar(50),
    numero int,
    numapto varchar(50),
    cidade varchar(50),
    estado varchar(50),
    cep char(11)
);

create table docente(
    ssn int PRIMARY KEY references pessoa(ssn),
    salario int,
    categoria varchar(50),
    escritorio varchar(50),
    fone varchar(50)
);

create table aluno(
    ssn int PRIMARY KEY references pessoa(ssn),
    turma varchar(50)
);

create table aluno_grad(
    
);

create table faculdade(
    fnome varchar(50) PRIMARY KEY,
    reitor varchar(50),
    escritorio varchar(50)
);

create table curso(
    curso_id int PRIMARY KEY,
    unome varchar(50),
    cdesc varchar(100)
);

create table disciplina(
    disciplina_id int PRIMARY KEY,
    ano int,
    trimestre varchar(50)
);

create table instrutor_pesquisador(
    ssn_instrutor int references docente(ssn),
    ssn_aluno int references docente(ssn),
    CONSTRAINT orientador_pesquisador PRIMARY KEY (ssn_instrutor,ssn_aluno)
);

create table bolsa(
    num int PRIMARY KEY,
    titulo varchar(50),
    agencia varchar(50),
    datain date
);

create table ip(
    bolsa int PRIMARY KEY references bolsa(num),
    docente int references docente(ssn)
)

create table departamento(
    dnome varchar(50) PRIMARY KEY,
    dfone varchar(50),
    escritorio varchar(50)
);

create table chefia(
    ssn_docente int references docente(ssn),
    nome_departamento varchar(50) references departamento(dnome),
    CONSTRAINT chefe_dep PRIMARY KEY (ssn_docente, nome_departamento)
);

create table fdepto(
    departamento varchar(50) PRIMARY KEY references departamento(dnome),
    faculdade varchar(50) references faculdade(fnome)
)

create table dc(
    curso int PRIMARY KEY references curso(curso_id)
)

