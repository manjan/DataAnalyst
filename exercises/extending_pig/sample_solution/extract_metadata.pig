-- Define an alias for the supplied Python script we 
-- use to parse the metadata from the MP3 files
DEFINE tagreader `readtags.py`;

-- load the list of MP3 files to analyze
calls = LOAD 'call_list.txt' AS (file:chararray);

-- Use the STREAM keyword to invoke our script, and parse
-- MP3 metadata, returning the fields shown here
metadata = STREAM calls THROUGH tagreader AS (path:chararray,
           category:chararray,
           agent_id:chararray,
           customer_id:chararray,
           timestamp:chararray);


-- A: Month is now specified via a command-line parameter 
by_month = FILTER metadata BY SUBSTRING(timestamp, 0, 7) == '$MONTH';


-- B: Count calls by category
by_category = GROUP by_month BY category;
category_counts = FOREACH by_category GENERATE group, 
                     COUNT(by_month.category) AS count;


-- C: Display the top three categories to the screen
sorted = ORDER category_counts BY count DESC;
top_three = LIMIT sorted 3;
DUMP top_three;
