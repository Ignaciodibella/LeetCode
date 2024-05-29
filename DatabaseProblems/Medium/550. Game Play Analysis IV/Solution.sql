WITH FirstLogin AS (
    SELECT player_id,
           MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id),

NextDayLogin AS (
    SELECT fl.player_id
    FROM FirstLogin fl
    JOIN Activity a 
      ON fl.player_id = a.player_id 
         AND a.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY))
   
SELECT ROUND(COUNT(DISTINCT ndl.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM NextDayLogin ndl
