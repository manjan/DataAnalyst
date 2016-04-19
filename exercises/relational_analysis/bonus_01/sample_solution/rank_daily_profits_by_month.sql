SELECT o_date,
  profit,
  ROW_NUMBER() OVER (PARTITION BY YEAR(o_date),MONTH(o_date) ORDER BY profit DESC) AS n 
  FROM (
    SELECT TO_DATE(o.order_date) as o_date, SUM(price) AS revenue, SUM(price-cost) AS profit
    FROM products p
    JOIN order_details d
    ON (d.prod_id = p.prod_id)
    JOIN orders o
    ON (d.order_id = o.order_id)
    GROUP BY TO_DATE(o.order_date)
  ) r
  ORDER BY o_date;