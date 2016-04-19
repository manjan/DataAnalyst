DROP TABLE IF EXISTS cart_zipcodes;
CREATE TABLE cart_zipcodes AS
    SELECT TRANSFORM(cookie, ip_address, steps_completed)
        USING 'hdfs:/dualcore/ipgeolocator.py' AS (cookie STRING, zipcode STRING, steps_completed INT)
        FROM checkout_sessions;
