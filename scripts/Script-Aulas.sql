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

-- alterar a estrutura da tabela
alter table cliente rename column profissao to idprofissao;

-- aqui como a coluna já está com dados do tipo varchar, não é possível alterar, 
-- necessário excluir a coluna e alterar o tipo e inserir os códigos relacionados à profissão dos clientes
alter table cliente alter column idprofissao type integer;

-- Estudante -> 1, 9, 10, 12, 15, 17
-- Engenheiro -> 2
-- Pedreiro -> 3
-- Jornalista -> 4, 5
-- Professor -> 6, 7, 8, 13
-- Null -> 11, 14

-- excluir coluna
alter table cliente drop idprofissao;

-- criar coluna idprofissao na tabela de client
alter table cliente add idprofissao integer;

-- adicionando a constraint que relaciona a chave estrangeira com a tabela mãe dela -- foreign key
alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao(idprofissao);


select c.nome, c.idprofissao  from cliente c  ;

-- atualizando a coluna idprofissao com os ids respectivos a cada cliente
update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17);
update cliente set idprofissao = 2 where idcliente = 2;
update cliente set idprofissao = 3 where idcliente = 3;
update cliente set idprofissao = 4 where idcliente in (4, 5);
update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13);

select
	c.nome,
	c.idprofissao,
	p.nome
from
	cliente c
right join profissao p 
on
	(c.idprofissao = p.idprofissao);
	

select * from cliente c;

--alterando a coluna nacionalidade para idnacionalidade e ligando como foreign key com a tabela mae dela 

alter table cliente drop nacionalidade;
alter table cliente add idnacionalidade integer;
alter table cliente add constraint fk_cln_idnacionalidade foreign key (idnacionalidade) references nacionalidade (idnacionalidade);
update
	cliente
set
	idnacionalidade = 1
where
	idcliente  in (1, 2, 3, 4, 6, 10, 11, 14);

update
	cliente
set
	idnacionalidade = 2
where
	idcliente  in (5, 7);

update
	cliente
set
	idnacionalidade = 3
where
	idcliente  = 8;

update
	cliente
set
	idnacionalidade = 4
where
	idcliente  in (9, 13);


select
	c.idcliente ,
	c.nome,
	n.idnacionalidade,
	n.nome
from
	cliente c
left join nacionalidade n 
on
	(c.idnacionalidade = n.idnacionalidade)
order by c.idcliente asc;
--
-- fazendo as mesmas alterações para a tabela de complemento
alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
alter table cliente add constraint fk_cln_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);

update
	cliente
set
	idcomplemento = 1
where
	idcliente in(1, 4, 9, 13);

update
	cliente
set
	idcomplemento = 2
where
	idcliente in(2, 3, 7);

select * from cliente c ;


alter table cliente drop bairro;
alter table cliente add idbairro integer;
alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);


update cliente set idbairro = 1 where idcliente in (1, 12, 13);
update cliente set idbairro = 2 where idcliente in (2,3,6,8,9);
update cliente set idbairro = 3 where idcliente in (4,5);
update cliente set idbairro = 4 where idcliente = 7;



select * from cliente c ;


create table uf(
	iduf integer not null,
	nome varchar(30) not null,
	sigla char(2) not null,
	
	constraint pk_ufd_idunidade_federecao primary key (iduf),
	constraint un_ufd_nome unique (nome),
	constraint un_ufd_sigla unique (sigla)
);


insert into uf (iduf, nome, sigla)
values 
	(1, 'Santa Catarina', 'SC'),
	(2, 'Paraná', 'PR'),
	(3, 'São Paulo', 'SP'),
	(4, 'Minas Gerais', 'MG'),
	(5, 'Rio Grande Sul', 'RS'),
	(6, 'Rio de Janeiro', 'RJ');


create table municipio(
	idmunicipio integer not null,
	nome varchar(30) not null,
	iduf integer not null,
	
	constraint pk_mnc_idmunicipio primary key (idmunicipio),
	constraint un_mnc_nome unique (nome),
	constraint fk_mnc_iduf foreign key (iduf) references uf (iduf)
);

insert into municipio(idmunicipio, nome, iduf )
values
	(1, 'Porto União', 1),
	(2, 'Canoinhas', 1),
	(3, 'Porto Vitória', 2),
	(4, 'General Carneiro', 2),
	(5, 'São Paulo', 3),
	(6, 'Rio de Janeiro', 6),
	(7, 'Uberlândia', 4),
	(8, 'Porto Alegre', 5),
	(9, 'União da Vitória', 2);


select * from cliente c;
alter table cliente drop municipio;
alter table cliente drop uf;

alter table cliente add idmunicipio integer;
alter table cliente add constraint fk_cliente_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

--update cliente set idmunicipio = 1 where idcliente in (1,2,10,11);
update cliente set idmunicipio = 2 where idcliente in (3,12);
update cliente set idmunicipio = 3 where idcliente in (4);
update cliente set idmunicipio = 4 where idcliente in (5);
update cliente set idmunicipio = 5 where idcliente in (6,13);
update cliente set idmunicipio = 6 where idcliente in (7);   
update cliente set idmunicipio = 7 where idcliente in (8);   
update cliente set idmunicipio = 8 where idcliente in (9);   
update cliente set idmunicipio = 9 where idcliente in (14,15);

select
	c.idcliente,
	c.nome,
	m.idmunicipio,
	m.nome
from
	cliente c
left join municipio m
on
	(c.idmunicipio = m.idmunicipio)
order by c.idcliente asc;

create table pedido(
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null
);

alter table pedido add constraint pk_pdd_idpedido primary key (idpedido);

alter table pedido add constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente);
alter table pedido add constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora  (idtransportadora);
alter table pedido add constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor  (idvendedor);


select c.idcliente, c.nome  from cliente c ;
select t.idtransportadora, t.nome  from transportadora t ;
select v.idvendedor, nome  from vendedor v ;

insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values
	(1, '2008-04-01', 1300, 1 ,1    ,1),
	(2, '2008-04-01',500, 1   ,1    ,1),
	(3, '2008-04-02',300, 11  ,2    ,6),
	(4, '2008-04-06',1000, 8  ,1    ,7),
	(5, '2008-04-06',200, 9   ,2    ,6),
	(6, '2008-04-06',1985, 10 ,1    ,6),
	(7, '2008-04-06',800, 3   ,1    ,7),
	(8, '2008-04-06',175, 3   ,null ,7),
	(9, '2008-04-07',1300, 12 ,null ,8),
	(10, '2008-04-10',200, 6  ,1    ,8),
	(11, '2008-04-15',300, 15 ,2    ,1),
	(12, '2008-04-20',500, 15 ,2    ,5),
	(13, '2008-04-20',350, 9  ,1    ,7),
	(14, '2008-04-23',300, 2  ,1    ,5),
	(15, '2008-04-25',200, 11 ,null ,5);

--tabela de relacionamento pedido e produto com chave primaria composta
create table pedido_produto(
	idpedido integer not null,
	idproduto integer not null,
	quantidade integer not null,
	valor_unitario float not null,
	
	constraint pk_pdp_idpedidoidproduto primary key (idpedido, idproduto),
	constraint pk_pdp_idpedido foreign key (idpedido) references pedido (idpedido),
	constraint pk_pdp_idproduto foreign key (idproduto) references produto (idproduto)
);

insert into pedido_produto(idpedido, idproduto, quantidade, valor_unitario)
values 
	(1, 1, 1, 800),
	(1, 2, 1, 500),
	(2, 2, 1, 500),
	(3, 4, 2, 150),
	(4, 1, 1, 800),
	(4, 3, 1, 200),
	(5, 3, 1, 200),
	(6, 1, 2, 800),
	(6, 7, 1, 35 ),
	(6, 5, 1, 200),
	(6, 4, 1, 150),
	(7, 1, 1, 800),
	(8, 7, 5, 35 ),
	(9, 1, 1, 800),
	(9, 2, 1, 500),
	(10, 5, 1, 200),
	(11, 5, 1, 200),
	(12, 2, 1, 500),
	(13, 3, 1, 200),
	(13, 4, 1, 150),
	(14, 6, 3, 100),
	(15, 3, 1, 200);



-- Funções agregadas 

-- média avg
select avg(valor) from pedido;

-- count
select count(m.idmunicipio) from municipio m;

select count (*) from municipio m;
select count(logradouro) from transportadora; 
select count(idtransportadora) from transportadora;

select * from municipio m;

select count(idmunicipio) from municipio;

select count(idmunicipio) from municipio where iduf = 2;

--max, min
select max(valor) from pedido;
select min(valor), max(valor) from pedido;

--sum
select sum(valor) from pedido;

--group by simples

select
	p.idcliente,
	sum(p.valor)
from
	pedido p
group by
	p.idcliente
order by
	p.idcliente; 

--group by simples com condição

select
	p.idcliente,
	sum(p.valor)
from
	pedido p
group by
	p.idcliente
having sum(p.valor) > 500 -- como se fosse um where  
order by
	sum(p.valor);

-- Relacionamentos com joins
-- left join, trás o resultado independemente se houver valor na tabela da direita, no caso a de profissão
select
	c.nome as "Cliente",
	coalesce( p.nome, 'N/A') as "Profissão"
from
	cliente c
left outer join profissao p on
	(c.idprofissao = p.idprofissao);

-- inner obriga que existe o relacionamento entre os dois ids que estão sendo comparados
select
	c.nome as "Cliente",
	coalesce( p.nome, 'N/A') as "Profissão"
from
	cliente c
inner join profissao p on
	(c.idprofissao = p.idprofissao);

-- right join, trás o resultado independemente se houver valor na tabela da esquerda, no caso a de cliente
select
	c.nome as "Cliente",
	coalesce( p.nome, 'N/A') as "Profissão"
from
	cliente c
right outer join profissao p on
	(c.idprofissao = p.idprofissao);


-- comandos adicionais
select * from pedido;

-- extract -> extrair dia, mes, ano de uma data
select
	data_pedido,
	extract(day
from 
	data_pedido) as dia,
	extract(month
from
	data_pedido) as mes,
	extract(year
from
	data_pedido) as ano
from
	pedido;

-- substring: extrair apenas alguns caracteres de uma string
select
	nome,
	substring(nome
from
	1 for 5),
	substring(nome, 2) as "extraindo a partir do 2 caracter em diante"
from
	cliente; 
-- converter texto para maiusculo ou minusculo
select nome, upper(nome), lower(nome)  from cliente;

-- coalesce permite colocar um valor padrão em colunas caso o conteudo delas seja null
select
	c.nome,
	c.cpf,
	coalesce(c.cpf,
	'Não informado')
from
	cliente c ;

-- case é o mesmo conceito do switch case, evaluate e etc
select
	case
		u.sigla 
		when 'PR' then 'Paraná'
		when 'SC' then 'Santa Catarina'
		else 'Outros'
	end as uf
from
	uf u ;

select * from uf;

--subconsultas

-- selecionar a data do pedido e o valor onde o valo seja maior que média dos valores de todos os pedidos

select 
	data_pedido,
	valor
from 
	pedido
where
	valor > (
	select
		avg(valor)
	from
		pedido);

-- exemplo com count
	
select
	p.data_pedido,
	p.valor,
	(select sum(pp.quantidade) from pedido_produto pp where pp.idpedido = p.idpedido  ) as total
from
	pedido p;

-- exemplo com update

update
	pedido
set
	valor = valor + ((valor * 5)/ 100)
where
	valor >
	(select
	avg(valor)
from
	pedido);

select * from pedido p;


