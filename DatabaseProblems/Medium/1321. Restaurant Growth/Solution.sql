SELECT visited_on, 
       amount, 
       ROUND(amount/7, 2) AS average_amount
FROM (SELECT DISTINCT visited_on, 
             SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) amount, 
             MIN(visited_on) OVER() 1st_visit
      FROM Customer) x1
WHERE visited_on >= 1st_visit+6;
