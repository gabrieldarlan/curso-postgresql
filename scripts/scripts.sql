create table cliente(
	idcliente integer not null,
	nome varchar(50) not null,
	cpf char(11),
	rg varchar(15),
	data_nascimento date,
	genero char(1),
	profissao varchar(30),
	nacionalidade varchar(30),
	logradouro varchar(30),
	numero varchar(10),
	complemento varchar(30),
	bairro varchar(30),
	municipio varchar(30),
	uf varchar(30),
	observacoes text,
-- primary key
	constraint pk_cln_idcliente primary key (idcliente)
);

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
VALUES (1, 'Manoel', '88828383821', '32323', '2001-01-30', 'M', 'Estudante', 'Brasileiro', 'Rua Joaquim Nabuco', '23', 'Casa', 'Cidade Nova', 'Porto União', 'SC');


insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
VALUES (2, 'Geraldo', '12345678973', '56565', '1987-01-04', 'M', 'Engenheiro', 'Brasileira', 'Rua Das Limas', '200', 'Ap', 'Centro', 'Poro Uniao', 'SC');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values 
	(3, 'Carlos', '87732323227', '55463', '1967-10-01', 'M', 'Pedreiro', 'Brasileira', 'Rua Das Laranjeiras', '300', 'Apart.', 'Cto.', 'Canoinhas', 'SC'),
	(4, 'Adriana', '12321222122', '98777', '1989-09-10', 'F', 'Jornalista', 'Brasileira', 'Rua Das Limas', '240', 'Casa', 'São Pedro', 'Porto Vitória', 'PR'),
	(5, 'Amanda', '99982838828', '28382', '1991-03-04', 'F', 'Jorn.', 'Italiana', 'Av. Central', '100', null, 'São Pedro', 'General Carneiro', 'PR'),
	(6, 'Ângelo', '99982828181', '12323', '2000-01-01', 'M', 'Professor', 'Brasileiro', 'Av. Beira Mar', '300', null, 'Ctr.', 'São Paulo', 'SP'),
	(7, 'Anderson', null, null, null, 'M', 'Prof.', 'Italiano', 'Av. Brasil', '100', 'Apartamento', 'Santa Rosa', 'Rio d Janeiro', 'SP'),
	(8, 'Camila', '9998282828', null, '2001-10-10', 'F', 'Proferssora', 'Norte americana', 'Rua Centra', '4333', null, 'Centro', 'Porto Alegre', 'RS'),
	(9, 'Cristiano', null, null, null, 'M', 'Estudante', 'Alemã', 'Rua do Centro', '877', 'Casa', 'Centro', 'Porto Alegre', 'RS'),
	(10, 'Fabrício', '88881818181', '32323', null, 'M', 'Estudante', 'Brasileiro', null, null, null, null, 'Porto União', 'SC'),
	(11, 'Fernanda', null, null, null, 'F', null, 'Brasileira', null, null, null, null, 'Porto União', 'SC'),
	(12, 'Gilmar', '8888181881', '888', '2000-02-10', 'M', 'Estud.', null, 'Rua das Laranjeiras', '200', null, 'C. Nova', 'Canoinhas', 'SC'),
	(13, 'Diego', '1010191919', '111939', null, 'M', 'Professor', 'Alemão', 'Rua Central', '455', 'Casa', 'Cidade N.', 'São Paulo', 'SP'),
	(14, 'Jeferson', null, null, '1983-07-01', 'M', null, 'Brasileiro', null, null, null, null, 'União da Vitória', 'PR'),
	(15, 'Jessica', null, null, null, 'F', 'Estudante', null, null, null, null, null, 'União da Vitória', 'PR');
	
	
select
	count(*)
from
	cliente;

select
	*
from
	cliente c
where
	c.idcliente = 2;

select
	*
from
	cliente;

update
	cliente
set
	municipio = 'Porto Uniao'
where
	idcliente = 1;
-- select
select
	*
from
	cliente c ;

select
	c.nome,
	c.data_nascimento
from
	cliente c;
-- select colocando um apelido na coluna
select
	c.nome,
	c.data_nascimento as "Data de nascimento"
from
	cliente c;
-- concatenar colunas
select
	'CPF: ' || c.cpf || ' RG: ' || c.rg as "CPF e RG"
from
	cliente c ;
-- selecionar um número limitado de registros
select
	*
from
	cliente c
limit 3;
-- consulta selecionada
select
	c.nome,
	c.data_nascimento
from
	cliente c
where
	c.data_nascimento > '2000-01-01';

select
	c.data_nascimento
from
	cliente c
where
	c.nome = 'Gilmar';
-- usar o like
-- buscando todos os nomes que começam com a letra C
select
	c.nome
from
	cliente c
where
	c.nome like 'C%';
-- buscar clientes que tenham 'c' no nome 
select
	c.nome
from
	cliente c
where
	c.nome like '%c%';
-- buscando uma data que esteja dentro de duas datas com o comando between
select
	c.nome,
	c.data_nascimento
from
	cliente c
where
	c.data_nascimento between '1990-01-01' and '1998-01-01';
-- buscar clientes onde o rg é nulo
select
	c.nome,
	c.rg
from
	cliente c
where
	c.rg is null;
-- ordernar coluna de forma ascendente ou descendente
select
	c.nome
from
	cliente c
order by
	c.nome asc;

select
	c.idcliente,
	c.nome
from
	cliente c
order by
	c.nome desc ;

update
	cliente
set
	nome = 'Angelo'
where
	idcliente = 6;


select 
	*
from 
	cliente c ;

update cliente set nome = 'Teste' where idcliente = 1;

update 
	cliente
set 	
	nome = 'Adriano',
	genero = 'M',
	numero = '241'
where
	idcliente = 4;

insert
	into
	cliente (idcliente,
	nome)
values (16,
'João');

delete
from
	cliente
where
	idcliente = 16;

select 
	*
from 
	cliente c ;

-- criar demais tabelas
create table profissao(
	idprofissao integer not null,
	nome varchar(30) not null,
	
	constraint pk_prf_idpropfissao primary key (idprofissao),
	constraint un_prf_nome unique (nome)
);

insert into profissao (idprofissao, nome)
values
	(1, 'Estudante'),
	(2, 'Engenheiro'),
	(3, 'Pedreiro'),
	(4, 'Jornalista'),
	(5, 'Professor');

select * from profissao p;


create table nacionalidade(
	idnacionalidade integer not null,
	nome varchar(30) not null,
	
	constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
	constraint un_ncn_nome unique (nome)
);

insert into nacionalidade (idnacionalidade, nome)
values
	(1, 'Brasileira'),
	(2, 'Italiana'),
	(3, 'Norte-americana'),
	(4, 'Alemã');
	

select * from nacionalidade c;
--
--
create table complemento(
	idcomplemento integer not null,
	nome varchar(30) not null,
	
	constraint pk_cpl_idcomplemento primary key (idcomplemento),
	constraint un_cpl_nome unique (nome)
);
	
insert into complemento (idcomplemento, nome)
values
	(1, 'Casa'),
	(2, 'Apartamento');
--
--

create table bairro(
	idbairro integer not null,
	nome varchar(30) not null,
	
	constraint pk_brr_idbairro primary key (idbairro),
	constraint un_brr_nome unique (nome)
);

insert into bairro (idbairro, nome)
values
	(1, 'Cidade Nova'),
	(2, 'Centro'),
	(3, 'São Pedro'),
	(4, 'Santa Rosa');

select * from bairro b ;

