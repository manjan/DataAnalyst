orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);


-- TODO (A): Include only records from during the ad campaign
recent = FILTER orders BY order_dtm MATCHES '^2013-05-.*$';


-- TODO (B): Find all the orders containing the advertised product
temps = JOIN recent by order_id, details by order_id;
tablets = FILTER temps BY prod_id == 1274348;
recent1 = FOREACH tablets GENERATE recent::order_id as order_id;


-- TODO (C): Get the details for each of those orders
joined = JOIN recent1 by order_id,details by order_id;
new_data = FOREACH joined GENERATE recent1::order_id as order_id, details::prod_id as prod_id;
--DESCRIBE joined;

-- TODO (D): Count the number of items in each order
grouped = GROUP new_data by order_id;
counted = FOREACH grouped GENERATE group, COUNT(new_data.prod_id) as counts;
--DUMP counted;

-- TODO (E): Calculate the average number of items in each order
groupall = GROUP counted ALL;
average = FOREACH groupall GENERATE AVG(counted.counts);

-- Display the final result to the screen
DUMP average;
