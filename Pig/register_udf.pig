-- register_udf.pig
-- Piggybank
/*
Available Packages on Piggybank


org.apache.pig.piggybank.evaluation
org.apache.pig.piggybank.evaluation.datetime
org.apache.pig.piggybank.evaluation.datetime.convert
org.apache.pig.piggybank.evaluation.datetime.diff
org.apache.pig.piggybank.evaluation.datetime.truncate
org.apache.pig.piggybank.evaluation.decode
org.apache.pig.piggybank.evaluation.math
org.apache.pig.piggybank.evaluation.stats
org.apache.pig.piggybank.evaluation.string
org.apache.pig.piggybank.evaluation.util
org.apache.pig.piggybank.evaluation.util.apachelogparser
org.apache.pig.piggybank.evaluation.xml
org.apache.pig.piggybank.storage
org.apache.pig.piggybank.storage.allloader
org.apache.pig.piggybank.storage.apachelog
org.apache.pig.piggybank.storage.avro
org.apache.pig.piggybank.storage.hiverc
org.apache.pig.piggybank.storage.partition

*/

register 'piggybank-0.15.0.jar';
data = load 'NYSE_dividends' as (exchange:chararray,symbol:chararray, date:chararray,dividends:float);
reverse_symbol = foreach data generate symbol, org.apache.pig.piggybank.evaluation.string.Reverse(symbol);
DUMP reverse_symbol;