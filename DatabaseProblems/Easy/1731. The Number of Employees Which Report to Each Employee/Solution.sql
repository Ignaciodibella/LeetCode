SELECT x1.employee_id,
       x2.name,
       x1.reports_count,
       x1.average_age
FROM (SELECT reports_to AS employee_id,
             COUNT(employee_id) AS reports_count,
             ROUND(AVG(age)) AS average_age
      FROM Employees
      WHERE reports_to IS NOT NULL
      GROUP BY reports_to
      HAVING COUNT(employee_id) > 0) x1
LEFT JOIN Employees x2
    ON x1.employee_id = x2.employee_id
ORDER BY employee_id
