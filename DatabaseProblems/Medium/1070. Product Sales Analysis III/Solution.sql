SELECT s1.product_id,
       x1.first_year,
       s1.quantity,
       s1.price
FROM Sales s1
INNER JOIN (# First year of sales of each product
            SELECT s2.product_id,
                   MIN(s2.year) AS first_year
            FROM Sales s2
            GROUP BY s2.product_id) x1
ON s1.product_id = x1.product_id
   AND s1.year = x1.first_year
