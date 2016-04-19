DROP TABLE IF EXISTS latlon;

CREATE EXTERNAL TABLE latlon 
  LIKE PARQUET '/dualcore/latlon/part-m-00000.parquet' 
  STORED AS PARQUET 
  LOCATION '/dualcore/latlon';  
