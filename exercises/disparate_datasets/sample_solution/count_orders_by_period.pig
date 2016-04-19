data = LOAD '/dualcore/orders' AS (order_id:int,
             cust_id:int,
             order_dtm:chararray);

/*
 * Include only records where the 'order_dtm' field matches
 * the regular expression pattern:
 *
 *   ^       = beginning of string
 *   2013    = literal value '2013'
 *   0[2345] = 0 followed by 2, 3, 4, or 5
 *   -       = a literal character '-'
 *   \\d{2}  = exactly two digits
 *   \\s     = a single whitespace character
 *   .*      = any number of any characters
 *   $       = end of string
 *
 * If you are not familiar with regular expressions and would 
 * like to know more about them, see the Regular Expression 
 * Reference at the end of the Exercise Manual.
 */
recent = FILTER data BY order_dtm MATCHES '^2013-0[2345]-\\d{2}\\s.*$';

-- A: Creates a new relation with just the order's year and month
months = FOREACH recent GENERATE SUBSTRING(order_dtm, 0, 7) AS month;

-- B: Counts the number of orders in each month
grouped = GROUP months BY month;
counted = FOREACH grouped GENERATE group, COUNT(months.month) AS count;

-- C: Displays the count by month to the screen.
sorted = ORDER counted BY group;
DUMP sorted;
