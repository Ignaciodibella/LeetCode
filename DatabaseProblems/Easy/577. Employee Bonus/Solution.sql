/*193 ms*/
SELECT a.name,
       b.bonus
FROM Employee AS a
LEFT OUTER JOIN Bonus AS b
    ON a.empId = b.empId
WHERE b.bonus < 1000 
      OR b.bonus IS NULL
