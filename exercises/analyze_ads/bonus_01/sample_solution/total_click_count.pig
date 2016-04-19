-- Load only the ad_data1 and ad_data2 directories
data = LOAD '/dualcore/ad_data[12]' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,
             placement:chararray, was_clicked:int, cpc:int);

-- Include only records where the ad was clicked
clicked = FILTER data BY was_clicked == 1;

-- Group everything so we can call the aggregate function
grouped = GROUP clicked ALL;

-- Count the records (note that since no field should be
-- null, then it should not matter which field we count)
totals = FOREACH grouped GENERATE COUNT(clicked.cpc);

-- Display the result to the screen
DUMP totals;
