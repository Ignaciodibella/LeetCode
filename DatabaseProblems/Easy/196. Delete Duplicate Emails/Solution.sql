/*270 ms*/
DELETE FROM Person
WHERE id IN (SELECT x1.id
             FROM (SELECT id,
                          ROW_NUMBER() OVER(PARTITION BY email ORDER BY id ASC) AS inx
                   FROM Person) AS x1
                   WHERE x1.inx > 1)
