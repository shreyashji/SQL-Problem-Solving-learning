create table mproducts
(
product_id varchar(20) ,
cost int
);
insert into mproducts values ('P1',200),('P2',300),('P3',500),('P4',800);

create table mcustomer_budget
(
customer_id int,
budget int
);
#find how many products falls in customer budget aong with its list of product
insert into mcustomer_budget values (100,400),(200,800),(300,1500);

select * from mproducts;
select * from mcustomer_budget;

#incase of clash choose lest costly product
with runinng_cost as (
select *,
sum(cost) over(order by cost asc) as runing_cst
from mproducts 
) 
select customer_id,budget,count(1) as no_of_products,GROUP_CONCAT(product_id,',') as list_of_product from mcustomer_budget cb
left join runinng_cost rc on
rc.runing_cst <  cb.budget
group by customer_id,budget

##GROUP_CONCAT() or string_agg()


