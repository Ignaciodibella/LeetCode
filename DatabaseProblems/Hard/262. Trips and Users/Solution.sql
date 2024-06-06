WITH canceled AS (
    SELECT request_at,
           COUNT(*) AS cnt_canceled
    FROM Trips t
    LEFT JOIN Users cli
        ON t.client_id = cli.users_id
    LEFT JOIN Users dri
        ON t.driver_id = dri.users_id
    WHERE cli.banned = 'No'
          AND dri.banned = 'No'
          AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
          AND status != 'completed'
    GROUP BY request_at
),

requests AS (
    SELECT request_at,
           COUNT(*) AS cnt_requests
    FROM Trips t
    LEFT JOIN Users cli
        ON t.client_id = cli.users_id
    LEFT JOIN Users dri
        ON t.driver_id = dri.users_id
    WHERE cli.banned = 'No'
          AND dri.banned = 'No'
          AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY request_at
)

SELECT t.request_at AS Day,
       ROUND(COALESCE((c.cnt_canceled / r.cnt_requests), 0), 2) AS "Cancellation Rate"
FROM Trips t
LEFT JOIN canceled c
    ON t.request_at = c.request_at
LEFT JOIN requests r
    ON t.request_at = r.request_at
LEFT JOIN Users dri
    ON t.driver_id = dri.users_id
LEFT JOIN Users cli
    ON t.client_id = cli.users_id
WHERE dri.banned = 'No'
      AND cli.banned = 'No'
GROUP BY t.request_at
HAVING t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
