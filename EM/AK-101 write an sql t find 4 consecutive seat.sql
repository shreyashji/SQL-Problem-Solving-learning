use it;

create table movie(
seat varchar(50),occupancy int
);

insert into movie values('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

select * from movie;
# there are 4 rows in a movie hall each with 10 seats in each row
# write an sql t find 4 consecutive seat
with recursive cte_1 as (
SELECT *,
LEFT(seat,1) as rowid , CAST(SUBSTRING(seat,2,2) as int) AS Seat_id
from movie)
, cte_2 as (
SELECT *
,max(occupancy) OVER(partition by rowid ORDER BY Seat_id ROW BETWEEN CURRENT ROW AND 3 FOLLOWING) AS is_4_empty
,count(occupancy) OVER(partition by rowid ORDER BY Seat_id ROW BETWEEN CURRENT ROW AND 3 FOLLOWING) AS CNT
from cte_1 )
,CTE_3 AS (
SELECT * FROM cte_2 WHERE is_4_empty=0 AND CNT=4 )

SELECT cte_2.*  FROM cte_2 INNER JOIN CTE_3 ON CTE_2.rowid = CTE_3.rowid AND CTE_2.Seat_id BETWEEN CTE_3.SEAT_ID 
AND CTE_3.SEAT_ID+3

