1 - Quantidade de produtos vendidos por categoria.

SELECT dc.nome AS categoria, SUM(fv.quantidade) AS quantidade_vendida
FROM Dimensional.fato_vendas fv
JOIN Dimensional.dim_produto dp ON fv.produto_id = dp.produto_id
JOIN Dimensional.dim_categoria dc ON dp.categoria_id = dc.categoria_id
GROUP BY dc.nome
ORDER BY quantidade_vendida DESC;

2 - Quantidade de clientes considerado BONS
SELECT COUNT(*) AS quantidade_clientes_bons
FROM Dimensional.dim_cliente
WHERE status = 'bom';


3 - Quantos Pedidos foram realizados no mês de maio
SELECT COUNT(DISTINCT fv.venda_id) AS quantidade_pedidos_maio
FROM Dimensional.fato_vendas fv
JOIN Dimensional.dim_tempo dt ON fv.data = dt.data
WHERE dt.mes = 5;



4- Qual produto foi mais vendido no mês de julho:
SELECT dp.nome AS produto, SUM(fv.quantidade) AS quantidade_vendida
FROM Dimensional.fato_vendas fv
JOIN Dimensional.dim_produto dp ON fv.produto_id = dp.produto_id
JOIN Dimensional.dim_tempo dt ON fv.data = dt.data
WHERE dt.mes = 7
GROUP BY dp.nome
ORDER BY quantidade_vendida DESC
LIMIT 1;

5- Qual o valor total de vendas no mês de junho:
SELECT SUM(fv.valor_total) AS valor_total_vendas_junho
FROM Dimensional.fato_vendas fv
JOIN Dimensional.dim_tempo dt ON fv.data = dt.data
WHERE dt.mes = 6;

