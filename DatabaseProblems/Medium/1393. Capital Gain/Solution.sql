SELECT DISTINCT s.stock_name,
                (selled.amount_selled - buyed.amount_buyed) AS capital_gain_loss
FROM Stocks s
LEFT JOIN (SELECT stock_name, 
                  SUM(price) AS amount_buyed
           FROM Stocks
           WHERE operation = 'Buy'
           GROUP BY stock_name) buyed
    ON s.stock_name = buyed.stock_name
LEFT JOIN (SELECT stock_name,
                  SUM(price) AS amount_selled
           FROM Stocks
           WHERE operation = 'Sell'
           GROUP BY stock_name) selled
    ON s.stock_name = selled.stock_name
