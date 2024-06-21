-- Conectar ao banco de dados relacional
USE relacional;

-- Inserir dados na dimensão dim_categoria (extrair e limpar dados únicos)
INSERT INTO Dimensional.dim_categoria (nome)
SELECT DISTINCT nome
FROM relacional.categoria;

-- Inserir dados na dimensão dim_cliente
INSERT INTO Dimensional.dim_cliente (nome, endereco, telefone, status, limite_credito)
SELECT nome, endereco, telefone, status, limite_credito
FROM relacional.cliente;

-- Inserir dados na dimensão dim_produto
INSERT INTO Dimensional.dim_produto (nome, categoria_id, preco)
SELECT p.nome, c.categoria_id, p.preco
FROM relacional.produto p
INNER JOIN Dimensional.dim_categoria c ON p.categoria_codigo = c.categoria_id;

-- Inserir dados na dimensão dim_tempo (usando data dos pedidos como referência)
INSERT INTO Dimensional.dim_tempo (data, ano, mes, dia)
SELECT DISTINCT data,
    EXTRACT(YEAR FROM data) AS ano,
    EXTRACT(MONTH FROM data) AS mes,
    EXTRACT(DAY FROM data) AS dia
FROM relacional.pedido;

-- Inserir dados na tabela fato_vendas
INSERT INTO Dimensional.fato_vendas (data, cliente_id, produto_id, quantidade, valor_total)
SELECT p.data, c.cliente_id, pr.produto_id, pp.quantidade, pp.quantidade * pr.preco AS valor_total
FROM relacional.pedido p
JOIN relacional.pedido_produto pp ON p.numero = pp.pedido_numero
JOIN Dimensional.dim_cliente c ON p.cliente_codigo = c.cliente_id
JOIN Dimensional.dim_produto pr ON pp.produto_codigo = pr.produto_id;