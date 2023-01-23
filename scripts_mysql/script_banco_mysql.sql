-- SGBD MySQL
-- Script para a criação do banco e das tabelas

-- Exclui o banco ecommerce, caso exista
drop database if exists ecommerce;

-- Cria o banco ecommerce
create database ecommerce;

-- Abre o banco de dados para uso
use ecommerce;

-- Cria a tabela de Clientes
create table cliente (
	idCliente int auto_increment,
    pNome varchar(10) not null,
    mNome varchar(20),
    uNome varchar(20),
    cpf char(14) not null,
	endereco varchar(30),
    numero int,
    bairro varchar(30),
    cidade varchar(30),
	estado char(2),
    dNascimento date not null,
    constraint unique_cpf unique(cpf),
    constraint pk_cliente primary key(idCliente)
);

alter table cliente auto_increment=1;

-- Cria a tabela de Vendedores
create table vendedor (
	idVendedor int auto_increment,
    localizacao char(2) not null,
    constraint pk_vendedor primary key(idVendedor)
);

alter table vendedor auto_increment=1;

-- Cria a tabela de Vendedores Pessoa Física
create table vendedor_pessoa_fisica (
	cpf char(14),
    idVendedor int not null,
    nome varchar(45) not null,
    constraint pk_vendedor_pessoa_fisica primary key(cpf, idVendedor),
    constraint fk_vendedor_pessoa_fisica_idVendedor foreign key(idVendedor) references vendedor
);

-- Cria a tabela de Vendedores Pessoa Jurídica
create table vendedor_pessoa_juridica (
	cnpj char(18),
    razaoSocial varchar(45) not null,
    nomeFantasia varchar(45) not null,
    idVendedor int not null,
    constraint pk_vendedor_pessoa_juridica primary key(cnpj, idVendedor),
    constraint fk_vendedor_pessoa_juridica_idVendedor foreign key(idVendedor) references vendedor
);

-- Cria a tabela de Fornecedores
create table fornecedor (
	idFornecedor int auto_increment,
    razaoSocial varchar(45) not null,
    nomeFantasia varchar(45) not null,
    cnpj char(18) not null,
    contato char(14) not null,
    constraint unique_cnpj unique(cnpj),
    constraint pk_fornecedor primary key(idFornecedor)
);

alter table fornecedor auto_increment=1;

-- Cria a tabela de Categoria de Produtos
create table produto_categoria (
	idCategoria int auto_increment,
    nomeCategoria varchar(20) not null,
    constraint pk_produto_categoria primary key(idCategoria)
);

alter table produto_categoria auto_increment=1;

-- Cria a tabela de Produtos
create table produto (
	idProduto int auto_increment,
    idCategoria int not null,
    nome varchar(100) not null,
    classificacaoInfantil bool default false,
    avaliacao float default 0,
    dimensoes varchar(30),
    constraint pk_produto primary key(idProduto),
    constraint fk_produto_idCategoria foreign key(idCategoria) references produto_categoria
);

alter table produto auto_increment=1;

-- Cria a tabela de Estoque
create table estoque (
	idEstoque int auto_increment,
    localizacao char(2) not null,
    constraint pk_estoque primary key(idEstoque)
);

alter table estoque auto_increment=1;

-- Cria a tabela Produto_Estoque
create table produto_estoque (
	idProduto int not null,
    idEstoque int not null,
    quantidade int default 0,
    constraint pk_produto_estoque primary key(idProduto, idEstoque),
    constraint fk_produto_estoque_idProduto foreign key(idProduto) references produto,
    constraint fk_produto_estoque_idEstoque foreign key(idEstoque) references estoque
);

-- Cria a tabela Produto_Fornecedor
create table produto_fornecedor (
	idProduto int not null,
	idFornecedor int not null,
    quantidade int default 0,
    constraint pk_produto_fornecedor primary key(idProduto, idFornecedor),
    constraint fk_produto_fornecedor_idProduto foreign key(idProduto) references produto,
    constraint fk_produto_fornecedor_idFornecedor foreign key(idFornecedor) references fornecedor
);

-- Cria a tabela Produto_Vendedor
create table produto_vendedor (
	idProduto int not null,
    idVendedor int not null,
    quantidade int default 1,
    constraint pk_produto_vendedor primary key(idProduto, idVendedor),
    constraint fk_produto_vendedor_idProduto foreign key(idProduto) references produto,
    constraint fk_produto_vendedor_idVendedor foreign key(idVendedor) references vendedor
);

-- Cria a tabela de Pagamento
create table pagamento (
	idPagamento int auto_increment,
    valor float not null,
    constraint pk_pagamento primary key(idPagamento)
);

alter table pagamento auto_increment=1;

-- Cria a tabela de Pagamento Cartão
create table pagamento_cartao (
	numeroCartao char(19) not null,
    titular varchar(20) not null,
    validade char(5) not null,
    idPagamento int not null,
    constraint pk_pagamento_cartao primary key(numeroCartao, idPagamento),
    constraint fk_pagamento_cartao_idPagamento foreign key(idPagamento) references pagamento
);

-- Cria a tabela de Pagamento Boleto
create table pagamento_boleto (
	codigoBarra char(15) not null,
    vencimento date not null,
    idPagamento int not null,
    constraint pk_pagamento_boleto primary key(codigoBarra, idPagamento),
    constraint fk_pagamento_boleto_idPagamento foreign key(idPagamento) references pagamento
);

-- Cria a tabela de Pedido
create table pedido (
	idPedido int auto_increment,
    situacao enum('Em processamento', 'Processando', 'Enviado', 'Entregue') default 'Em processamento',
    descricao varchar(255),
    frete float,
    idCliente int not null,
    idPagamento int not null,
    constraint pk_pedido primary key(idPedido, idCliente, idPagamento),
    constraint fk_pedido_idCliente foreign key(idCliente) references cliente,
    constraint fk_pedido_idPagamento foreign key(idPagamento) references pagamento
);

alter table pedido auto_increment=1;

-- Cria a tabela Produto_Pedido
create table produto_pedido (
	idProduto int not null,
    idPedido int not null,
    quantidade int default 1,
    situacao enum('Disponível', 'Sem estoque') default 'Disponível',
    constraint pk_produto_pedido primary key(idProduto, idPedido),
    constraint fk_produto_pedido_idProduto foreign key(idProduto) references produto,
    constraint fk_produto_pedido_idPedido foreign key(idPedido) references pedido
);

