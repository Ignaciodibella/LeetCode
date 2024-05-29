-- Improvisando FULL OUTER JOIN
SELECT DISTINCT employee_id
FROM (
    SELECT e.employee_id
    FROM Employees e
    LEFT OUTER JOIN Salaries s 
        ON e.employee_id = s.employee_id
    WHERE e.name IS NULL OR s.salary IS NULL

    UNION

    SELECT s.employee_id
    FROM Employees e
    RIGHT OUTER JOIN Salaries s
        ON e.employee_id = s.employee_id
    WHERE e.name IS NULL OR s.salary IS NULL
) x1
ORDER BY employee_id;
