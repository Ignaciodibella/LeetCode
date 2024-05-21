/*452 ms*/
SELECT a.name AS Customers
FROM Customers AS a
WHERE a.id NOT IN (SELECT b.customerId
                   FROM Orders AS b)
