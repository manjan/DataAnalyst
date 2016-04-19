orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);

-- include only the months we want to analyze
recent = FILTER orders BY order_dtm matches '^2013-0[2345]-.*$';

-- include only the product we're advertising
tablets = FILTER details BY prod_id == 1274348;


-- A: Joins the two relations on the order_id field
joined = JOIN recent BY order_id, tablets BY order_id;

-- B: Creates a new relation containing the month
months = FOREACH joined GENERATE 
         SUBSTRING(order_dtm, 0, 7) AS month;

-- C: Groups by month and then count the records in each group
grouped = GROUP months BY month;
counted = FOREACH grouped GENERATE group, COUNT(months.month) AS count;

-- D: Displays the results to the screen
sorted = ORDER counted BY group;
DUMP sorted;
