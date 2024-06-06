SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM Employee e
LEFT JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary IN (SELECT salary
                   FROM (SELECT salary,
                                ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
                         FROM Employee 
                         WHERE departmentId = e.departmentId
                         GROUP BY salary) x1
                   WHERE row_num <= 3)
ORDER BY d.name ASC, 
         e.salary DESC
