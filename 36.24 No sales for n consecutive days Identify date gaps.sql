#No sales for n consecutive days | Identify date gaps
select order_date from superstore_orders
order by order_date;

#we have to get the next record ,so we use lead(next consecutive date), #01-04-20	01-06-18 gap
select order_date,
lead(order_date)  over(order by order_date) as Lead_date
from superstore_orders
order by order_date;

#now we need to find difference value
#ssms only
select order_date,
datediff(day, order_date, (lead(order_date)  over(order by order_date) ) ) as Gap
from superstore_orders
order by order_date;

#need to find whenn there is no sales,put above in subquerry
select * from (
select order_date,
datediff(day, order_date, (lead(order_date)  over(order by order_date) ) ) as Gap
from superstore_orders) as NoSales
where  NoSales.gap > 1 # greatedr than 1





