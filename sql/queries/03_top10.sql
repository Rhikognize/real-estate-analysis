SELECT * FROM
	(SELECT *, RANK() OVER (ORDER BY [Price (thousands of €)] DESC) as price_rank 
	FROM aparts_cleaned)
WHERE price_rank <= 10
ORDER BY price_rank;