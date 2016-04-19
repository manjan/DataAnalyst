data = LOAD '/dualcore/ad_data2.txt' USING PigStorage(',') AS (campaign_id:chararray, date:chararray, time: chararray, display_site:chararray, placement:chararray, was_clicked:int, cpc:int, keyword: chararray); -- TODO finish the LOAD statement

non_duplicates = DISTINCT data;

arranged = FOREACH non_duplicates GENERATE campaign_id, REPLACE(date,'-','/'), time, TRIM(UPPER(keyword)), display_site, placement, was_clicked, cpc;

STORE arranged INTO '/dualcore/ad_data2';

