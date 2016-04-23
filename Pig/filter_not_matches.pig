-- filter_not_matches.pig
data = load 'NYSE_dividends' as (exchange:chararray, symbol:chararray, date:chararray, dividends:chararray);
notstartswithcm = FILTER  data by not symbol MATCHES 'CM.*';
DUMP notstartswithcm;
