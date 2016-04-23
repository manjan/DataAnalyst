-- sample_data.pig
data = load 'NYSE_daily' as (exchange, symbol,date,open,high,low,close,volume,adj_close);
some_data = sample data 0.1; -- (10%)
DUMP some_data;