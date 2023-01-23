-- SGBD MySQL
-- Script para a inserção de dados nas tabelas

-- Abre o banco de dados para uso
use ecommerce;

-- Inserção de dados na tabela de Clientes
insert into cliente (pNome, mNome, uNome, cpf, endereco, numero, bairro, cidade, estado, dNascimento)
	values 	('Camila', 'Sônia', 'Silveira', '742.953.500-36', 'Quadra 1006 Sul Alameda 25', 775, 'Plano Diretor Sul', 'Palmas', 'GO', '1956-01-03'),
			('Sarah', 'Alessandra', 'Barbosa', '369.073.448-74', 'Rua Dom Aquino', 535, 'Centro', 'Campo Grande', 'MS', '1962-01-10'),
            ('Arthur', 'Sérgio Ricardo', 'Ribeiro', '384.636.458-44', 'Praça Raul Fernando Zeni', 904, 'Santa Maria Goretti', 'Porto Alegre', 'RS', '2002-01-10'),
            ('Ester', 'Kamilly', 'Galvão', '945.115.290-35', 'Travessa Um', 184, 'América', 'Aracaju', 'SE', '1996-01-13'),
            ('Valentina', 'Nair Luzia', 'Fernandes', '667.125.200-96', 'Rua Silva Ortiz', 691, 'Floresta', 'Belo Horizonte', 'MG', '1978-01-05'),
            ('Esther', 'Antonella', 'Pereira', '787.363.794-84', 'Rua São José', 182, 'Monte', 'Olinda', 'PE', '1950-01-17'),
            ('Caleb', 'Benjamin Juan', 'Pereira', '564.370.993-72', 'Rua Estrela Celeste', 294, 'Professora Araceli Souto Maior', 'Boa Vista', 'RR', '1967-01-15'),
            ('Flávia', 'Analu Julia', 'da Mota', '255.348.815-77', 'Avenida Emília da Silva Lavôr', 287, 'Caranã', 'Boa Vista', 'RR', '1974-01-02'),
            ('Benedita', 'Sarah Flávia', 'da Costa', '679.441.833-91', 'Rua Ilhas das Canárias', 172, 'Sítio dos Marcos', 'Igarassu', 'PE', '2003-01-14'),
            ('Aparecida', 'Luzia', 'da Cunha', '531.533.155-58', 'Rua João Modena', 586, 'Cruzeiro', 'Caxias do Sul', 'RS', '1962-01-09'),
            ('Fernando', 'Miguel', 'da Rocha', '886.183.961-41', 'Rua B', 975, 'Felícia', 'Vitória da Conquista', 'BA', '1957-01-15'),
            ('Cláudia', 'Olivia Isabelle', 'Teixeira', '238.957.424-65', 'Rua Rocha Pombo', 743, 'Estância', 'Recife', 'PE', '1999-01-15'),
            ('Rosa', 'Lúcia Luna', 'Figueiredo', '167.384.051-54', '1ª Travessa da Paz', 776, 'Cajazeiras', 'Salvador', 'BA', '1983-01-17'),
            ('Vinicius', 'Guilherme', 'Almada', '588.039.244-93', 'Rua do Comercio', 788, 'Povoado de Lagoa Comprida', 'Limoeiro', 'PE', '1957-01-05'),
            ('Maitê', 'Jennifer', 'Pereira', '098.091.894-43', 'Rua Belmiro de Barros', 421, 'Dois Unidos', 'Recife', 'PE', '1997-01-15');
		
-- Inserção de dados na tabela de Vendedores
insert into vendedor (localizacao)
	values	('SP'),
			('RJ'),
            ('MA'),
            ('BA'),
            ('PE'),
            ('AL'),
            ('SP'),
            ('PE'),
            ('PE'),
            ('RJ');

-- Inserção de dados na tabela de Vendedor_Pessoa_Física
insert into vendedor_pessoa_fisica (nome, cpf, idVendedor)
	values	('Letícia Emily Isis Pereira', '461.782.144-99', 5),
			('Gabriela Rosângela Cavalcanti', '694.248.364-81', 7),
			('Davi Renato Santos', '490.424.771-05', 2),
            ('Antonio Francisco Fogaça', '44.711.299-50', 3);

-- Inserção de dados na tabela de Vendedor_Pessoa_Jurídica
insert into vendedor_pessoa_juridica (cnpj, razaoSocial, nomeFantasia, idVendedor)
	values	('67.437.675/0001-73', 'Jennifer e Ayla Financeira Ltda', 'JA Finanças', 10),
			('51.051.430/0001-73', 'Bárbara e Sebastião Doces & Salgados Ltda', 'BS Doces & Salgados', 4),
            ('34.109.483/0001-89', 'Renata e Mário Filmagens ME', 'RM Stúdio', 6),
            ('24.389.645/0001-26', 'Thales e Pietro Advocacia Ltda', 'Thales e Pietro Advocacia Ltda', 1),
            ('94.185.167/0001-18', 'Yuri e Cláudio Esportes Ltda', 'CY Sports', 8),
            ('87.973.113/0001-51', 'Geraldo e Valentina Adega ME', 'G Vinhos', 9);

-- Inserção de dados na tabela de Fornecedores
insert into fornecedor (razaoSocial, nomeFantasia, cnpj, contato)
	values	('Rosa e Giovana Comercio de Bebidas Ltda', 'RG Bebidas', '75.592.107/0001-75', '(81) 2797-8954'),
			('Rayssa e Mariana Joalheria ME', 'RM Joias', '57.268.092/0001-02', '(83) 3861-1072'),
            ('Yago e Sophia Pães e Doces Ltda', 'YES Delicatesse', '47.236.844/0001-08', '(28) 2705-0871'),
            ('Roberto e Andreia Esportes Ltda', 'RA Sports', '56.858.745/0001-40', '(21) 3804-1502'),
            ('Antonella e Benjamin Esportes ME', 'A Ben Sports', '86.774.361/0001-00', '(27) 3658-5491'),
            ('Fernanda e Manuela Doces & Salgados Ltda', 'FM Guloseimas', '32.897.933/0001-10', '(11) 3778-9755'),
			('Danilo e Mariah Comercio de Bebidas Ltda', 'Comercio de Bebidas', '05.779.991/0001-76', '(91) 3667-2475'),
            ('Ana e Agatha Móveis ME', 'Móveis PE', '63.222.244/0001-39', '(81) 2760-8824'),
            ('Bernardo e Emilly Informática Ltda', 'Bee Informática', '89.802.494/0001-31', '(61) 2646-0986'),
            ('Débora e Ian Marcenaria ME', 'Dian Móveis', '93.877.315/0001-00', '(68) 3748-0935');

-- Inserção de dados na tabela de Categorias de Produtos
insert into produto_categoria (nomeCategoria)
	values	('Bebidas'),
			('Joias e Bijuterias'),
            ('Padaria'),
            ('Materiais Esportivos'),
            ('Móveis'),
            ('Informática');

-- Inserção de dados na tabela de Produtos
insert into produto (idCategoria, nome, classificacaoInfantil, avaliacao, dimensoes)
	values	(6, 'Notebook Lenovo', default, default, null),
			(4, 'Bola de basquete', default, 2.9, null),
            (5, 'Muy sofá 3 lugares', default, default, '85 x 197 x 88'),
            (6, 'Monitor Philips 23.8 pol', default, 1.8, null),
            (1, 'Aimone Vinho Rosso d’Italia', 1, 3, null),
            (3, 'Biscoito Recheado (64 UNID) Visconti 125g', default, default, null),
            (2, 'Anel Malone Dourado', 1, 2.7, null),
            (4, 'Raquete de Beach Tennis Heroes Omnia', 1, 4.1, '50 x 20'),
            (1, 'Whisky Johnnie Walker Red Label 1L', 1, default, null),
            (5, 'Escrivaninha Mesa para Computador Dubai Multimóveis Branca/rustic', 1, 1.5, '121,5 x 90 x 45'),
            (6, 'SAMSUNG, Tablet Samsung Galaxy A7 Lite WiFi', 1, 4.7, '21.2 x 12.4 x 5.8 cm'),
            (4, 'Saco de Boxe Profissional Rhino by Spank', 1, default, '90 x 90 x 70 cm'),
            (4, 'Kit com Barras de Halteres e Anilhas de Ferro Fundido - 12 Kg', 1, default, '45 x 25 x 25 cm'),
            (2, 'Conjunto brinco e colar coração prata', default, 4, null),
            (4, 'Bola Topper Slick Futsal Azul/ Preto', default, 4.5, '0.03 x 0.18 x 0.07 cm');

-- Inserção de dados na tabela de Vendedores
insert into estoque (localizacao)
	values	('SP'),
			('RJ'),
            ('DF'),
            ('BA'),
            ('PE'),
            ('AL'),
            ('PB'),
            ('SE'),
            ('ES'),
            ('PA');

-- Inserção de dados na tabela de Produto Estoque
insert into produto_estoque (idProduto, idEstoque, quantidade)
	values 	(1, 3, 100),
			(2, 2, 50),
            (3, 5, 10),
            (4, 5, 150),
            (5, 10, 100),
            (6, 9, 200),
            (7, 7, 25),
            (8, 9, 45),
            (9, 5, 110),
            (10, 5, 15),
            (11, 3, 10),
            (12, 2, 20),
            (13, 2, 5),
            (14, 7, 10),
            (15, 9, 15);

-- Inserção de dados na tabela de Produto Fornecedor
insert into produto_fornecedor (idProduto, idFornecedor, quantidade)
	values 	(1, 9, 15),
			(2, 4, 20),
            (3, 8, 10),
            (4, 9, 100),
            (5, 1, 80),
            (6, 3, 150),
            (7, 2, 5),
            (8, 5, 25),
            (9, 1, 75),
            (10, 8, 10),
            (11, 9, 5),
            (12, 4, 10),
            (13, 5, 2),
            (14, 2, 8),
            (15, 5, 7);

-- Inserção de dados na tabela de Produto Vendedor
insert into produto_vendedor (idProduto, idVendedor, quantidade)
	values 	(1, 2, default),
			(2, 3, 18),
            (3, 6, 5),
            (4, 1, 11),
            (5, 1, 4),
            (6, 3, default),
            (7, 2, 5),
            (8, 5, 5),
            (9, 1, 7),
            (10, 8, 2),
            (11, 9, 5),
            (12, 4, 8),
            (13, 10, default),
            (14, 2, 8),
            (15, 5, 7);

-- Inserção de dados na tabela de Pagamentos
insert into pagamento (valor)
	values	(1000.0),
			(150.0),
            (285.0),
            (198.0),
            (2550.0),
            (3789.0),
            (123.45),
            (768.09),
            (256.12),
            (354.89),
            (34.65),
            (1789.09),
            (678.56),
            (5645.23),
            (234.65);

-- Inserção de dados na tabela de Pagamentos Cartão
insert into pagamento_cartao (numeroCartao, titular, validade, idPagamento)
	values	('5370 2423 2916 4502', 'Alice C Teixeira', '04/27', 5),
			('4929 1436 4956 9207', 'Isabelly E A Drumond', '01/25', 1),
            ('6062 8296 0469 5175', 'Rodrigo D Carvalho', '03/24', 10),
            ('6011 4441 7096 0300', 'Elias T da Silva', '06/28', 15),
            ('4539 1948 9681 5894', 'Amanda L Fernandes', '05/27', 4),
            ('6011 0920 7538 5543', 'Leticia P Oliveira', '08/29', 11),
            ('3597 3167 9762 9568', 'Nina E Galvao', '07/28', 2),
            ('5071 3235 0415 2884', 'Bruno C E da Mata', '02/30', 8),
            ('4024 0071 2382 2701', 'Flavia R L Barbosa', '09/29', 13);

-- Inserção de dados na tabela de Pagamentos Boleto
insert into pagamento_boleto (codigoBarra, vencimento, idPagamento)
	values	('1 234567 890104', '2018-01-15', 3),
			('1 234567 890111', '2020-05-30', 6),
            ('8 546587 955842', '2020-10-01', 7),
            ('2 314587 522540', '2023-02-15', 9),
            ('9 632549 687124', '2017-08-29', 12),
            ('1 021548 796889', '2023-03-10', 14);

-- Inserção de dados na tabela de Pedidos
insert into pedido (situacao, descricao, frete, idCliente, idPagamento)
	values	('Entregue', '', 10.0, 3, 5),
			(default, '', 10.0, 6, 1),
            ('Processando', '', 10.0, 2, 6),
            (default, '', 10.0, 10, 10),
            ('Enviado', '', 10.0, 9, 2),
            ('Enviado', '', 10.0, 15, 15),
            (default, '', 10.0, 1, 7),
            (default, '', 10.0, 4, 11),
            ('Processando', '', 10.0, 8, 9),
            (default, '', 10.0, 5, 3),
            ('Enviado', '', 10.0, 13, 8),
            (default, '', 10.0, 7, 4),
            ('Entregue', '', 10.0, 12, 15),
            ('Processando', '', 10.0, 11, 12),
            (default, '', 10.0, 14, 13);
    
-- Inserção de dados na tabela de Produto Pedido
insert into produto_pedido (idProduto, idPedido, quantidade, situacao)
	values	(3, 6, 15, default),
			(15, 12, 8, default),
            (9, 7, 5, 'Sem estoque'),
            (10, 11, 10, default),
            (4, 2, 20, default),
            (8, 14, 13, default),
            (13, 1, 9, 'Sem estoque'),
            (1, 13, 8, default),
            (11, 9, 4, 'Sem estoque'),
            (14, 15, 2, default),
            (2, 3, default, default),
            (5, 8, 15, default),
            (7, 4, default, 'Sem estoque'),
            (12, 5, default, 'Sem estoque'),
            (6, 10, 6, default);

-- Mais um pedido
insert into pagamento (valor)
	values	(1499.0);
insert into pagamento_boleto (codigoBarra, vencimento, idPagamento)
	values	('1 234567 890104', '2018-01-15', 16);
insert into pedido (situacao, descricao, frete, idCliente, idPagamento)
	values	('Processando', '', 1200.0, 3, 16);

