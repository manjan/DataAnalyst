SELECT AVG(shipping_cost) AS ship_cost
    FROM cart_shipping
    WHERE total_price >= 50000;
