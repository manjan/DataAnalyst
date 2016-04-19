orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);


-- TODO (A): Include only records from during the ad campaign



-- TODO (B): Find all the orders containing the advertised product



-- TODO (C): Get the details for each of those orders



-- TODO (D): Count the number of items in each order



-- TODO (E): Calculate the average number of items in each order


-- Display the final result to the screen
DUMP average;
