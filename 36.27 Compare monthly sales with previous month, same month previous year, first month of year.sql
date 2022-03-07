#In this video, we write a SQL to compare monthly sales -
#1) With previous month
#2) same month previous year
#3) first month of year

#Compare monthly sales with previous month, same month previous year, first month of year
select order_date,sales
from superstore_orders;

#sales of each month from different years ,LAG: bring data from previous row
select  year(order_date),Month(order_date),sum(sales) , 
lag(sum(sales)) OVER(order by year(order_date),Month(order_date) )
from superstore_orders
where year(order_date) in (2012,2013)
group by year(order_date),Month(order_date);

#to get month by month comparison,compare monthly data with revious month data 
select  year(order_date),Month(order_date),sum(sales),
lag(sum(sales)) OVER(order by year(order_date),Month(order_date) )
from superstore_orders
where year(order_date) in (2012,2013)
group by year(order_date),Month(order_date);

#2compare same month from previous year,default offset is 1,lag(sum(sales),offset)
select  year(order_date),Month(order_date), sum(sales) -
lag(sum(sales),12) OVER(order by year(order_date),Month(order_date) )
from superstore_orders
where year(order_date) in (2012,2013)
group by year(order_date),Month(order_date);

#compare data of 1st month of same year,eg. august,subtract 7
#october (10)-1=9
#fetch month(order_date) and -1 from currnt month
#3.compare monthly sales from 1st moth of that year
select  year(order_date),Month(order_date), sum(sales),
lag(sum(sales),Month(order_date) - 1) OVER(order by year(order_date),Month(order_date) )
from superstore_orders
where year(order_date) in (2012,2013)
group by year(order_date),Month(order_date);
