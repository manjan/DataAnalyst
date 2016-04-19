SELECT steps_completed AS last_step, COUNT(cookie) AS num_abandoned 
    FROM checkout_sessions 
    GROUP BY steps_completed;
