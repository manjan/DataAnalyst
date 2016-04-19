SELECT gross_profit - total_shipping_cost AS potential_profit
   FROM (SELECT 
            SUM(total_price - total_cost) AS gross_profit, 
            SUM(shipping_cost) AS total_shipping_cost
         FROM cart_shipping
         WHERE total_price >= 50000) large_orders;
