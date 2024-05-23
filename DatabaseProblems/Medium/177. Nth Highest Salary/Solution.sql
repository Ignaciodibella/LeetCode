CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
        SELECT SUM(salary)
         FROM Employee
         WHERE id = N
  );
END
