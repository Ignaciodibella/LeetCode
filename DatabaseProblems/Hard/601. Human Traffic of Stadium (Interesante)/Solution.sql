SELECT id,
       visit_date,
       people
FROM (SELECT *,
             COUNT(*) OVER(ORDER BY id RANGE BETWEEN CURRENT ROW AND 2 FOLLOWING) AS siguientes_cnt,
             COUNT(*) OVER(ORDER BY id RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) AS anteriores_cnt,
             COUNT(*) OVER(ORDER BY id RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS medio_cnt
      FROM Stadium
      WHERE people >= 100) x1
WHERE siguientes_cnt = 3
      OR anteriores_cnt = 3
      OR medio_cnt = 3
ORDER BY visit_date
