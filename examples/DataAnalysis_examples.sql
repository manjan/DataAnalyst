-- Example: Using a WHERE clause to restrict results
SELECT * FROM orders WHERE order_id=1287;
SELECT * FROM customers WHERE state IN ('CA', 'OR', 'WA', 'NV', 'AZ');
SELECT * FROM customersWHERE fname LIKE 'Ann%'  AND (city='Seattle' OR city='Portland');

-- Example: Table aliases
SELECT o.order_date, c.fname, c.lname FROM customers c JOIN orders o ON (c.cust_id = o.cust_id) WHERE c.zipcode='94306'; 

-- Example: UNION ALL
SELECT emp_id, fname, lname, salary    FROM employees    WHERE state='CA' AND salary > 75000  UNION ALL   SELECT emp_id, fname, lname, salary    FROM employees    WHERE state != 'CA' AND salary > 50000; 
 



-- Example: subqueries
SELECT prod_id, brand, name 
  FROM (SELECT *
          FROM products
          WHERE (price - cost) / price > 0.65
          ORDER BY price DESC
          LIMIT 10) high_profits
  WHERE price > 1000
  ORDER BY brand, name;

-- Example: UNION ALL
SELECT cust_id, fname, lname
    FROM customers
    WHERE state='NY'
  UNION ALL
    SELECT cust_id, fname, lname
    FROM customers
    WHERE zipcode LIKE '073%'
    
    