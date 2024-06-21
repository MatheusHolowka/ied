1- Quantidade de produtos vendidos por categoria
SELECT c.nome AS categoria, SUM(pp.quantidade) AS quantidade_vendida
FROM relacional.pedido_produto pp
JOIN relacional.produto p ON pp.produto_codigo = p.codigo
JOIN relacional.categoria c ON p.categoria_codigo = c.codigo
GROUP BY c.nome;

2- Quantidade de clientes considerado BONS
SELECT COUNT(*) AS clientes_bons
FROM relacional.cliente
WHERE status = 'bom';

3- Quantos Pedidos foram realizados no mês de maio
SELECT COUNT(*) AS pedidos_maio
FROM relacional.pedido
WHERE EXTRACT(MONTH FROM data) = 5;

4- Qual produto foi mais vendido no mês de julho:
SELECT p.nome AS produto_mais_vendido, SUM(pp.quantidade) AS quantidade_vendida
FROM relacional.pedido_produto pp
JOIN relacional.produto p ON pp.produto_codigo = p.codigo
JOIN relacional.pedido ped ON pp.pedido_numero = ped.numero
WHERE EXTRACT(MONTH FROM ped.data) = 7
GROUP BY p.nome
ORDER BY quantidade_vendida DESC
LIMIT 1;

5- Qual o valor total de vendas no mês de junho:
SELECT SUM(p.preco * pp.quantidade) AS valor_total_vendas_junho
FROM relacional.pedido_produto pp
JOIN relacional.produto p ON pp.produto_codigo = p.codigo
JOIN relacional.pedido ped ON pp.pedido_numero = ped.numero
WHERE EXTRACT(MONTH FROM ped.data) = 6;
