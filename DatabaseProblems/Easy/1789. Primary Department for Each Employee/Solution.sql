SELECT x2.*
FROM (SELECT employee_id,
             CASE
                WHEN cnt_dpt = 1 THEN (SELECT department_id FROM Employee WHERE employee_id = x1.employee_id)
                ELSE (SELECT department_id FROM Employee WHERE employee_id = x1.employee_id AND primary_flag = 'Y')
             END AS department_id
      FROM (SELECT employee_id,
                   COUNT(department_id) as cnt_dpt
            FROM Employee
            GROUP BY employee_id) x1) x2
WHERE department_id IS NOT NULL
