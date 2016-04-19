-- Example: Creating a table
CREATE TABLE jobs (
    id INT, 
    title STRING, 
    salary INT, 
    posted TIMESTAMP
  )
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ','
  LOCATION '/dualcore/jobs';

-- Example: Creating a table based on another table's schema
CREATE TABLE jobs_archived LIKE jobs;

-- Example: Creating an externally managed table
CREATE EXTERNAL TABLE adclicks
  ( campaign_id STRING,
    click_time TIMESTAMP,
    keyword STRING, 
    site STRING,
    placement STRING,
    was_clicked BOOLEAN,
    cost SMALLINT)
  LOCATION '/dualcore/ad_data';

-- Example: Loading data from an HDFS file into a table
-- sales.txt must be in user's home HDFS directory
LOAD DATA INPATH 'sales.txt' INTO TABLE sales;

-- Example: Overwriting Data from Files
LOAD DATA INPATH 'sales.txt'
  OVERWRITE INTO TABLE sales;

-- Example: Removing a table
DROP TABLE customers;
DROP TABLE IF EXISTS customers;

-- Example: Removing a database
DROP DATABASE dualcore; 

DROP DATABASE IF EXISTS dualcore;

-- hive only
-- DROP DATABASE dualcore CASCADE;

-- Example: Removing a table
DROP TABLE customers;

DROP TABLE IF EXISTS customers;

-- Example: Altering a table
ALTER TABLE customers RENAME TO clients;
ALTER TABLE clients CHANGE fname first_name STRING;
ALTER TABLE jobs CHANGE salary salary BIGINT;
ALTER TABLE jobs ADD COLUMNS (city STRING, bonus INT);
ALTER TABLE jobs CHANGE bonus bonus INT AFTER salary;
ALTER TABLE jobs CHANGE bonus bonus INT FIRST;
ALTER TABLE jobs REPLACE COLUMNS
      (id INT,
       title STRING,
       salary INT);


-- Example: Creating Views
CREATE VIEW order_info AS
      SELECT o.order_id, order_date, p.prod_id, brand, name
      FROM orders o 
      JOIN order_details d 
      ON (o.order_id = d.order_id)
      JOIN products p
      ON (d.prod_id = p.prod_id);
      
-- Example: Deleting Views
DROP VIEW order_info;


-- Example: Create Table As Select (CTAS)
CREATE TABLE ny_customers AS 
  SELECT cust_id, fname, lname 
  FROM customers 
  WHERE state = 'NY';

-- Example: Saving Query Output to a Table

DROP TABLE IF EXISTS ny_customers;

CREATE EXTERNAL TABLE ny_customers   
        (cust_id INT, 
         fname STRING,
         lname STRING)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        STORED AS TEXTFILE
        LOCATION '/dualcore/nydata';
        
INSERT OVERWRITE TABLE ny_customers 
  SELECT * FROM customers 
  WHERE state = 'NY';

-- Example: Writing output to HDFS
-- HIVE ONLY

INSERT OVERWRITE DIRECTORY '/dualcore/ny/' 
        SELECT * FROM customers
        WHERE state = 'NY';

-- Example: Multi-directory save yo HDFS
-- HIVE ONLY

FROM customers c 
  INSERT OVERWRITE DIRECTORY 'ny_names'
    SELECT fname, lname 
      WHERE state = 'NY'
  INSERT OVERWRITE DIRECTORY 'ny_count'
    SELECT count(DISTINCT cust_id) 
      WHERE state = 'NY';

FROM (SELECT * FROM customers WHERE state='NY') nycust 
  INSERT OVERWRITE DIRECTORY 'ny_names'
    SELECT fname, lname
  INSERT OVERWRITE DIRECTORY 'ny_count'
    SELECT count(DISTINCT cust_id);




