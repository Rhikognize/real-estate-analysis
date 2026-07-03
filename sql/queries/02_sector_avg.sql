SELECT Sector, AVG([Price (thousands of €)]) as average
FROM aparts_cleaned
GROUP BY Sector
ORDER by average DESC;