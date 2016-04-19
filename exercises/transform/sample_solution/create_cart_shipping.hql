DROP FUNCTION IF EXISTS CALC_SHIPPING_COST;
CREATE TEMPORARY FUNCTION 
     CALC_SHIPPING_COST AS 'com.cloudera.hive.udf.UDFCalcShippingCost'
     USING JAR 'hdfs:/dualcore/geolocation_udf.jar';

DROP TABLE IF EXISTS cart_shipping;
CREATE TABLE cart_shipping AS
    SELECT cookie, steps_completed, total_price, total_cost, 
          CALC_SHIPPING_COST(zipcode, total_weight) AS shipping_cost
    FROM cart_orders;

