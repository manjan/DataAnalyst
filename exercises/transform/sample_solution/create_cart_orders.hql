DROP TABLE IF EXISTS cart_orders;
CREATE TABLE cart_orders AS
   SELECT z.cookie, steps_completed, zipcode, 
          SUM(shipping_wt) as total_weight, 
          SUM(price) AS total_price, 
          SUM(cost) AS total_cost
     FROM cart_zipcodes z
     JOIN cart_items i
       ON (z.cookie = i.cookie)
     JOIN products p
       ON (i.prod_id = p.prod_id)
    GROUP BY z.cookie, zipcode, steps_completed;
