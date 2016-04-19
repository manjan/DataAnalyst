-- Load only the ad_data1 and ad_data2 directories
data = LOAD '/dualcore/ad_data[12]' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,   
             placement:chararray, was_clicked:int, cpc:int);

-- Include only records where the ad was clicked
clicked = FILTER data BY was_clicked == 1;


-- A: Group the data by the 'keyword' field
grouped = GROUP clicked BY keyword;


-- Create relation with 'keyword' and sum of click cost
totals = FOREACH grouped GENERATE group, SUM(clicked.cpc) AS cost;


-- B: Sort the new relation in descending order of cost
sorted = ORDER totals BY cost DESC;


-- C: Display just the first five records to the screen
top_five = LIMIT sorted 5;
DUMP top_five;
