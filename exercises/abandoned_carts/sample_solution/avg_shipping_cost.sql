SELECT steps_completed, AVG(shipping_cost) AS ship_cost
   FROM cart_shipping  
   WHERE steps_completed = 2 OR steps_completed = 4
   GROUP BY steps_completed;
