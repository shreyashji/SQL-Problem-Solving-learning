
USE IT;
Create Table BalanceTbl(
Balance int,
Dates Date
);

Insert into BalanceTbl Values(26000,'2020-01-01');
Insert into BalanceTbl Values(26000,'2020-01-02');
Insert into BalanceTbl Values(26000,'2020-01-03');
Insert into BalanceTbl Values(30000,'2020-01-04');
Insert into BalanceTbl Values(30000,'2020-01-05');
Insert into BalanceTbl Values(26000,'2020-01-06');
Insert into BalanceTbl Values(26000,'2020-01-07');
Insert into BalanceTbl Values(32000,'2020-01-08');
Insert into BalanceTbl Values(31000,'2020-01-09');
#Write SQL to derive Start_Date and End_Date column when there is continuous amount in Balance

SELECT * FROM BalanceTbl;

WITH recursive balance_cte as (
	SELECT Balance,dates,LAG(balance) OVER(Order  by dates) as lag1,
    CASE WHEN LAG(balance) OVER(Order  by dates) = balance then 0 ELSE 1 END AS TempSequence
    FROM BalanceTbl
),
Sequence_CTE as (
	SELECT Balance,dates,SUM(TempSequence) OVER(Order  by dates) as Seq #running total
	FROM balance_cte
)
select balance,min(dates) as start_date,max(dates) as end_date FROM Sequence_CTE
GROUP BY Seq,Balance
ORDER BY Seq;


with  
cte1 as
(select balance,dates ,row_number() over(partition by  balance order by balance) as ranking from BalanceTbl),
cte2 as 
(select balance,dates,day(dates)-ranking as temp  from cte1)
select balance,min(dates) as start_date,max(dates) as end_date from cte2
group by balance,temp;

