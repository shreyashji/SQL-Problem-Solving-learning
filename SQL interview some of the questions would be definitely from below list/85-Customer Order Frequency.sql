/*
Create table If Not Exists Customers (customer_id int, name varchar(30), country varchar(30));
Create table If Not Exists Products (product_id int, description varchar(30), price int);
Create table If Not Exists Orders (order_id int, customer_id int, product_id int, order_date date, quantity int);

Truncate table Customers;
#insert into Customers (customer_id, name, country) values ('1', 'Winston', 'USA');
insert into Customers  values (1, 'Winston', 'USA');
insert into Customers values (2, 'Jonathan', 'Peru');
insert into Customers  values (3, 'Moustafa', 'Egypt');

Truncate table Product;

insert into Products (product_id, description, price) values (10, 'LC Phone', 300);
insert into Products (product_id, description, price) values (20, 'LC T-Shirt', 10);
insert into Products (product_id, description, price) values (30, 'LC Book', 45);
insert into Products (product_id, description, price) values (40, 'LC Keychain', 2);

Truncate table Orders;
insert into Orders  values (1, 1, 10, '2020-06-10', 1);
insert into Orders  values (2, 1, 20, '2020-07-01', 1);
insert into Orders  values (3, 1, 30, '2020-07-08', 2);
insert into Orders  values (4, 2, 10, '2020-06-15', 2);
insert into Orders  values (5, 2, 40, '2020-07-01', 10);
insert into Orders  values (6, 3, 20, '2020-06-24', 2);
#insert into Orders (order_id, customer_id, product_id, order_date, quantity) values ('7', '3', '30', '2020-06-25', '2')
insert into Orders  values (7, 3, 30, '2020-06-25', 2);
*/
/*
Customers table:
+--------------+-----------+-------------+
| customer_id  | name      | country     |
+--------------+-----------+-------------+
| 1            | Winston   | USA         |
| 2            | Jonathan  | Peru        |
| 3            | Moustafa  | Egypt       |
+--------------+-----------+-------------+
Product table:
+--------------+-------------+-------------+
| product_id   | description | price       |
+--------------+-------------+-------------+
| 10           | LC Phone    | 300         |
| 20           | LC T-Shirt  | 10          |
| 30           | LC Book     | 45          |
| 40           | LC Keychain | 2           |
+--------------+-------------+-------------+
Orders table:
+--------------+-------------+-------------+-------------+-----------+
| order_id     | customer_id | product_id  | order_date  | quantity  |
+--------------+-------------+-------------+-------------+-----------+
| 1            | 1           | 10          | 2020-06-10  | 1         |
| 2            | 1           | 20          | 2020-07-01  | 1         |
| 3            | 1           | 30          | 2020-07-08  | 2         |
| 4            | 2           | 10          | 2020-06-15  | 2         |
| 5            | 2           | 40          | 2020-07-01  | 10        |
| 6            | 3           | 20          | 2020-06-24  | 2         |
| 7            | 3           | 30          | 2020-06-25  | 2         |
| 9            | 3           | 30          | 2020-05-08  | 3         |
+--------------+-------------+-------------+-------------+-----------+
Output: 
+--------------+------------+
| customer_id  | name       |  
+--------------+------------+
| 1            | Winston    |
+--------------+------------+
Explanation: 
Winston spent $300 (300 * 1) in June and $100 ( 10 * 1 + 45 * 2) in July 2020.
Jonathan spent $600 (300 * 2) in June and $20 ( 2 * 10) in July 2020.
Moustafa spent $110 (10 * 2 + 45 * 2) in June and $0 in July 2020.
*/

select * from Customers;
select * from Product;
select * from Orders;

/* Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 
in each month of June and July 2020. Return the result table in any order. The query  */
WITH filter_orders AS(
	SELECT 
		order_id,
        customer_id,
        product_id,MONTH(order_date) AS order_month,
        quantity
	FROM orders
    WHERE year(order_date) = 2020 AND MONTH(order_date) IN (6,7)
)
SELECT
	c.customer_id,
    c.name,
    fo.order_month,
    SUM(fo.quantity * p.price) AS total_sale_per_customer
FROM customers AS c
	INNER JOIN filter_orders AS fo
	on c.customer_id = fo.customer_id
	INNER JOIN Products AS p
    on fo.product_id = p.product_id
    GROUP BY c.customer_id,fo.order_month
HAVING SUM(fo.quantity * p.price) >= 100;


/*FINAL QUERY*/
WITH filter_orders AS(
	SELECT 
		order_id,
        customer_id,
        product_id,MONTH(order_date) AS order_month,
        quantity
	FROM orders
    WHERE year(order_date) = 2020 AND MONTH(order_date) IN (6,7)
),order_stats as (
SELECT
	c.customer_id,
    c.name,
    fo.order_month,
    SUM(fo.quantity * p.price) AS total_sale_per_customer
FROM customers AS c
	INNER JOIN filter_orders AS fo
	on c.customer_id = fo.customer_id
	INNER JOIN Products AS p
    on fo.product_id = p.product_id
    GROUP BY c.customer_id,fo.order_month
HAVING SUM(fo.quantity * p.price) >= 100
)
SELECT customer_id,name,order_month FROM order_stats GROUP BY customer_id HAVING COUNT(order_month) >=2

