-- group_data.pig
data = load 'NYSE_daily' as (exchange, stock,date,dividends);
grpd = group data by (exchange, stock);
avg = foreach grpd generate group, AVG(data.dividends);
-- DESCRIBE will show -  avg: {group: (exchange: bytearray,stock: bytearray),double}
DUMP avg;