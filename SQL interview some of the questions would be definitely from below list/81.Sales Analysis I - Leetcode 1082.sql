/*Create table If Not Exists Product (product_id int, product_name varchar(10), unit_price int);
Create table If Not Exists Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int);
Truncate table Product;
insert into Product values ('1', 'S8', '1000');
insert into Product  values ('2', 'G4', '800');
insert into Product  values ('3', 'iPhone', '1400');
Truncate table Sales;
insert into Sales  values ('1', '1', '1', '2019-01-21', '2', '2000');
insert into Sales values ('1', '2', '2', '2019-02-17', '1', '800');
insert into Sales  values ('2', '2', '3', '2019-06-02', '1', '800');
insert into Sales  values ('3', '3', '4', '2019-05-13', '2', '2800');
*/
select * from Product;
select * from Sales;
/* Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all. */
WITH grouped_table as (
	SELECT 
		seller_id,
		sum(price) as total_sales
	FROM Sales
	GROUP BY Seller_id
), rank_table as (
	SELECT 
		seller_id,
        dense_rank() OVER(ORDER BY total_sales DESC) AS rnk_col
	FROM grouped_table
)
SELECT seller_id FROM rank_table WHERE rnk_col=1;
/*oTHER WAY */
with rnk_table as (
	SELECT 
		seller_id,
        dense_rank() OVER(ORDER BY sum(price) DESC) AS rnk_col
	FROM sales
    group by seller_id
)
SELECT seller_id FROM rnk_table WHERE rnk_col=1;

/*
Q2. Write an SQL query that reports the buyers who have bought S8 but not iPhone.
 Note that S8 and iPhone are products present in the Product table.
*/
select * from Product;
select * from Sales;

WITH combined_table as (
	SELECT 
		s.buyer_id,
		p.product_name
	FROM sales as s
	INNER JOIN Product as p
		ON s.product_id = p.product_id
)
SELECT distinct buyer_id FROM combined_table 
	WHERE product_name = 'S8' 
	AND buyer_id NOT IN (SELECT buyer_id FROM combined_table WHERE product_name = 'iPhone');
    
/*
Q3. Write an SQL query that reports the products that were only sold in the spring of 2019.
That is, between 2019-01-01 and 2019-03-31 inclusive.
*/
WITH combined_table as (
	SELECT 
		p.product_id,
		p.product_name,
        s.sale_date
	FROM product as p
	INNER JOIN sales as s
		ON s.product_id = p.product_id
)
SELECT distinct product_id,product_name FROM combined_table 
	WHERE sale_date >= '2019-01-01' and sale_date <= '2019-03-31'
	AND product_id NOT IN (
    SELECT product_id FROM combined_table 
	WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
    );
/* other way */    
	SELECT distinct
		p.product_id,
		p.product_name
	FROM product as p
	INNER JOIN sales as s
		ON s.product_id = p.product_id
	WHERE s.sale_date >= '2019-01-01' and s.sale_date <= '2019-03-31'
		AND p.product_id NOT IN (
		SELECT product_id FROM sales 
		WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31');