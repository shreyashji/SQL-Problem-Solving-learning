#How to Calculate Mode in SQL | How to Find Most Frequent Value in a Column
CREATE TABLE mode (
    id INT
);

#insert into mode values (1),(2),(2),(3),(3),(3),(3),(4),(5);
#insert into mode values (4);
#First method will be using pure CTE. Second method will be using Rank function.
#Mode is nothing but most frequent value in an Array.

select * from mode;
#mean : aggregate function avg() to calculate mean
#median: 25.Methods To Calculate Median With SQL
#with CTE
with freq_cte as (
select id,count(*) as freq from mode group by id )
select * from freq_cte 
where freq= (select max(freq) from freq_cte);

#WITH RANK FUNCTION
with freq_cte as (
select id,count(*) as freq from mode group by id )
,rnk_cte as(
select  *
,RANK() OVER(order by freq desc) as rn #max freq will be give rank 1
from freq_cte)
select * from rnk_cte where rn=1
