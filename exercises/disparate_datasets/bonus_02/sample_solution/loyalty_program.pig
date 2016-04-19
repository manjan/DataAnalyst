-- load the data sets
orders = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

details = LOAD '/dualcore/order_details' AS (order_id:int,
             prod_id:int);

products = LOAD '/dualcore/products' AS (prod_id:int,
             brand:chararray,
             name:chararray,
             price:int,
             cost:int,
             shipping_wt:int);



-- Include only records for sales in 2012
that_year = FILTER orders BY order_dtm MATCHES '^2012-.*$';


-- Find customers with at least five orders that year
grouped = GROUP that_year BY cust_id;

counted = FOREACH grouped GENERATE group,
             that_year.order_id AS order_id,
             COUNT(that_year.cust_id) AS num_orders;

qualified = FILTER counted BY num_orders >= 5;


-- Use FLATTEN to create a new record for each order
flat = FOREACH qualified GENERATE group AS cust_id,
             FLATTEN(order_id) AS order_id;

/*
 * Join these order records with details about the order so
 * we'll know which products were purchased, and then join
 * that with product info so we can calculate total price
 */
order_info = JOIN flat BY order_id, details BY order_id;
all_info = JOIN order_info BY prod_id, products BY prod_id;

-- simplify the complex data structure by creating a new
-- relation containing only the two fields we need
cust_prods = FOREACH all_info GENERATE flat::cust_id AS cust_id,
                     products::price AS price;



-- calculate total sales for each of these customers
orders_by_cust = GROUP cust_prods BY cust_id;
totals_by_cust = FOREACH orders_by_cust GENERATE group, 
                      SUM(cust_prods.price) AS total;


-- split them into groups based on total sales
SPLIT totals_by_cust INTO platinum IF total >= 1000000,
                          gold IF (total >= 500000 AND total < 1000000),
                          silver IF (total >= 250000 AND total < 500000);


-- store these groups to directories in HDFS
store platinum INTO '/dualcore/loyalty/platinum';
store gold INTO '/dualcore/loyalty/gold';
store silver INTO '/dualcore/loyalty/silver';
