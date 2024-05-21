/*126 ms*/
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5
