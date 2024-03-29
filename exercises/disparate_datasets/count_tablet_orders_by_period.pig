orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);

-- include only the months we want to analyze
recent = FILTER orders BY order_dtm MATCHES '^2013-0[2345]-.*$';

-- include only the product we're advertising
tablets = FILTER details BY prod_id == 1274348;


-- TODO (A): Join the two relations on the order_id field
joined = JOIN recent by order_id,tablets by order_id;

-- TODO (B): Create a new relation containing just the month
new_rel = FOREACH joined GENERATE SUBSTRING(order_dtm,0,7) as month;

-- TODO (C): Group by month and then count the records in each group
grouped = GROUP new_rel BY month;
finals = FOREACH grouped GENERATE group, COUNT(new_rel.month);

-- TODO (D): Display the results to the screen
DUMP finals;
