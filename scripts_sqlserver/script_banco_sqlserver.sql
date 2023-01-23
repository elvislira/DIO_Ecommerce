-- SGBD SQL Server
-- Script para a criação do banco e das tabelas

-- Exclui o banco ecommerce, caso exista
DROP DATABASE IF EXISTS ecommerce;

-- Cria o banco ecommerce
CREATE DATABASE ecommerce;

-- Abre o banco de dados para uso
USE ecommerce;

-- Cria a tabela de Clientes
CREATE TABLE cliente (
	idCliente INT IDENTITY(1,1),
    pNome VARCHAR(10) NOT NULL,
    mNome VARCHAR(20),
    uNome VARCHAR(20),
    cpf CHAR(14) NOT NULL,
	endereco VARCHAR(30),
    numero INT,
    bairro VARCHAR(30),
    cidade VARCHAR(30),
	estado CHAR(2),
    dNascimento DATE NOT NULL,
    CONSTRAINT unique_cpf UNIQUE(cpf),
    CONSTRAINT pk_cliente PRIMARY KEY(idCliente)
);

-- Cria a tabela de Vendedores
CREATE TABLE vendedor (
	idVendedor INT IDENTITY(1,1),
    localizacao CHAR(2) NOT NULL,
    CONSTRAINT pk_vendedor PRIMARY KEY(idVendedor)
);

-- Cria a tabela de Vendedores Pessoa Física
CREATE TABLE vendedor_pessoa_fisica (
	cpf CHAR(14),
    idVendedor INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    CONSTRAINT pk_vendedor_pessoa_fisica PRIMARY KEY(cpf, idVendedor),
    CONSTRAINT fk_vendedor_pessoa_fisica_idVendedor FOREIGN KEY(idVendedor) REFERENCES vendedor
);

-- Cria a tabela de Vendedores Pessoa Jurídica
CREATE TABLE vendedor_pessoa_juridica (
	cnpj CHAR(18),
    razaoSocial VARCHAR(45) NOT NULL,
    nomeFantasia VARCHAR(45) NOT NULL,
    idVendedor INT NOT NULL,
    CONSTRAINT pk_vendedor_pessoa_juridica PRIMARY KEY(cnpj, idVendedor),
    CONSTRAINT fk_vendedor_pessoa_juridica_idVendedor FOREIGN KEY(idVendedor) REFERENCES vendedor
);

-- Cria a tabela de Fornecedores
CREATE TABLE fornecedor (
	idFornecedor INT IDENTITY(1,1),
    razaoSocial VARCHAR(45) NOT NULL,
    nomeFantasia VARCHAR(45) NOT NULL,
    cnpj CHAR(18) NOT NULL,
    contato CHAR(14) NOT NULL,
    CONSTRAINT unique_cnpj UNIQUE(cnpj),
    CONSTRAINT pk_fornecedor PRIMARY KEY(idFornecedor)
);

-- Cria a tabela de Categoria de Produtos
CREATE TABLE produto_categoria (
	idCategoria INT IDENTITY(1,1),
    nomeCategoria VARCHAR(20) NOT NULL,
    CONSTRAINT pk_produto_categoria PRIMARY KEY(idCategoria)
);

-- Cria a tabela de Produtos
CREATE TABLE produto (
	idProduto INT IDENTITY(1,1),
    idCategoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    classificacaoInfantil BOOL DEFAULT false,
    avaliacao FLOAT DEFAULT 0,
    dimensoes VARCHAR(30),
    CONSTRAINT pk_produto PRIMARY KEY(idProduto),
    CONSTRAINT fk_produto_idCategoria FOREIGN KEY(idCategoria) REFERENCES produto_categoria
);

-- Cria a tabela de Estoque
CREATE TABLE estoque (
	idEstoque INT IDENTITY(1,1),
    localizacao CHAR(2) NOT NULL,
    CONSTRAINT pk_estoque PRIMARY KEY(idEstoque)
);

-- Cria a tabela Produto_Estoque
CREATE TABLE produto_estoque (
	idProduto INT NOT NULL,
    idEstoque INT NOT NULL,
    quantidade INT DEFAULT 0,
    CONSTRAINT pk_produto_estoque PRIMARY KEY(idProduto, idEstoque),
    CONSTRAINT fk_produto_estoque_idProduto FOREIGN KEY(idProduto) REFERENCES produto,
    CONSTRAINT fk_produto_estoque_idEstoque FOREIGN KEY(idEstoque) REFERENCES estoque
);

-- Cria a tabela Produto_Fornecedor
CREATE TABLE produto_fornecedor (
	idProduto INT NOT NULL,
	idFornecedor INT NOT NULL,
    quantidade INT DEFAULT 0,
    CONSTRAINT pk_produto_fornecedor PRIMARY KEY(idProduto, idFornecedor),
    CONSTRAINT fk_produto_fornecedor_idProduto FOREIGN KEY(idProduto) REFERENCES produto,
    CONSTRAINT fk_produto_fornecedor_idFornecedor FOREIGN KEY(idFornecedor) REFERENCES fornecedor
);

-- Cria a tabela Produto_Vendedor
CREATE TABLE produto_vendedor (
	idProduto INT NOT NULL,
    idVendedor INT NOT NULL,
    quantidade INT DEFAULT 1,
    CONSTRAINT pk_produto_vendedor PRIMARY KEY(idProduto, idVendedor),
    CONSTRAINT fk_produto_vendedor_idProduto FOREIGN KEY(idProduto) REFERENCES produto,
    CONSTRAINT fk_produto_vendedor_idVendedor FOREIGN KEY(idVendedor) REFERENCES vendedor
);

-- Cria a tabela de Pagamento
CREATE TABLE pagamento (
	idPagamento INT IDENTITY(1,1),
    valor FLOAT NOT NULL,
    CONSTRAINT pk_pagamento PRIMARY KEY(idPagamento)
);

-- Cria a tabela de Pagamento Cartão
CREATE TABLE pagamento_cartao (
	numeroCartao CHAR(19) NOT NULL,
    titular VARCHAR(20) NOT NULL,
    validade CHAR(5) NOT NULL,
    idPagamento INT NOT NULL,
    CONSTRAINT pk_pagamento_cartao PRIMARY KEY(numeroCartao, idPagamento),
    CONSTRAINT fk_pagamento_cartao_idPagamento FOREIGN KEY(idPagamento) REFERENCES pagamento
);

-- Cria a tabela de Pagamento Boleto
CREATE TABLE pagamento_boleto (
	codigoBarra CHAR(15) NOT NULL,
    vencimento DATE NOT NULL,
    idPagamento INT NOT NULL,
    CONSTRAINT pk_pagamento_boleto PRIMARY KEY(codigoBarra, idPagamento),
    CONSTRAINT fk_pagamento_boleto_idPagamento FOREIGN KEY(idPagamento) REFERENCES pagamento
);

-- Cria a tabela de Pedido
CREATE TABLE pedido (
	idPedido INT IDENTITY(1,1),
    situacao VARCHAR(20) 
    	CHECK(situacao IN ('Em processamento', 'Processando', 'Enviado', 'Entregue')) 
    	DEFAULT 'Em processamento',
    descricao VARCHAR(255),
    frete FLOAT,
    idCliente INT NOT NULL,
    idPagamento INT NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY(idPedido, idCliente, idPagamento),
    CONSTRAINT fk_pedido_idCliente FOREIGN KEY(idCliente) REFERENCES cliente,
    CONSTRAINT fk_pedido_idPagamento FOREIGN KEY(idPagamento) REFERENCES pagamento
);

-- Cria o tipo enum tipo_situacao
CREATE TYPE TIPO_SITUACAO_PRODUTO_PEDIDO AS ENUM ;

-- Cria a tabela Produto_Pedido
CREATE TABLE produto_pedido (
	idProduto INT NOT NULL,
   idPedido INT NOT NULL,
   quantidade INT DEFAULT 1,
   situacao VARCHAR(15)
   	CHECK(situacao IN ('Disponível', 'Sem estoque')) 
   	DEFAULT 'Disponível',
   CONSTRAINT pk_produto_pedido PRIMARY KEY(idProduto, idPedido),
   CONSTRAINT fk_produto_pedido_idProduto FOREIGN KEY(idProduto) REFERENCES produto --,
   -- CONSTRAINT fk_produto_pedido_idPedido FOREIGN KEY(idPedido) REFERENCES pedido
);

