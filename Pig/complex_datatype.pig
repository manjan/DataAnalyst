--Load data from baseball file
data = LOAD 'baseball' as (name:chararray, team:chararray, position:bag{t:(x:chararray)},bat:map[]);

--View batting average from the data
avg = foreach data generate bat#'batting_average',position.x;

DUMP avg;

