select * from superstore_orders;
#ssms
select 
translate(order_id,'0123456789','          ') as Empname,
trim(translate(order_id,translate(order_id,'0123456789','          '),space(len(translate(order_id,'0123456789','          '))))) as Empname,
order_id from superstore_orders;

#mysql
select 
trim(replace(order_id,'2020-20182019','             ')) as emp_name,
trim(replace(order_id,replace(order_id,'2020-20182019','             '),space(length(replace(order_id,'2020-20182019','             '))))) as emp_id,
order_id from superstore_orders;

