SELECT e.employee_id
FROM Employees e
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
      AND e.salary < 30000
ORDER BY e.employee_id
