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
from cliente c;

-- comandos update e delete

--1. Insira os dados abaixo na tabela de clientes

insert into
    cliente (
        idcliente,
        nome,
        cpf,
        rg,
        data_nascimento,
        genero,
        profissao,
        nacionalidade,
        logradouro,
        numero,
        complemento,
        bairro,
        municipio,
        uf
    )
values (
        16,
        'Maicon',
        '12349596421',
        '1234',
        '1965-10-10',
        'F',
        'Empresário',
        null,
        null,
        null,
        null,
        null,
        'Florianópolis',
        'PR'
    ),
    (
        17,
        'Getúlio',
        null,
        '4631',
        null,
        'F',
        'Estudante',
        'Brasileira',
        'Rua Central',
        '343',
        'Apartamento',
        'Centro',
        'Curitiba',
        'PR'
    ),
    (
        18,
        'Sandra',
        null,
        null,
        null,
        'M',
        'Professor',
        'Italiana',
        null,
        '12',
        'Bloco A',
        null,
        null,
        null
    );

--2. Altere os dados do cliente Maicon
--a. O CPF para 45390569432
--b. O gênero para M
--c. A nacionalidade para Brasileira
--d. O UF para SC

update cliente
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
update cliente
set
    data_nascimento = '1978-04-01',
    genero = 'M'
where
    idcliente = 17;

--4. Altere os dados da cliente Sandra
--a. O gênero para F
--b. A profissão para Professora
--c. O número para 123
update cliente
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

--Exercícios – consultas simples
--1. Somente o nome de todos os vendedores em ordem alfabética.
select v.nome from vendedor v order by v.nome asc;
--2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
select p.nome, p.valor as "preço"
from produto p
where
    p.valor > 200
order by p.valor asc;

--3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
select p.nome as "Nome do Produto", p.valor as "Preço", p.valor + (0.10 * p.valor) as "Preço reajustado"
from produto p
order by p.nome asc;

--4. Os municípios do Rio Grande do Sul.
select m.nome
from uf u
    inner join municipio m on (u.iduf = m.iduf)
where
    m.iduf = 5;

--5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.
select *
from pedido p
where
    p.data_pedido between '2008-04-10' and '2008-04-10';
--6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
select * from pedido p where p.valor between 1000 and 1500;
--7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
--select * from pedido p where p.valor not in (100, 500);
select * from pedido p where p.valor not between 100 and 500;
--8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.
select v.nome, p.valor
from vendedor v
    inner join pedido p on (v.idvendedor = p.idvendedor)
where
    v.idvendedor = 1
order by p.valor desc;
--9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.
select c.nome, p.valor
from cliente c
    inner join pedido p on (c.idcliente = p.idcliente)
where
    c.idcliente = 1
order by p.valor desc;
--10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
select p.valor as "Valor do pedido", c.nome as "Nome do(a) cliente", v.nome as "Nome do(a) vendedor(a)"
from pedido p
    inner join cliente c on (p.idcliente = c.idcliente)
    inner join vendedor v on (p.idvendedor = v.idvendedor)
where
    p.idcliente = 15
    and p.idvendedor = 1;

--11. Os pedidos que foram transportados pela transportadora União Transportes.
select * from pedido p;

select * from transportadora t;

select *
from pedido p
    inner join transportadora t on (
        p.idtransportadora = t.idtransportadora
    )
where
    p.idtransportadora = 2;
--12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline. Maria = 5 e Aliene = 7
select * from vendedor v;

select *
from pedido p
    inner join vendedor v on (p.idvendedor = v.idvendedor)
where
    p.idvendedor = 5
    or p.idvendedor = 7;

--13. Os clientes que moram em União da Vitória = 9 ou Porto União = 1.
select *
from cliente c
    inner join municipio m on (m.idmunicipio = c.idmunicipio)
where
    c.idmunicipio = 1
    or c.idmunicipio = 9;
--14. Os clientes que não moram em União da Vitória e nem em Porto União.
select *
from cliente c
    inner join municipio m on (m.idmunicipio = c.idmunicipio)
where
    c.idmunicipio not in(1, 9);
--15. Os clientes que não informaram o logradouro
select * from cliente c where c.logradouro is null;
--16. Os clientes que moram em avenidas.

select * from cliente c where c.logradouro like 'Av.%';
--17. Os vendedores que o nome começa com a letra S.
select * from vendedor v where v.nome like 'S%';
--18. Os vendedores que o nome termina com a letra A.
select v.nome from vendedor v where v.nome like '%a';

--19. Os vendedores que o nome não começa com a letra A.
select v.nome from vendedor v where v.nome not like 'A%';
--20. Os municípios que começam com a letra P e são de Santa Catarina.
select *
from municipio m
    inner join uf u on (m.iduf = u.iduf)
where
    m.iduf = 1
    and m.nome like 'P%';
--21. As transportadoras que informaram o endereço.
select * from transportadora t where t.logradouro is not null;
--22. Os itens do pedido 01.
select pp.quantidade, pp.valor_unitario, p.nome
from pedido_produto pp
    inner join produto p on (pp.idproduto = p.idproduto)
where
    pp.idpedido = 1;
--23. Os itens do pedido 06 ou do pedido 10.
select pp.idpedido, pp.quantidade, pp.valor_unitario, p.nome
from pedido_produto pp
    inner join produto p on (pp.idproduto = p.idproduto)
where
    pp.idpedido = 6
    or pp.idpedido = 10;

--Exercícios – funções agregadas
--1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00.
select * from vendedor v;

select * from pedido p;

select p.idvendedor, avg(p.valor)
from pedido p
group by
    p.idvendedor
having
    avg(p.valor) > 200;

--2. Os vendedores que venderam mais que R$ 1500,00.
select idvendedor, sum(valor)
from pedido
group by
    idvendedor
having
    sum(valor) > 1500
order by idvendedor;
--3. O somatório das vendas de cada vendedor.
select p.idvendedor, sum(valor) as Valor
from pedido p
group by
    p.idvendedor
order by p.idvendedor;
--4. A quantidade de municípios.
select count(*) from municipio m;
--5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
select * from uf u;

select * from municipio m;

select count(m.idmunicipio), m.iduf
from municipio m
group by
    m.iduf
having
    m.iduf = 1
    or m.iduf = 2;
--6. A quantidade de municípios por estado.
select count(m.idmunicipio) as "Quantidade de Municipio por estado", u.nome, m.iduf
from municipio m
    inner join uf u on (m.iduf = u.iduf)
group by
    m.iduf,
    u.nome;
--7. A quantidade de clientes que informaram o logradouro.
select count(*) from cliente c where c.logradouro is not null;
--8. A quantidade de clientes por município.
select count(c.idcliente), c.idmunicipio, m.nome, m.iduf
from cliente c
    inner join municipio m on (m.idmunicipio = c.idmunicipio)
group by
    c.idmunicipio,
    m.nome,
    m.iduf;

select c.idcliente, c.idmunicipio from cliente c;
--9. A quantidade de fornecedores.
select count(*) from fornecedor f;
--10. A quantidade de produtos por fornecedor.
select count(idproduto), idfornecedor
from produto
group by
    idfornecedor;

--11. A média de preços dos produtos do fornecedor Cap. Computadores = 1.
select avg(p.valor) as "A media de preços dos produtos do fornecedor Cap. Computadores"
from produto p
where
    p.idfornecedor = 1;

select * from produto p;

select * from fornecedor f;
--12. O somatório dos preços de todos os produtos.
select sum(valor) as "Soma dos precos de todos os produtos"
from produto p;
--13. O nome do produto e o preço somente do produto mais caro.
select p.nome, p.valor
from produto p
where
    p.valor = (
        select max(p2.valor)
        from produto p2
    );
--14. O nome do produto e o preço somente do produto mais barato.
select p.nome, p.valor
from produto p
where
    p.valor = (
        select min(p2.valor)
        from produto p2
    );
--15. A média de preço de todos os produtos.
select avg(p.valor) from produto p;
--16. A quantidade de transportadoras.
select count(*) from transportadora t;
--17. A média do valor de todos os pedidos.
select avg(valor) from pedido;
--18. O somatório do valor do pedido agrupado por cliente.
select * from pedido p;

select sum(p.valor), p.idcliente
from pedido p
group by
    p.idcliente;
--19. O somatório do valor do pedido agrupado por vendedor.
select sum(p.valor), p.idvendedor
from pedido p
group by
    p.idvendedor;
--20. O somatório do valor do pedido agrupado por transportadora.
select sum(p.valor), p.idtransportadora
from pedido p
group by
    p.idtransportadora;
--21. O somatório do valor do pedido agrupado pela data.
select sum(p.valor), p.data_pedido
from pedido p
group by
    p.data_pedido;

--22. O somatório do valor do pedido agrupado por cliente, vendedor e transportadora.

select sum(p.valor), p.idcliente, p.idvendedor, p.idtransportadora
from pedido p
group by
    p.idcliente,
    p.idvendedor,
    p.idtransportadora;

--23. O somatório do valor do pedido que esteja entre 01/04/2008 e 10/12/2009 e que seja maior que R$ 200,00.
select sum(p.valor), p.data_pedido
from pedido p
where
    p.data_pedido between '2008-04-01' and '2009-12-10'
group by
    p.data_pedido
having
    sum(p.valor) > 200
order by p.data_pedido;
--24. A média do valor do pedido do vendedor André = 1.
select * from pedido p;

select avg(p.valor), p.idvendedor, v.nome
from pedido p
    inner join vendedor v on (p.idvendedor = v.idvendedor)
where
    p.idvendedor = 1
group by
    p.idvendedor,
    v.nome;
--25. A média do valor do pedido da cliente Jéssica.
select avg(p.valor), p.idcliente, c.nome
from pedido p
    inner join cliente c on (p.idcliente = c.idcliente)
where
    p.idcliente = 15
group by
    p.idcliente,
    c.nome;

select * from cliente c;
--26. A quantidade de pedidos transportados pela transportadora BS. Transportes = 1.
select count(p.idpedido), p.idtransportadora
from pedido p
where
    idtransportadora = 1
group by
    p.idtransportadora;

select * from transportadora t;
--27. A quantidade de pedidos agrupados por vendedor.
select count(p.idpedido) as "Quantidade de pedidos, por vendedor", p.idvendedor
from pedido p
group by
    p.idvendedor;
--28. A quantidade de pedidos agrupados por cliente.
select count(p.idpedido) as "Quantidade de pedidos, por cliente", p.idcliente
from pedido p
group by
    p.idcliente;
--29. A quantidade de pedidos entre 15/04/2008 e 25/04/2008.
select count(p.idpedido) as "Quantidade de pedidos"
from pedido p
where
    p.data_pedido between '2008-04-15' and '2008-04-25';
--30. A quantidade de pedidos que o valor seja maior que R$ 1.000,00.
select count(*) as quantidade_pedidos
from pedido p
where
    p.valor > 1000;
--31. A quantidade de microcomputadores = 1 vendida.
select * from pedido p;

select * from produto p;

select
    count(pp.quantidade) as quantidade_computadores_vendidos
from pedido_produto pp
where
    pp.idproduto = 1;

select * from pedido_produto pp;
--32. A quantidade de produtos vendida agrupado por produto.
select
    count(pp.quantidade) as quantidade_de_produtos_vendidos,
    pp.idproduto,
    p.nome
from pedido_produto pp
    inner join produto p on (p.idproduto = pp.idproduto)
group by
    pp.idproduto,
    p.nome;
--33. O somatório do valor dos produtos dos pedidos, agrupado por pedido
select * from pedido_produto pp;

select sum(pp.valor_unitario) as valor_unitario, pp.idpedido
from pedido_produto pp
group by
    pp.idpedido
order by pp.idpedido;
--34. A quantidade de produtos agrupados por pedido.
select count(pp.idproduto), pp.idpedido
from pedido_produto pp
group by
    pp.idpedido;
--35. O somatório do valor total de todos os produtos do pedido.
select
    sum(pp.valor_unitario) as valor_total_de_todos_os_pedidos
from pedido_produto pp;
--36. A média dos produtos do pedido 6.
select avg(pp.valor_unitario)
from pedido_produto pp
where
    pp.idpedido = 6;
--37. O valor do maior produto do pedido.
select max(pp.valor_unitario) from pedido_produto pp;
--38. O valor do menor produto do pedido.
select min(pp.valor_unitario) from pedido_produto pp;
--39. O somatório da quantidade de produtos por pedido.
select pp.idpedido, sum(pp.quantidade) as "Total de quantidade por pedido"
from pedido_produto pp
group by
    pp.idpedido;
--40. O somatório da quantidade de todos os produtos do pedido.

select sum(valor_unitario) from pedido_produto pp;

--Exercícios – joins
--1. O nome do cliente, a profissão, a nacionalidade, o logradouro, o número, o complemento, o bairro, o município e a unidade de federação.
select
    c.nome as cliente,
    p.nome as profissao,
    n.nome as nacionalidade,
    c.logradouro,
    c.numero,
    comp.nome as complemento,
    b.nome as bairro,
    m.nome as municipio,
    u.nome as unidade_federativa
from
    cliente c
    left outer join profissao p on (c.idprofissao = p.idprofissao)
    left outer join bairro b on (c.idbairro = b.idbairro)
    left outer join municipio m on (c.idmunicipio = m.idmunicipio)
    left outer join uf u on (m.iduf = u.iduf)
    left outer join nacionalidade n on (
        c.idnacionalidade = n.idnacionalidade
    )
    left outer join complemento comp on (
        c.idcomplemento = comp.idcomplemento
    );

--2. O nome do produto, o valor e o nome do fornecedor.
select
    p.nome as produto,
    p.valor as valor_produto,
    f.nome as fornecedor
from produto p
    left outer join fornecedor f on (
        p.idfornecedor = f.idfornecedor
    );

--3. O nome da transportadora e o município.
select t.nome as transportadora, m.nome as municipio
from transportadora t
    left outer join municipio m on (t.idmunicipio = m.idmunicipio);

--4. A data do pedido, o valor, o nome do cliente, o nome da transportadora e o nome do vendedor.
select
    to_char (p.data_pedido, 'DD/MM/YYYY') as data_pedido, ---> formatar data durante a consulta sql
    p.valor,
    c.nome as cliente,
    t.nome as transportadora,
    v.nome as vendedor
from
    pedido p
    left outer join cliente c on (p.idcliente = c.idcliente)
    left outer join transportadora t on (
        p.idtransportadora = t.idtransportadora
    )
    left outer join vendedor v on (p.idvendedor = v.idvendedor);
--5. O nome do produto, a quantidade e o valor unitário dos produtos do pedido.
select p.nome as produto, pp.quantidade, pp.valor_unitario
from produto p
    left outer join pedido_produto pp on (p.idproduto = pp.idproduto);

select * from pedido_produto pp;

select * from pedido p;
--6. O nome dos clientes e a data do pedido dos clientes que fizeram algum pedido (ordenado pelo nome do cliente).
select c.nome as cliente, to_char (p.data_pedido, 'DD/MM/YYYY') as data_pedido
from cliente c
    inner join pedido p on (c.idcliente = p.idcliente)
order by c.nome asc;
--7. O nome dos clientes e a data do pedido de todos os clientes, independente se tenham feito pedido (ordenado pelo nome do cliente).
select c.nome as cliente, to_char (p.data_pedido, 'DD/MM/YYYY') as data_pedido
from cliente c
    left outer join pedido p on (c.idcliente = p.idcliente)
order by c.nome asc;
--8. O nome da cidade e a quantidade de clientes que moram naquela cidade.
select count(c.idcliente), m.nome as cidade
from cliente c
    left outer join municipio m on (c.idmunicipio = m.idmunicipio)
group by
    m.nome;

select count(c.idcliente), m.nome as cidade
from cliente c
    inner join municipio m on (c.idmunicipio = m.idmunicipio)
group by
    m.nome;

select * from cliente c;
--9. O nome do fornecedor e a quantidade de produtos de cada fornecedor.
select * from pedido_produto pp;

select * from produto p;

select * from fornecedor f;

select f.nome as fornecedor, count(pp.quantidade) as "quantidade de produtos por fornecedor"
from
    fornecedor f
    left outer join produto p on (
        f.idfornecedor = p.idfornecedor
    )
    left outer join pedido_produto pp on (p.idproduto = pp.idproduto)
group by
    f.nome;

select f.nome as fornecedor, count(p.idfornecedor) as "quantidade de produtos por fornecedor"
from fornecedor f
    left outer join produto p on (
        f.idfornecedor = p.idfornecedor
    )
group by
    f.nome;

-- aa. computadores = 10 produtos codigo 2
--10.O nome do cliente e o somatório do valor do pedido (agrupado por cliente).
select * from pedido p;

select c.nome as cliente, coalesce(sum(p.valor), 0) as "valor total do pedido por cliente"
from cliente c
    left outer join pedido p on (c.idcliente = p.idcliente)
group by
    c.nome;

--11.O nome do vendedor e o somatório do valor do pedido (agrupado por vendedor).
select v.nome as vendedor, coalesce(sum(p.valor), 0) as "valor total do pedido por vendedor"
from vendedor v
    left outer join pedido p on (v.idvendedor = p.idvendedor)
group by
    v.nome;

--12.O nome da transportadora e o somatório do valor do pedido (agrupado por transportadora).
select t.nome as vendedor, coalesce(sum(p.valor), 0) as "valor total do pedido por transportadora"
from transportadora t
    left outer join pedido p on (
        t.idtransportadora = p.idtransportadora
    )
group by
    t.nome;

--13.O nome do cliente e a quantidade de pedidos de cada um (agrupado por cliente).
select c.nome as cliente, count(p.idpedido) as " quantidade de pedidos por cliente"
from cliente c
    left outer join pedido p on (c.idcliente = p.idcliente)
group by
    c.nome;

select * from pedido p;
--14.O nome do produto e a quantidade vendida (agrupado por produto).
select * from produto p;

select * from pedido p;

select * from pedido_produto pp;

select p.nome, count(pp.quantidade) as "Quantidade de produtos vendida"
from produto p
    left outer join pedido_produto pp on (p.idproduto = pp.idproduto)
group by
    p.nome;

--15.A data do pedido e o somatório do valor dos produtos do pedido (agrupado pela data do pedido).
select to_char (p.data_pedido, 'DD/MM/YYYY') as data_pedido, sum(pp.valor_unitario) as "total do valor do pedido por data"
from pedido p
    left outer join pedido_produto pp on (p.idpedido = pp.idpedido)
group by
    p.data_pedido;
--16.A data do pedido e a quantidade de produtos do pedido (agrupado pela data do pedido).
select to_char (p.data_pedido, 'DD/MM/YYYY') as data_pedido, count(pp.quantidade) as "quantidade de pedidos por data"
from pedido_produto pp
    left outer join pedido p on (p.idpedido = pp.idpedido)
group by
    p.data_pedido;

--Exercícios – comandos adicionais
--1. O nome do cliente e somente o mês de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.

select c.nome, coalesce(
        extract(
            month
            from c.data_nascimento
        ), 0
    )
from cliente c;

--2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não
--informado”.

select
    c.nome,
    case extract(
            month
            from c.data_nascimento
        )
        when 1 then 'Janeiro'
        when 2 then 'Fevereiro'
        when 3 then 'Março'
        when 4 then 'Abril'
        when 5 then 'Maio'
        when 6 then 'Junho'
        when 7 then 'Julho'
        when 8 then 'Agosto'
        when 9 then 'Setembro'
        when 10 then 'Outubro'
        when 11 then 'Novembro'
        when 12 then 'Dezembro'
        else 'Não informado'
    end
from cliente c;
--3. O nome do cliente e somente o ano de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
select c.nome, coalesce(
        extract(
            year
            from c.data_nascimento
        ), 0
    )
from cliente c;

--4. O caractere 5 até o caractere 10 de todos os municípios.

select substring( m.nome from 5 for 10 ) as cidade from municipio m;
--5. O nome de todos os municípios em letras maiúsculas.
select upper(m.nome) as cidade from municipio m;
--6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”, senão mostrar “Feminino”.
select
    c.nome,
    case c.genero
        when 'M' then 'Masculino'
        else 'Feminino'
    end
from cliente c;
--7. O nome do produto e o valor. Caso o valor seja maior do que R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.

select
    nome,
    valor,
    case
        when valor >= 500 then 'Acima ou igual a 500'
        else 'Abaixo de 500'
    end as faixa
from produto;

--Exercícios - subconsultas
--1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel = 1.
select nome, idmunicipio
from cliente
where
    idmunicipio = (
        select idmunicipio
        from cliente
        where
            nome = 'Manoel'
    )
    and idcliente <> 1;

--2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
select data_pedido, valor
from pedido
where
    valor < (
        select avg(valor)
        from pedido
    );
--3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
select pdd.data_pedido, pdd.valor, cln.nome as cliente, vnd.nome as vendedor, (
        select sum(pdp.quantidade)
        from pedido_produto pdp
        where
            pdp.idpedido = pdd.idpedido
    ) as "quantidade de pedidos por cliente"
from
    pedido pdd
    left outer join cliente cln on pdd.idcliente = cln.idcliente
    left outer join vendedor vnd on pdd.idvendedor = vnd.idvendedor
where (
        select sum(pdp.quantidade)
        from pedido_produto pdp
        where
            pdp.idpedido = pdd.idpedido
    ) >= 2;
--4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes = 1 mun 9.
select c.nome, c.idmunicipio
from cliente c
where
    c.idmunicipio = (
        select t.idmunicipio
        from transportadora t
        where
            t.idtransportadora = 1
    );

--5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.

select c.nome, c.idmunicipio
from cliente c
where
    c.idmunicipio in (
        select t.idmunicipio
        from transportadora t
    );

select distinct (c.idmunicipio) from cliente c;
--6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos daquele pedido seja maior que a média do valor total
--de todos os produtos de todos os pedidos.

update pedido
set
    valor = valor + ((valor * 5) / 100)
where (
        select sum(pdp.valor_unitario)
        from pedido_produto pdp
        where
            pdp.idpedido = pedido.idpedido
    ) > (
        select avg(valor_unitario)
        from pedido_produto
    )

select * from pedido;

--7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.

select cln.nome, (
        select count(idpedido)
        from pedido pdd
        where
            pdd.idcliente = cln.idcliente
    ) as total
from cliente cln;

--8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.

select cln.nome as cliente, count(pdd.idpedido) as total
from pedido pdd
    left outer join cliente cln on pdd.idcliente = cln.idcliente
group by
    cln.nome;