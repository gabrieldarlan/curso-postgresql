--Exercícios – consultas simples

--1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
select c.nome, c.genero, c.profissao
from cliente c
order by nome desc;
--2. Os clientes que tenham a letra “R” no nome
select c.nome from cliente c where c.nome like '%R%'
--3. Os clientes que o nome inicia com a letra “C”
select c.nome from cliente c where c.nome like 'C%';

--4. Os clientes que o nome termina com a letra “A”
select c.nome from cliente c where c.nome like '%a';

--5. Os clientes que moram no bairro “Centro”
select * from cliente c where c.bairro = 'Centro';

--6. Os clientes que moram em complementos que iniciam com a letra “A”
select c.complemento from cliente c where c.complemento like 'A%';

--7. Somente os clientes do sexo feminino
select c.nome, c.genero from cliente c where c.genero = 'F';

--8. Os clientes que não informaram o CPF
select c.nome, c.cpf from cliente c where c.cpf is null;

--9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
select c.nome, c.profissao from cliente c order by c.profissao;

--10.Os clientes de nacionalidade “Brasileira”
select * from cliente c where c.nacionalidade = 'Brasileira';

--11.Os clientes que informaram o número da residência
select * from cliente c where c.numero is not null;

--12.Os clientes que moram em Santa Catarina
select * from cliente c where c.uf = 'SC';

--13.Os clientes que nasceram entre 01/01/2000 e 01/01/2002
select c.data_nascimento
from cliente c
where
    c.data_nascimento between '2000-01-01' and '2002-01-01';

--14.O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
select 'Nome: ' || c.nome || 'Logradouro: ' || c.logradouro || 'Número: ' || c.numero || 'Complemento: ' || c.complemento || 'Bairro: ' || c.bairro || 'Municipio: ' || c.municipio || 'UF: ' || c.uf as "Nome e Logradouro e Número e Complemento e Bairro e Municipio e UF"
from cliente c