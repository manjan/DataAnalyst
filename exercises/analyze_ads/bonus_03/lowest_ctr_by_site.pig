-- Load only the ad_data1 and ad_data2 directories
data = LOAD '/dualcore/ad_data[12]' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,
             placement:chararray, was_clicked:int, cpc:int);

grouped = GROUP data BY display_site;

by_site = FOREACH grouped {
  -- Include only records where the ad was clicked
	clicked = FILTER data BY was_clicked==1;
  -- count the number of records in this group
	total = COUNT(data.display_site);
  /* Calculate the click-through rate by dividing the 
   * clicked ads in this group by the total number of ads
   * in this group.
   */
	GENERATE group, ((double)COUNT(clicked) / total) AS ctr;
}


-- sort the records in ascending order of clickthrough rate
sorted = ORDER by_site BY ctr;

-- show just the first three
limited = LIMIT sorted 3;

DUMP limited;
