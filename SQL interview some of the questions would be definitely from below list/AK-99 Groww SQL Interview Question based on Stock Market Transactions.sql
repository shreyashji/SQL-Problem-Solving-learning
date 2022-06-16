/*
use it;
Create Table Buy (
Date Int,
Time Int,
Qty Int,
per_share_price int,
total_value int );

Create Table sell(
Date Int,
Time Int,
Qty Int,
per_share_price int,
total_value int );

INSERT INTO Buy (date, time, qty, per_share_price, total_value)
VALUES
(15, 10, 10, 10, 100),
(15, 14, 20, 10, 200);

INSERT INTO Sell(date, time, qty, per_share_price, total_value)
VALUES (15, 15, 15, 20, 300);
*/
select * from Buy;
select * from Sell;

WITH RECURSIVE running_sum_value AS(
	select B.time as Buy_Time, B.Qty AS Buy_Quantity, S.qty AS Sell_Quantity
	,SUM(B.Qty) OVER(ORDER BY B.time ) AS R_buy_Qty
	,ISNULL(SUM(B.Qty) OVER(ORDER BY B.time ROWS BETWEEN UNBOUNDED preceding AND 1 preceding),0) AS R_buy_Qty_PREV
	from buy B
	inner join sell S ON
	B.date = S.date  AND B.time < S.time 
)
SELECT Buy_Time
,CASE WHEN Sell_Quantity >= R_buy_Qty THEN Buy_Quantity
ELSE Sell_Quantity - R_buy_Qty_PREV END AS Buy_Quantity 
,CASE WHEN Sell_Quantity >= R_buy_Qty THEN Buy_Quantity
ELSE Sell_Quantity - R_buy_Qty_PREV END AS Sell_Quantity 
FROM running_sum_value
UNION ALL
SELECT Buy_Time,R_buy_Qty - Sell_Quantity AS Buy_Quantity 
,NULL AS Sell_Quantity
FROM running_sum_value
WHERE Sell_Quantity<Buy_Quantity;
