-- group_data.pig
data = load 'NYSE_daily' as (exchange:chararray, symbol:chararray,date:chararray,open:float,high:float,low:float,close:float,volume:int,adj_close:float);
orderbydate = ORDER data BY date DESC;
DUMP orderbydate;
