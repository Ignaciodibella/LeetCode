(SELECT u.name as results
FROM MovieRating mr
LEFT JOIN Users u
    ON mr.user_id = u.user_id
GROUP BY u.user_id
ORDER BY COUNT(mr.movie_id) DESC,
         u.name ASC
LIMIT 1)

UNION ALL

(SELECT m.title as results
FROM MovieRating mr
LEFT JOIN Movies m
    ON mr.movie_id = m.movie_id
WHERE YEAR(mr.created_at) = '2020'
      AND MONTH(mr.created_at) = '2'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC,
         m.title ASC
LIMIT 1)
