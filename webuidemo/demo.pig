DEFINE MYSCRIPT `priceformat.py` SHIP('priceformat.py');

-- ensure no previous input data exists before we add it to HDFS
fs -rm -f demodata
fs -put demodata

-- remove any output from previous runs
fs -rm -r -f demoreport

sales = LOAD 'demodata' AS (name:chararray, price:int);
grouped = GROUP sales by name;
totals = FOREACH grouped GENERATE group, SUM(sales.price);

/*
 * This script has an intentional syntax error which does
 * not show up in the local log file or the console output 
 * from Pig, but which is visible in the logs via the Web UI
 */
formatted = STREAM totals THROUGH MYSCRIPT AS (name:chararray, fmtprice:chararray);

STORE formatted INTO 'demoreport';
