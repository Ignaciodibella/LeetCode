SELECT x1.id,
       COUNT(x1.id) as num
FROM (SELECT requester_id AS id
      FROM RequestAccepted
      UNION ALL
      SELECT accepter_id AS id
      FROM RequestAccepted) x1
GROUP BY x1.id
ORDER BY COUNT(x1.id) DESC
LIMIT 1
