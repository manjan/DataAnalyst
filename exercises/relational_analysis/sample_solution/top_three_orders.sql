-- Find the top three orders with the highest total price

SELECT od.order_id, SUM(p.price) AS total 
  FROM order_details od
  JOIN products p 
  ON (od.prod_id = p.prod_id)
  GROUP BY order_id 
  ORDER BY total DESC
  LIMIT 3;