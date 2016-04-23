-- filter_matches.pig
data = load 'NYSE_dividends' as (exchange:chararray, symbol:chararray, date:chararray, dividends:chararray);
startswithcm = FILTER  data by symbol MATCHES 'CM.*';
DUMP startswithcm;
