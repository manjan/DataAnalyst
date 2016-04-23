-- parallel.pig
data = load 'NYSE_daily' as (exchange, symbol,date,open,high,low,close,volume,adj_close);
grouped = group data by symbol parallel 10; -- 10 reducers
average = foreach grouped generate group, AVG(data.close) as avg;
sort_data = order average BY avg DESC parallel 2; -- Since data is much reduced now, 2 reducers
DUMP sort_data;