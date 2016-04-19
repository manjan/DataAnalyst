-- Note: copy data files to /tmp before running this, e.g:
-- cp -r /home/training/training_materials/analyst/examples/data/* /tmp

-- Example: Storing phone numbers in an array (ordered list)
DROP TABLE IF EXISTS customers_phones_array;
CREATE TABLE customers_phones_array
  (cust_id STRING, 
   name STRING,
   phones ARRAY<STRING>)
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ','
  COLLECTION ITEMS TERMINATED BY '|';

LOAD DATA LOCAL INPATH '/tmp/customers_phones_array.csv'
OVERWRITE INTO TABLE customers_phones_array;

SELECT name, phones[0], phones[1] 
FROM customers_phones_array;

SELECT EXPLODE(phones) AS phone 
  FROM customers_phones_array; 


-- Example: Storing phone numbers in a map (key-value pairs)
DROP TABLE IF EXISTS customers_phones_map;
CREATE TABLE customers_phones_maps
  (cust_id STRING, 
    name STRING,
    phones MAP<STRING,STRING>)
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ','
  COLLECTION ITEMS TERMINATED BY '|'
  MAP KEYS TERMINATED BY ':';

SELECT name, phones['home'] as home
FROM customers_phones_map;

LOAD DATA LOCAL INPATH '/tmp/customers_phones_map.csv'
OVERWRITE INTO TABLE customers_phones_map;

DROP TABLE IF EXISTS customers_addr; 
CREATE TABLE customers_addr
  (cust_id STRING,
   name STRING,
   address STRUCT<street:STRING, 
                   city:STRING, 
                   state:STRING, 
                   zipcode:STRING>)
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ','
  COLLECTION ITEMS TERMINATED BY '|';
  
-- Note: copy data file to tmp before running this
LOAD DATA LOCAL INPATH '/tmp/customers_addr.csv'
OVERWRITE INTO TABLE customers_addr;

