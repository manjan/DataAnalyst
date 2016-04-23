-- join.pig
data1 = load 'NYSE_daily' as (exchange, symbol,date,open,high,low,close,volume,adj_close);
data2 = load 'NYSE_dividends' as (exchange,symbol, date,dividends);
joined = JOIN data1 by symbol LEFT OUTER, data2 by symbol;
DUMP joined;