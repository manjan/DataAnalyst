-- Unpartitioned call_logs
DROP TABLE IF EXISTS call_logs;

CREATE TABLE call_logs (
   call_date STRING,
   call_time STRING,
   phone STRING,
   event_type STRING,
   details STRING)
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',';

LOAD DATA INPATH '/user/training/call.log'
   INTO TABLE call_logs;
   
-- Call logs partitioned by call date
DROP TABLE IF EXISTS call_logs_part;
CREATE TABLE call_logs_part (
   call_time STRING,
   phone STRING,
   event_type STRING,
   details STRING)
  PARTITIONED BY (call_date STRING)
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',';

ALTER TABLE call_logs_part ADD PARTITION (call_date='2014-10-01');
LOAD DATA INPATH '/user/training/call-20141001.log'
   INTO TABLE call_logs_part 
  PARTITION(call_date='2014-10-01');

ALTER TABLE call_logs_part ADD PARTITION (call_date='2014-10-02');
LOAD DATA INPATH  '/user/training/call-20141002.log'
   INTO TABLE call_logs_part 
  PARTITION(call_date='2014-10-02');

-- Dynamic partitioning example
set hive.exec.dynamic.partition.mode=nonstrict;

DROP TABLE IF EXISTS customers_by_state;
CREATE  TABLE customers_by_state (
    cust_id int,
    fname string,
    lname string,
    address string,
    city string,
    zipcode string) 
    PARTITIONED BY (state STRING)
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY '\t'  ;


INSERT INTO customers_by_state
  PARTITION(state)
  SELECT cust_id, fname, lname, address, city, zipcode, state FROM customers;


SELECT o.order_date, c.fname, c.lname, c.state 
      FROM customers c JOIN orders o 
      ON (c.cust_id = o.cust_id) 
      WHERE c.state='NY';

