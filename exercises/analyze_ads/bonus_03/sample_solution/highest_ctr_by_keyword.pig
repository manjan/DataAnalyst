-- Load only the ad_data1 and ad_data2 directories
data = LOAD '/dualcore/ad_data[12]' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,
             placement:chararray, was_clicked:int, cpc:int);

grouped = GROUP data BY keyword;

by_keyword = FOREACH grouped {
  -- Include only records where the ad was clicked
  clicked = FILTER data BY was_clicked == 1;

  -- count the number of records in this group
  total = COUNT(data.keyword);

  /* Calculate the click-through rate by dividing the 
   * clicked ads in this group by the total number of ads
   * in this group.
   * 
   * NOTE: the COUNT function returns a number of type
   * long, so we must cast it to a double to avoid losing
   * precision. Although both numbers in this formula are
   * of type long, dividing a double by a long produces a
   * double, so casting the second one is unnecessary in 
   * this particular case.
   */
  GENERATE group, ((double)COUNT(clicked) / total) AS ctr;
}

-- sort the records in descending order of clickthrough rate
sorted = ORDER by_keyword BY ctr DESC;

-- show just the first three
highest_three = LIMIT sorted 3;
DUMP highest_three;
