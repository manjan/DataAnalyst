  SELECT zipcode, SUM(cost) AS total
    FROM customers     JOIN orders
      ON customers.cust_id = orders.cust_id
   WHERE zipcode LIKE '63%'
GROUP BY zipcode
ORDER BY total DESC;


SELECT cust_id, fname, lname
FROM customers
WHERE state='NY'
UNION ALL
SELECT cust_id, fname, lname
FROM customers
WHERE zipcode LIKE '073%'
