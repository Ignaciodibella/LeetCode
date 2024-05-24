SELECT DISTINCT a.author_id AS id
FROM Views a
INNER JOIN Views b
    ON a.author_id = b.viewer_id
ORDER BY a.author_id ASC
