-- Register DataFu and define an alias for the function
REGISTER '/usr/lib/pig/datafu-*.jar';
DEFINE DIST datafu.pig.geo.HaversineDistInMiles;


cust_locations = LOAD '/dualcore/distribution/cust_locations/'
                   AS (zip:chararray,
                       lat:double,
                       lon:double);

warehouses = LOAD '/dualcore/distribution/warehouses.tsv'
                   AS (zip:chararray,
                       lat:double,
                       lon:double);
             


-- Creates a record for every combination of customer and
-- proposed distribution center location.
crossed = CROSS cust_locations, warehouses;


-- Calculates the distance from the customer to the warehouse
distances = FOREACH crossed GENERATE warehouses::zip AS warehouse, 
                    DIST(cust_locations::lat, cust_locations::lon, 
                         warehouses::lat, warehouses::lon) AS mileage;

-- Calculates the average distance for all customers to each warehouse
grouped = GROUP distances BY warehouse;
result = FOREACH grouped GENERATE group, AVG(distances.mileage);


-- Displays the result to the screen
dump result;
