


# or  ,sum(sales) over(order by year_order asc, month_order asc rows between 2 preceding and 0 preceding) as rolling_sum 
with year_month_sales as (
select datepart(year,order_date) as year_order, datepart(month,order_date) as month_order, sum(sales) as sales
from cust_orders 
group by datepart(year,order_date), datepart(month,order_date)
)
select *
,sum(sales) over(order by year_order asc, month_order asc rows between 1 preceding and 1 following) as rolling_sum
,avg(sales) over(order by year_order asc, month_order asc rows between 1 preceding and 1 following) as rolling_avg
,min(sales) over(order by year_order asc, month_order asc rows between 1 preceding and 1 following) as rolling_min
,max(sales) over(order by year_order asc, month_order asc rows between 1 preceding and 1 following) as rolling_max
from year_month_sales