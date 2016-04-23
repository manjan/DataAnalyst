-- distinct.pig
data = load 'NYSE_daily' as (exchange:chararray, symbol:chararray);
uniques = DISTINCT data;
DUMP uniques;
