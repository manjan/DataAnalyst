DROP TABLE IF EXISTS checkout_sessions;
CREATE TABLE checkout_sessions AS
    SELECT cookie, ip_address, COUNT(request) AS steps_completed
        FROM web_logs 
        WHERE request REGEXP '/cart/checkout/step\\d.+'
        GROUP BY cookie, ip_address;
