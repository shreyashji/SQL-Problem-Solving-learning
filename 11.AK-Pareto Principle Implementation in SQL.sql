#Pareto Principle (80/20 Rule) Implementation in SQL
#The pareto principle states that for many outcomes,roughly 80% of consequences come from 20% of causes eg:
#1-80% of productivity come from 20% of the employees
#2-80% of your sales come from 20% of your clients
#3-80% of decision in a meeting  are made in 20% of the time
# we are solving the below question
#4-80% of your sales come from 20% of your product or servies
select sum(sales) * 0.8 from superstore_orders;  # 80% sales
#167401.6432799999 80% #add the rows and see where its is matching or close to this no.
#so we find running total ,we use window function

with product_wise_sales as 
(select  Product_ID,sum(sales) as product_sales from superstore_orders
group by Product_ID )
,calc_sales as (
select Product_ID,product_sales
,sum(product_sales) over (order by product_sales desc rows between unbounded preceding and 0 preceding) as running_sales
,0.8*sum(product_sales) over () as total_sales
from product_wise_sales )
select * from calc_sales where running_sales <= total_sales

