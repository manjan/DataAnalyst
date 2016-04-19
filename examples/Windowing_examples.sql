-- Question: What is the price of the least expensive product in each brand?
SELECT prod_id, brand, price, 
  MIN(price) OVER(PARTITION BY brand) AS m 
  FROM products;

-- Question: For each product, how does the price compare to the minimum price for that brand?
SELECT prod_id, brand, price, 
  price - MIN(price) OVER(PARTITION BY brand) AS d 
  FROM products;

-- Question: Rank the products by price within each brand
SELECT prod_id, brand, price, 
  RANK() OVER(PARTITION BY brand ORDER BY price) as rank,
  ROW_NUMBER() OVER(PARTITION BY brand ORDER BY price) as n 
  FROM products;

-- Question: What is the least expensive from each brand?
SELECT prod_id, brand, price FROM(
  SELECT prod_id, brand, price,
     RANK() OVER(PARTITION BY brand ORDER BY price) 
     AS rank FROM products) p
 WHERE rank=1;

-- Question: Rank the products by price within each brand
-- (Compare RANK and DENSE_RANK results)
SELECT prod_id, brand, price,
  RANK() OVER(PARTITION BY brand ORDER BY price) 
     AS rank, 
  DENSE_RANK() OVER(PARTITION BY brand ORDER BY price) 
     AS d_rank 
  FROM products;

-- Question: How many ads were displayed per site per day?
SELECT display_date, display_site, count(display_time) AS n 
    FROM ads GROUP BY display_date, display_site;

-- Question: How did each site rank per day in number of displays?
SELECT display_date, display_site, n, 
    RANK() OVER (PARTITION BY display_date ORDER BY n) AS dayrank
  FROM ( 
    SELECT display_date, display_site, count(display_time) AS n 
    FROM ads GROUP BY display_date,display_site) ads
  ORDER BY display_date;

-- Question: How did each site’s daily count compare to the previous day?
-- Hive only
SELECT display_date, display_site, n, 
    LAG(n) OVER 
      (PARTITION BY display_site ORDER BY display_date) AS nprev,
  FROM ( 
    SELECT display_date, display_site, count(display_time) AS n 
    FROM ads GROUP BY display_date,display_site) ads
  ORDER BY display_date;

-- Question: What is the average count for each site for the week ending on the current date?
SELECT display_date, display_site, n, 
    AVG(n) OVER 
      (PARTITION BY display_site ORDER BY display_date 
       ROWS BETWEEN 7 PRECEDING AND CURRENT ROW) AS wavg,
  FROM (
      SELECT display_date, display_site, count(display_time) AS n 
      FROM ads GROUP BY display_date,display_site) ads
  ORDER BY display_date;




  
  