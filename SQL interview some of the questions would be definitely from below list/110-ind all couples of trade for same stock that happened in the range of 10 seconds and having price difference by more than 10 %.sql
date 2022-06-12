Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
);

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20);
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15);
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30);
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32);
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19);
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19);

#Write SQL to find all couples of trade for same stock that happened in the range of 10 seconds 
#and having price difference by more than 10 %. 
#Output result should also list the percentage of price difference between the 2 trade

SELECT * FROM Trade_tbl;
#1.PAIRS OF TRADE
#2.TIMESTAMP BETWEEN TWO TRADES should be less than 10 sec
#3. percentage of time difference  should bbe greater than  10%

with recursive cte as (
SELECT Trade_id,trade_timestamp,price FROM Trade_tbl
)
SELECT A.Trade_id AS FirstTrade,
B.Trade_id AS SecondTrade,
FLOOR(ABS(((B.Price- A.price)/A.price)*100)) AS Price_diff
FROM cte AS A
INNER JOIN cte AS B
ON A.Trade_id= B.Trade_id
WHERE datediff(second,A.trade_timestamp,B.trade_timestamp)<=10
AND ABS(((B.Price- A.price)/A.price)*100) >=10
ORDER BY 1;

SELECT ABS(-25);
SELECT FLOOR(100.25);


SELECT first, second, floor(abs((price_2-price_1)*100/price_1)) as 'Price_Diff' FROM
(SELECT * FROM
(select trade_ID AS 'FIRST',TRADE_TIMESTAMP AS 'TRADE_TIMESTAMP_1',PRICE AS 'PRICE_1' FROM trade_tbl) A
INNER JOIN
(select trade_ID AS 'SECOND', TRADE_TIMESTAMP AS 'TRADE_TIMESTAMP_2',PRICE AS 'PRICE_2' FROM trade_tbl) B
ON A.FIRST < B.SECOND) C
where DATEDIFF(second ,TRADE_TIMESTAMP_1,TRADE_TIMESTAMP_2) <=10
and abs((price_2-price_1)*100/price_1) >= 10 order by first;