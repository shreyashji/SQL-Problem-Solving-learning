/*
use it;
Create Table SalesInfo(
Continents varchar(30),
Country varchar(30),
Sales Bigint
);

Insert into SalesInfo Values('Asia','India',50000);
Insert into SalesInfo Values('Asia','India',70000);
Insert into SalesInfo Values('Asia','India',60000);
Insert into SalesInfo Values('Asia','Japan',10000);
Insert into SalesInfo Values('Asia','Japan',20000);
Insert into SalesInfo Values('Asia','Japan',40000);
Insert into SalesInfo Values('Asia','Thailand',20000);
Insert into SalesInfo Values('Asia','Thailand',30000);
Insert into SalesInfo Values('Europe','Denmark',40000);
Insert into SalesInfo Values('Europe','Denmark',60000);
Insert into SalesInfo Values('Europe','Denmark',10000);
Insert into SalesInfo Values('Europe','France',60000);
Insert into SalesInfo Values('Europe','France',30000);
Insert into SalesInfo Values('Europe','France',40000);

Problem Statement :- SalesInfo Table has three columns namely Continents, Country and Sales. 
Write a SQL query to get the aggregate sum  of sales  country wise and display only those which are maximum in 
each continents as shown in the table.
*/

SELECT * FROM SalesInfo;

WITH recursive CTE_SALES AS (
	select Continents,Country,sales,SUM(sales) AS Total_sales
    FROM SalesInfo
    GROUP BY Continents,Country
),
CTE_RANK as (
	SELECT Continents,Country,Total_sales,
    dense_rank() over(partition by Continents order by Total_sales desc) as Ranking
    FROM CTE_SALES
)
SELECT Continents,Country,Total_sales FROM CTE_RANK WHERE Ranking=1