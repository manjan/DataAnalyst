DROP TABLE IF EXISTS cart_items;
CREATE TABLE cart_items AS
    SELECT cookie, REGEXP_EXTRACT(request, '/cart/additem\\?productid=(\\d+)', 1) AS prod_id
       FROM web_logs
       WHERE request REGEXP '/cart/additem\\?productid=(\\d+)';
