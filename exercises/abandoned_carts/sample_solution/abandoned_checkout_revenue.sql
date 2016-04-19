SELECT SUM(total_price) AS lost_revenue 
    FROM cart_shipping 
    WHERE steps_completed < 4;
