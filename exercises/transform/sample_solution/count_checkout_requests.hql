SELECT COUNT(*), request 
    FROM web_logs 
    WHERE request REGEXP '/cart/checkout/step\\d.+'
    GROUP BY request;
