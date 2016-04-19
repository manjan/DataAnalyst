SELECT SUM(total_price - total_cost) AS lost_profit
    FROM cart_shipping 
    WHERE steps_completed < 4;
