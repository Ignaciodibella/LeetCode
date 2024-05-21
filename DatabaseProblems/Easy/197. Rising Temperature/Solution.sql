/*266 ms*/
SELECT a.id
FROM Weather as a
LEFT JOIN weather as prevWeather
    ON DATE_ADD(a.recordDate, INTERVAL -1 DAY) = prevWeather.recordDate
WHERE a.temperature > prevWeather.temperature
