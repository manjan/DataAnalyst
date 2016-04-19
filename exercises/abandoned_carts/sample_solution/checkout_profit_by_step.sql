SELECT steps_completed, AVG(total_price - total_cost) AS lost_profit
    FROM cart_shipping 
    GROUP BY steps_completed;
