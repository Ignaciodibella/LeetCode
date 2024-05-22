SELECT x1.actor_id,
       x1.director_id
FROM (SELECT actor_id,
             director_id,
             ROW_NUMBER() OVER(PARTITION BY actor_id, director_id) AS inx
      FROM ActorDirector) x1
WHERE x1.inx = 3
