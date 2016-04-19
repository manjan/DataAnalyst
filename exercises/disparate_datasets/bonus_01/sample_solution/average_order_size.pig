orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);


-- A: Includes only records from during the ad campaign
from_may = FILTER orders BY order_dtm MATCHES '^2013-05-.*$';



-- B: Finds all the orders containing the advertised product
joined = JOIN from_may BY order_id, details BY order_id;

filtered = FILTER joined BY details::prod_id == 1274348;

orders_with_product = FOREACH filtered GENERATE 
                      from_may::order_id as order_id;


-- C: Gets the details for each of those orders
joined = JOIN orders_with_product BY order_id, details BY order_id;

flat = FOREACH joined GENERATE orders_with_product::order_id AS order_id, 
                               details::prod_id AS prod_id;


-- D: Counts the number of items in each order
grouped = GROUP flat BY order_id;

counted = FOREACH grouped GENERATE group,
             COUNT(flat.prod_id) as num_items;


-- E: Calculates the average number of items in each order
grouped_all = GROUP counted ALL;
average = FOREACH grouped_all GENERATE AVG(counted.num_items);


-- Display the final result to the screen
DUMP average;
