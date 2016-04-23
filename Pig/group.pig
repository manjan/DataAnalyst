-- group.pig
data = load 'NYSE_daily' as (exchange, stock);
grpd = group data by stock;
counts = foreach grpd generate group, COUNT(data);
DUMP counts;
