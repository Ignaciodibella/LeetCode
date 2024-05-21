/*181 ms*/
SELECT MAX(x1.num) AS num
FROM (SELECT num
      FROM MyNumbers
      GROUP BY num
      HAVING COUNT(num) = 1) x1
