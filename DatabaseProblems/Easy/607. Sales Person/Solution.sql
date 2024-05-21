/*237 ms*/
SELECT name
FROM SalesPerson
WHERE name NOT IN (SELECT a.name
                   FROM SalesPerson a
                   LEFT JOIN Orders b
                       ON a.sales_id = b.sales_id
                   LEFT JOIN Company c
                       ON b.com_id = c.com_id
                   WHERE c.name = 'RED')
