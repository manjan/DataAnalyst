SELECT TO_DATE(order_date) as o_date, SUM(price) AS revenue, SUM(price-cost) as profit
FROM products p
JOIN order_details d
ON (d.prod_id = p.prod_id)
JOIN orders o
ON (d.order_id = o.order_id)
GROUP BY o_date
ORDER BY o_date;