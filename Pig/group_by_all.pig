-- group_by_all.pig
data = load 'NYSE_daily' as (exchange, stock);
grpd = group data ALL;
totalcounts = foreach grpd generate COUNT(data);
DUMP totalcounts;
