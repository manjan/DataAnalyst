-- Answer is product ID 1274673 with an average rating of 1.10.
SELECT prod_id, FORMAT_NUMBER(avg_rating, 2) AS avg_rating
    FROM (SELECT prod_id, AVG(rating) AS avg_rating, COUNT(*) AS num 
             FROM ratings
             GROUP BY prod_id) rated
    WHERE num >= 50
    ORDER BY avg_rating
    LIMIT 1;
