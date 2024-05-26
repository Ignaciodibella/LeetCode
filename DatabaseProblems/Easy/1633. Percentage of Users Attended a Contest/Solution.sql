SELECT x1.*
FROM (SELECT r.contest_id,
             ROUND(COUNT(r.user_id) / (SELECT COUNT(*) FROM Users) * 100, 2) AS percentage
      FROM Register r
      GROUP BY r.contest_id) x1
ORDER BY x1.percentage DESC, 
         x1.contest_id ASC
