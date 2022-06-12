#How to Print Fibonacci Series in SQL

WITH recursive Fibonacci as (
	SELECT 0 AS FirstN,1 AS SecondN,1 AS Step # base/anchor query
	UNION ALL
	SELECT SecondN,SecondN + FirstN,Step+1 #recursive part
	FROM Fibonacci
	WHERE Step<10
)
SELECT group_concat(FirstN) AS fabonacci_number
FROM Fibonacci ;