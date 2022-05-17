#Customers Who Bought All Products
/*
Create table If Not Exists Customer2 (customer_id int, product_key int);
Create table Product2 (product_key int);
#Truncate table Customer2;
insert into Customer2  values (1, 5);
insert into Customer2  values (2, 6);
insert into Customer2  values (3, 5);
insert into Customer2  values (3, 6);
insert into Customer2  values (1, 6);
#insert into Customer2 (customer_id, product_key) values ('1', '6');
#Truncate table Product2;
insert into Product2  values (5);
insert into Product2  values (6);
#insert into Product2 (product_key) values ('6')
*/
/*
Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.
*/

#Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.
select * from Customer2;
select * from Product2;

SELECT customer_id 
FROM Customer2
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
	SELECT COUNT(product_key) FROM Product2
)
