-- SGBD MySQL
-- Script para consultas nas tabelas

-- Abre o banco de dados para uso
use ecommerce;

-- Listar todos os clientes
select * from cliente;

-- Listar todos os clientes do estado de Pernambuco
select * from cliente where estado = 'PE';

-- Exibe todos os clientes cujo enereço é Rua
-- Considerando que todos os endereços começam com Rua, Quadra, Avenida, etc...
select * from cliente where endereco like 'Rua%';

-- Exibe a quantidade de clientes cujo enereço é Rua
-- Considerando que todos os endereços começam com Rua, Quadra, Avenida, etc...
select count(*) as 'qClientesRua' from cliente 
    where endereco like 'Rua%';

-- Listar todos os vendedores pessoa física e suas localizações
select vpf.nome, vpf.cpf, v.localizacao from vendedor v 
	inner join vendedor_pessoa_fisica vpf on v.idVendedor=vpf.idVendedor;

-- Listar todos os vendedores pessoa jurídica e suas localizações
select vpj.razaoSocial, vpj.cnpj, v.localizacao from vendedor v 
	inner join vendedor_pessoa_juridica vpj on v.idVendedor=vpj.idVendedor;

-- Exibe a quantidade de pedidos por cliente
select c.pNome, count(*) as 'nPedidos' from cliente c 
	inner join pedido p on c.idCliente=p.idCliente
    group by c.pNome;

-- Exibe a quantidade de pedidos pagos com cartão
select count(*) 'nRegistros' from pedido pe 
	inner join pagamento_cartao pc on pe.idPagamento=pc.idPagamento;
    
-- Exibe a lista de clientes que pagaram com cartão em ordem alfabética
select concat(c.pNome, ' ', c.mNome, ' ', c.uNome) as 'nomeCompleto' from cliente c
	inner join pedido pe on c.idCliente=pe.idCliente
    inner join pagamento_cartao pc on pe.idPagamento=pc.idPagamento
    order by c.pNome;

-- Exibe a quantidade de pedidos pagos com boleto
select count(*) 'nRegistros' from pedido pe 
	inner join pagamento_boleto pb on pe.idPagamento=pb.idPagamento;

-- Exibe a lista de clientes que pagaram com boleto em ordem alfabética
select concat(c.pNome, ' ', c.mNome, ' ', c.uNome) from cliente c
	inner join pedido pe on c.idCliente=pe.idCliente
    inner join pagamento_boleto pc on pe.idPagamento=pc.idPagamento
    order by c.pNome;

-- Exibe o total de produtos por categoria
select pc.nomeCategoria, sum(pe.quantidade) as 'total' from produto p 
	inner join produto_categoria pc on p.idCategoria=pc.idCategoria
	inner join produto_estoque pe on p.idProduto=pe.idProduto
	group by pc.nomeCategoria;

-- Exibe o total de produtos por categoria ordenados pelo total
select pc.nomeCategoria, sum(pe.quantidade) as 'total' from produto p 
	inner join produto_categoria pc on p.idCategoria=pc.idCategoria
	inner join produto_estoque pe on p.idProduto=pe.idProduto
	group by pc.nomeCategoria order by total;

-- Exibe a quantidade de produtos por categoria acima de 100
select pc.nomeCategoria, sum(pe.quantidade) as 'total' from produto p 
	inner join produto_categoria pc on p.idCategoria=pc.idCategoria
	inner join produto_estoque pe on p.idProduto=pe.idProduto
	group by pc.nomeCategoria
	having total>100;

-- Exibe a quantidade de produtos por fornecedor
select f.razaoSocial, sum(pf.quantidade) as 'totalProdutos' from fornecedor f
	inner join produto_fornecedor pf on f.idFornecedor=pf.idFornecedor
	group by f.razaoSocial;

-- Exibe a quantidade de produtos estocados por localização
select e.localizacao, sum(pe.quantidade) from produto_estoque pe
	inner join estoque e on pe.idEstoque=e.idEstoque
    group by e.localizacao;

