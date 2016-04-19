SELECT SUM(total_price - total_cost) AS total_profit
   FROM cart_shipping
   WHERE total_price >= 50000
      AND steps_completed = 4;
