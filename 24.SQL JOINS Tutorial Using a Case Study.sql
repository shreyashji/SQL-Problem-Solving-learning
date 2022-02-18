#SQL JOINS Tutorial Using a Case Study | SQL Fundamentals |Join explanation using Superstore Dataset
SELECT * FROM returns;
SELECT * FROM Superstore_orders;
#total revenue lost from returned orders

#lost revenus ,city wise
select city,sum(sor.sales) from Superstore_orders as sor 
inner join returns ru
on sor.order_ID=ru.Order_ID
group by city;

select sor.order_id,ru.order_id,sor.sales 
from Superstore_orders as sor 
left join returns ru
on sor.order_ID=ru.Order_ID
where ru.Order_ID is null;

select sor.order_id,ru.order_id,sor.sales
from Superstore_orders as sor 
right join returns ru
on sor.order_ID=ru.Order_ID;

select coalesce(sor.order_id,ru.order_id) as order_id_final,sor.sales as sales
from Superstore_orders as sor 
cross join returns ru
on sor.order_ID=ru.Order_ID;

