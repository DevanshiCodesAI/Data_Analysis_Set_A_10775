-- S2a - Total delay_days by service type

SELECT
    r.service_type,
    SUM(GREATEST(d.actual_days - d.promised_days, 0)) AS total_delay_days
FROM deliveries d
JOIN routes r
    ON d.route_id = r.route_id
GROUP BY r.service_type
ORDER BY total_delay_days DESC;


-- S2b - Routes with significant delay
   
   
SELECT
    r.route_id,
    r.route,
    SUM(GREATEST(d.actual_days - d.promised_days, 0)) AS total_delay_days
FROM deliveries d
JOIN routes r
    ON d.route_id = r.route_id
GROUP BY r.route_id, r.route
HAVING SUM(GREATEST(d.actual_days - d.promised_days, 0)) > 8
ORDER BY total_delay_days DESC;


-- S2c - Top Two Hubs by Delay

SELECT
    hub,
    SUM(GREATEST(actual_days - promised_days, 0)) AS total_delay_days
FROM deliveries
GROUP BY hub
ORDER BY total_delay_days DESC, hub ASC
LIMIT 2;


-- S2c - Data Integrity Check

SELECT COUNT(*) AS unmatched_route_count
FROM deliveries d
LEFT JOIN routes r
    ON d.route_id = r.route_id
WHERE r.route_id IS NULL;
