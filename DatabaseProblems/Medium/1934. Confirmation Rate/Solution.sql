SELECT s.user_id,
       COALESCE(ROUND((confirmed.cnt_confirmed / actions.cnt_tot), 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN (SELECT user_id,
                  COUNT(*) AS cnt_confirmed
           FROM Confirmations
           WHERE action = 'confirmed'
           GROUP BY user_id) confirmed
    ON s.user_id = confirmed.user_id
LEFT JOIN (SELECT user_id,
                  COUNT(*) AS cnt_tot
           FROM Confirmations
           GROUP BY user_id) actions
    ON s.user_id = actions.user_id
