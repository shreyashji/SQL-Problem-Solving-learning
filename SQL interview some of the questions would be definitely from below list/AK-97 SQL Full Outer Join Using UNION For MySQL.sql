USE WORLD;
SELECT * FROM customer_DOB;
select * from customer_orders_dates;

SELECT c.customer_id, c.customer_name,co.customer_id as co_customer_id,co.order_date
FROM customer_dob c
FULL OUTER JOIN customer_orders_dates co
ON c.customer_id = co.customer_id ; 

SELECT c.customer_id, c.customer_name,co.customer_id as co_customer_id,co.order_date
FROM customer_dob c
LEFT JOIN customer_orders_dates co
ON c.customer_id = co.customer_id
UNION ALL
SELECT c.customer_id, c.customer_name,co.customer_id as co_customer_id,co.order_date
FROM customer_orders_dates co 
LEFT JOIN customer_dob c
ON c.customer_id = co.customer_id
where c.customer_id is NULL;