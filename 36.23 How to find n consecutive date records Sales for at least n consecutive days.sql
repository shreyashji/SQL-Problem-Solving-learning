#How to find n consecutive date records | Sales for at least n consecutive days.
#DATEADD(DAYS,SPECIFY WHAT VALUE OF DATE(HOW many days want to subtract), from which you want to subtract)
select  order_date ,
DATEADD(D, - row_number() over(order by order_date), order_date) as col1
from superstore_orders;

#subtract row no from oderd date col,so we get same value or date for consecutive records,perfrom count on col1 it has same value,use cte 
with cte as (
select  order_date ,
DATEADD(D, - row_number() over(order by order_date), order_date) as col1
from superstore_orders)
select count(*) as cnt,MIN(order_date) as startdate as od,max(order_date) as enddate FROM cte group by col1

#atleast 3 consecutive date
with cte as (
select  order_date ,
DATEADD(D, - row_number() over(order by order_date), order_date) as col1
from superstore_orders)
select startdate,enddate from 
(select count(*) as cnt,MIN(order_date) as startdate as od,max(order_date) as enddate FROM cte group by col1) as  tbla
where cnt>=3