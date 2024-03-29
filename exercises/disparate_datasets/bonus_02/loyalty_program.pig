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

filtereddate = FILTER orders BY order_dtm MATCHES '^2012-.*-.*$';
customergroup = GROUP filtereddate BY cust_id;

new_rel = FOREACH customergroup GENERATE group as cust_id, COUNT(filtereddate.order_id) as totalcount;
new_rel_filtered = FILTER new_rel BY totalcount >=5;


customers_join = JOIN new_rel_filtered by cust_id,orders by cust_id;
cust_rel = FOREACH customers_join GENERATE new_rel_filtered::cust_id,orders::order_id;

products_join = JOIN cust_rel by order_id, details by order_id;
product_rel = FOREACH products_join GENERATE cust_rel.cust_id, cust_rel.order_id,details.prod_id;

final_join = JOIN product_rel by prod_id, products by prod_id;
f_rel = FOREACH final_join GENERATE product_rel.prod_id,products.price,product_rel.cust_id;

final_group = GROUP f_rel BY f_rel.cust_id;
final_rel = FOREACH final_group GENERATE group, (INT)SUM(f_rel.price) as totals;

/*
SPLIT final_rel INTO 
	platinum IF totals >= 10000,
	gold IF totals >= 5000 AND totals < 10000
	AND silver IF totals >= 2500 AND totals < 5000;
*/

--STORE platinum into '/dualcore/loyalty';
--STORE gold into '/dualcore/loyalty';
--STORE silver into '/dualcore/loyalty';

lim = LIMIT final_rel 10;
DUMP lim;


/*
 * TODO: Find all customers who had at least five orders
 *       during 2012. For each such customer, calculate 
 *       the total price of all products he or she ordered
 *       during that year. Split those customers into three
 *       new groups based on the total amount:
 *
 *        platinum: At least $10,000
 *        gold:     At least $5,000 but less than $10,000
 *        silver:   At least $2,500 but less than $5,000
 *
 *       Write the customer ID and total price into a new
 *       directory in HDFS. After you run the script, use
 *       'hadoop fs -getmerge' to create a local text file
 *       containing the data for each of these three groups.
 *       Finally, use the 'head' or 'tail' commands to check 
 *       a few records from your results, and then use the  
 *       'wc -l' command to count the number of customers in 
 *       each group.
 */
