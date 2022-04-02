#create table bms (seat_no int ,is_empty varchar(10));
#insert into bms values(1,'N'),(2,'Y'),(3,'N'),(4,'Y'),(5,'Y',(6,'Y'),(7,'N'),(8,'Y'),(9,'Y'),(10,'Y'),(11,'Y'),(12,'N'),(13,'Y'),(14,'Y');
#3 OR MORE Consecutive Empty Seats
#METHOD 1 -  LEAD/LAG
select * from (
SELECT *
,LAG(is_empty,1) over(order by seat_no) as prev_1
,LAG(is_empty,2) over(order by seat_no) as prev_2
,Lead(is_empty,1) over(order by seat_no) as next_1
,Lead(is_empty,2) over(order by seat_no) as next_2
FROM BMS) A
where is_empty = 'Y' and prev_1 = 'Y' and prev_2 = 'Y'
or (is_empty = 'Y' and prev_1 = 'Y' and next_1 = 'Y')
or (is_empty = 'Y' and next_1 = 'Y' and next_2 = 'Y') ;

#method-2 Advance Aggregation
select * from (
SELECT *
,sum(case when is_empty='Y' then 1 else 0 end) over(order by seat_no rows between 2 preceding and current row) as prev_2
,sum(case when is_empty='Y' then 1 else 0 end) over(order by seat_no rows between 1 preceding and 1 following) as prev_next_1
,sum(case when is_empty='Y' then 1 else 0 end) over(order by seat_no rows between current row and 2 following) as next_2
FROM BMS) a 
where prev_2=3 or prev_next_1=3 or next_2=3;

#Method 3: Using ROW_NUMBER
with diff_num as (
select *
,row_number() over(order by seat_no) as rn
,seat_no-row_number() over(order by seat_no) as diff
 from bms where is_empty='Y'),
 cnt as (
 select diff, count(1) as c from diff_num 
 group by diff having count(1)>=3)
 select * from diff_num where diff in (select diff from cnt) ;
