#How to calculate Yearly, Quarterly, Monthly totals in a single SQL Query ? | Grouping Sets
#NEED A TABLE WHICH CONTAINS SALES ITH DATES
SELECT
CASE WHEN Month(OrderDate) is NULL 
AND DATEPART(Quarter,OrderDate) is NULL
THEN 'Yearly'
WHEN Month(OrderDate) is NULL 
THEN 'Quarterly'
ELSE 'Monthly' End as Totals,
YEAR(OrderDate),MONTH(OrderDate) ,
DATEPART(Quarter,OrderDate) as Quarter_name
,SUM(SubTotal) AS Sales
FROM Dbo.sales
GROUP BY GROUPING SETS ((YEAR(OrderDate)),
YEAR(OrderDate), DATEPART(Quarter,OrderDate))
,YEAR(OrderDate),MONTH(OrderDate)),()) 
ORDER BY YEAR(OrderDate),DATEPART(Quarter,OrderDate),MONTH(OrderDate);
