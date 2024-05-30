SELECT ROUND(SUM(x1.tiv_2016), 2) AS tiv_2016
FROM (SELECT i.tiv_2016
      FROM Insurance i
      WHERE i.tiv_2015 = ANY (SELECT tiv_2015 
                              FROM Insurance
                              WHERE pid != i.pid)
            AND CONCAT(i.lat, i.lon) NOT IN (SELECT CONCAT(lat, lon) 
                                             FROM Insurance 
                                             WHERE pid != i.pid)) x1
