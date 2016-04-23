-- group_data.pig
data = load 'NYSE_daily' as (exchange, stock);
grpd = group data by stock;
STORE grpd INTO 'by_group';
