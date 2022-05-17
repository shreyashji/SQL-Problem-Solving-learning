Create table If Not Exists orderss (order_number int, customer_number int);
#Truncate table order;
insert into orderss  values (1, 1);
insert into orderss values (2, 2);
insert into orderss values (3, 3);
#insert into orderss (order_number, customer_number) values ('4', '3')
insert into orderss values (4, 3);

/*
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
*/

#Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
WITH grouped_table as(
SELECT customer_number,
	   COUNT(order_number) AS order_count_per_customer 
FROM orderss
GROUP BY customer_number
)
SELECT customer_number FROM grouped_table WHERE order_count_per_customer
 = (SELECT max(order_count_per_customer) FROM grouped_table)








