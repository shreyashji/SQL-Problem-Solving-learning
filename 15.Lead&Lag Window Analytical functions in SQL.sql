#LEAD/LAG WINDOW FUNCTION=USED WHEN WE HAVE TO SEE DATA OF CURRENT ROW WITH PREVIOUS OR NEXT ROW
#lag is previous row
#lead is next row
select * from superstore_orders;

WITH year_sales AS 
( select datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by datepart(year,order_date))
 select * from year_sales  order by order_year;
 
 #LAG
 WITH year_sales AS 
(select datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by datepart(year,order_date))
 select *,
 lag(sales,1,0) OVER(order by order_year) as previous_year_sales
 ,sales-lag(sales,1,0) OVER(order by order_year) as previous_year_sales
 from year_sales  order by order_year;
 
  WITH year_sales AS 
(select datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by datepart(year,order_date))
 select *,
 lag(sales,1,0) OVER(order by order_year) as previous_year_sales
 from year_sales  order by order_year;
 
 #LEAD 
WITH year_sales AS 
(select datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by datepart(year,order_date))
select *,
lead(sales,1,0) OVER(order by order_year) as next_year_sales
from year_sales  order by order_year;
 
 # this will give prev year sales just by adding desc in orderbey in leag
WITH year_sales AS 
(select datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by datepart(year,order_date))
select *,
lead(sales,1,0) OVER(order by order_year desc) as next_year_sales
from year_sales  order by order_year desc;
 
 
 WITH year_sales AS 
(select region,datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by region,datepart(year,order_date))
select *,
lag(sales,1,0) OVER(partition by region order by order_year) as prev_year_sales
from year_sales  order by region,order_year;

 # region wise,and cal 2 roows year
 WITH year_sales AS 
(select region,datepart(year,order_date) as order_year, sum(sales) as sales 
from superstore_orders group by region,datepart(year,order_date))
select *,
lag(sales,2,0) OVER(partition by region order by order_year) as prev_year_sales
from year_sales  order by region,order_year;
 
 
 
 

