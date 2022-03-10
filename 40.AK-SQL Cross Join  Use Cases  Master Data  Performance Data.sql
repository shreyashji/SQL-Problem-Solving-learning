#create table productss (id int,name varchar(10));
#insert into productss VALUES (1, 'A'),(2, 'B'),(3, 'C'),(4, 'D'),(5, 'E');
#create table colors (color_id int,color varchar(50));
#insert into colors values (1,'Blue'),(2,'Green'),(3,'Orange');
#create table sizes(size_id int,size varchar(10));
#insert into sizes values (1,'M'),(2,'L'),(3,'XL');
#create table transactions(order_id int,product_name varchar(20),color varchar(10),size varchar(10),amount int);
#insert into transactions values (1,'A','Blue','L',300),(2,'B','Blue','XL',150),(3,'B','Green','L',250),(4,'C','Blue','L',250),
#(5,'E','Green','L',270),(6,'D','Orange','L',200),(7,'D','Green','M',250);
select * from productss;
select * from colors;
select * from sizes;
select * from transactions;
#cross join
select * from productss,colors;
select p.*,c.* from productss p,colors c;

#use case of cross join
#prepare master data
select * from transactions;
#give me the sales for each product size,color
select product_name,color,size,sum(amount) as total_amount
 from transactions
group by product_name,color,size;

#if not sold show zero
with master_data_cte as (
select p.name as product_name,c.color,s.size from productss p,colors c,sizes s)
, sales_cte as (select product_name,color,size,sum(amount) as total_amount
from transactions
group by product_name,color,size)
select md.product_name,md.color,md.size , isnull(s.total_amount,0) as total_amount from master_data_cte md 
left join 
sales_cte s on md.product_name = s.product_name
and md.color = s.color and md.size = s.size
order by total_amount;

#use case 2 : prepare large no . of  rows for performance testing
#unique order id
select row_number() over(order by t.order_id) as order_id,
t.Product_Name,t.color,t.size, 
Case when row_number() over(order by t.order_id)%3=0 then 'L' else 'XL' end size,t.amount
from transactions t,superstore_orders o;

#more rows by joining again with transaction
select row_number() over(order by t.order_id) as order_id,
t.Product_Name,t.color,t.size, 
Case when row_number() over(order by t.order_id)%3=0 then 'L' else 'XL' end size,t.amount
from transactions t,superstore_orders o,transactions t1;
#table structure will be created
select * into transactions_test from transactions where 1=2;
select * from transactions_test;
#now insert
insert into transactions_test
select row_number() over(order by t.order_id) as order_id,
t.Product_Name,t.color,t.size, 
Case when row_number() over(order by t.order_id)%3=0 then 'L' else 'XL' end size,t.amount
from transactions t,superstore_orders o,transactions t1;

