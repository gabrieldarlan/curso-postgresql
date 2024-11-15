--Exercícios – consultas simples

--1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
select c.nome, c.genero, c.profissao  from cliente c order by nome desc; 

--2. Os clientes que tenham a letra “R” no nome
select c.nome from cliente c where c.nome  like '%R%' 

--3. Os clientes que o nome inicia com a letra “C”
select c.nome from cliente c where c.nome like 'C%';

--4. Os clientes que o nome termina com a letra “A”
select c.nome from cliente c where c.nome like '%a';

--5. Os clientes que moram no bairro “Centro”
select * from cliente c where c.bairro = 'Centro';

--6. Os clientes que moram em complementos que iniciam com a letra “A”
select c.complemento  from cliente c where c.complemento like 'A%';

--7. Somente os clientes do sexo feminino
select c.nome ,c.genero  from cliente c where c.genero = 'F';

--8. Os clientes que não informaram o CPF
select c.nome, c.cpf from cliente c where c.cpf is null;

--9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
select c.nome, c.profissao from cliente c order by c.profissao;

--10.Os clientes de nacionalidade “Brasileira”
select * from cliente c where c.nacionalidade ='Brasileira';

--11.Os clientes que informaram o número da residência
select * from cliente c where c.numero is not null;

--12.Os clientes que moram em Santa Catarina
select * from cliente c where c.uf = 'SC';

--13.Os clientes que nasceram entre 01/01/2000 e 01/01/2002
select c.data_nascimento from cliente c where c.data_nascimento between '2000-01-01' and '2002-01-01';

--14.O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
select
	'Nome: ' || c.nome || 'Logradouro: ' || c.logradouro || 'Número: ' || c.numero || 'Complemento: ' || c.complemento || 'Bairro: ' || c.bairro || 'Municipio: ' || c.municipio || 'UF: ' || c.uf  as "Nome e Logradouro e Número e Complemento e Bairro e Municipio e UF"
from
	cliente c;

-- comandos update e delete

--1. Insira os dados abaixo na tabela de clientes

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values      
	(16, 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', null, null, null, null, null, 'Florianópolis', 'PR' ),
	(17, 'Getúlio', null, '4631', null, 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'PR' ),
	(18, 'Sandra', null, null, null, 'M', 'Professor', 'Italiana', null, '12', 'Bloco A', null, null, null );


--2. Altere os dados do cliente Maicon
--a. O CPF para 45390569432
--b. O gênero para M
--c. A nacionalidade para Brasileira
--d. O UF para SC

update
	cliente
set
	cpf = '45390569432',
	genero = 'M',
	nacionalidade = 'Brasileira',
	uf = 'SC'
where
	idcliente = 16;


--3. Altere os dados do cliente Getúlio
--a. A data de nascimento para 01/04/1978
--b. O gênero para M
update 
	cliente
set
	data_nascimento = '1978-04-01',
	genero = 'M'
where 
	idcliente = 17;

--4. Altere os dados da cliente Sandra
--a. O gênero para F
--b. A profissão para Professora
--c. O número para 123
update 
	cliente
set
	genero = 'F',
	profissao = 'Professora',
	numero = '123'
where 
	idcliente = 18;
--
--5. Apague o cliente Maicon
--6. Apague a cliente Sandra

delete from cliente where idcliente = 16;
delete from cliente where idcliente = 18;

select * from cliente c;


--

create table fornecedor (
	idfornecedor integer not null,
	nome varchar(50) not null,
	
	constraint pk_fnc_idfornecedor primary key (idfornecedor),
	constraint un_fnc_nome unique (nome)

);


insert into fornecedor (idfornecedor, nome)
values 
	(1, 'Cap. Computadores'),
	(2, 'AA. Computadores'),
	(3, 'BB. Máquinas');



create table vendedor(
	idvendedor integer not null,
	nome varchar(50) not null,
	
	constraint pk_ved_idvendedor primary key (idvendedor),
	constraint un_ved_nome unique (nome)
);


insert into vendedor (idvendedor, nome)
values 
	(1, 'André'),
	(2, 'Alisson'),
	(3, 'José'),
	(4, 'Ailton'),
	(5, 'Maria'),
	(6, 'Suelem'),
	(7, 'Aline'),
	(8, 'Silvana');


create table transportadora(
	idtransportadora integer not null,
	idmunicipio integer not null,
	nome varchar(50) not null,
	logradouro varchar(50),
	numero varchar(10),
	
	constraint pk_trp_idtransportadora primary key (idtransportadora),
	constraint fk_trp_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio),
	constraint un_trp_nome unique (nome)
);

select 
	t.idtransportadora,
	t.idmunicipio,
	m.nome,
	t.nome,
	t.logradouro,
	t.numero
from transportadora t 
inner join municipio m
on (t.idmunicipio = m.idmunicipio);

insert
	into
	transportadora(
	idtransportadora,
	idmunicipio,
	nome,
	logradouro,
	numero
)
values
	(1, 9, 'BS. Transportes', 'Rua das Limas', '01'),
	(2, 5, 'União Transportes', null, null);



create table produto(
	idproduto integer not null,
	idfornecedor integer not null,
	nome varchar(50) not null,
	valor numeric(10,2) not null,
	
	constraint pk_prd_idproduto primary key (idproduto),
	constraint fk_prd_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);


insert into produto(idproduto, idfornecedor, nome, valor)
values
	(1,1,'Microcomputador',800),
	(2,1,'Monitor',500),
	(3,2,'Placa mãe',200),
	(4,2,'HD',150),
	(5,2,'Placa de vídeo',200),
	(6,3,'Memória RAM',100),
	(7,1,'Gabinete',800);

update produto
set valor = 35
where idproduto = 7;

select 
p.idproduto,
p.idfornecedor,
f.nome,
p.nome,
p.valor
from produto p
inner join fornecedor f
on (p.idfornecedor = f.idfornecedor);







