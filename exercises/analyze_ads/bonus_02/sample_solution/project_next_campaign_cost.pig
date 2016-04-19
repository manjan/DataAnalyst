-- Load only the ad_data1 and ad_data2 directories
data = LOAD '/dualcore/ad_data[12]' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,
             placement:chararray, was_clicked:int, cpc:int);

-- Group everything so we can call the aggregate function
grouped = GROUP data ALL;

-- Count the records (note that since no field should be
-- null, then it should not matter which field we count)
future_totals = FOREACH grouped GENERATE MAX(data.cpc) * 50000 as max;

-- Display the result to the screen
dump future_totals;
