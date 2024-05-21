/*Faster: 142ms*/
SELECT x1.email AS Email
FROM (SELECT email,
            ROW_NUMBER() OVER(PARTITION BY email) AS inx
      FROM Person) x1
WHERE x1.inx = 2
