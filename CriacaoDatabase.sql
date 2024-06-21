-- Criação do esquema relacional
CREATE SCHEMA IF NOT EXISTS relacional;


-- Tabela Categoria
CREATE TABLE relacional.categoria (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela Produto
CREATE TABLE relacional.produto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_codigo INT REFERENCES relacional.categoria(codigo),
    preco NUMERIC(10, 2) NOT NULL
);

-- Tabela Cliente
CREATE TABLE relacional.cliente (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    status VARCHAR(10),
    limite_credito NUMERIC(10, 2) NOT NULL
);

-- Tabela Pedido
CREATE TABLE relacional.pedido (
    numero SERIAL PRIMARY KEY,
    cliente_codigo INT REFERENCES relacional.cliente(codigo),
    data DATE NOT NULL
);

-- Tabela Pedido_Produto (para o relacionamento N:M entre Pedido e Produto)
CREATE TABLE relacional.pedido_produto (
    pedido_numero INT REFERENCES relacional.pedido(numero),
    produto_codigo INT REFERENCES relacional.produto(codigo),
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido_numero, produto_codigo)
);
