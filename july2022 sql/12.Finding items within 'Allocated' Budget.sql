use july;

CREATE TABLE july.product(
id int,
name varchar(30),
cost decimal(10,2)
);

INSERT INTO july.product VALUES(1,'Chair',300),(2,'Laptop',56000),(3,'Goggles',1000),(4,'Television',12000),(5,'Pen',20),(6,'Bedsheet',800);

CREATE TABLE july.customer(
cust_id int,
cust_name varchar(30),
budget decimal(10,2)
);

INSERT INTO july.customer VALUES(1,'Arjun Reddy',7000),(2,'Mohan Rai',50),(3,'Vaishali Solanki',23000),(4,'Yash Sarkar',10000);

SELECT * FROM july.product;
SELECT * FROM july.customer;

/*
Finding items within 'Allocated' Budget
PROBLEM STATEMENT : ❋ We have input table "customer" having below columns:
cust_id,cust_name,budget
❋ Another input table "product" has below columns:
id,name,cost
❋ We need to find all the products that user can buy within their budget in the increasing order of cost.
*/
/* step 0: displaying the inputs */
SELECT * FROM july.product;
SELECT * FROM july.customer;

/* step 1: getting the running total  */
WITH accum_cost AS(
SELECT *,SUM(cost) OVER(ORDER BY cost) running_total
FROM july.product
)
select * from accum_cost;


/*step 2: identifying the product within customer budget */
#sql server query
WITH  accum_cost AS(
SELECT *,SUM(cost) OVER(ORDER BY cost) running_total
FROM july.product
)
SELECT c.cust_id,c.cust_name,c.budget,STRING_AGG(a.name,',') items_purchased,
MAX(running_total) total_expenditure,COUNT(*) total_items
FROM july.customer c INNER JOIN accum_cost a
ON a.running_total <= c.budget
GROUP BY c.cust_id,c.cust_name,c.budget;

#mysql query
WITH recursive accum_cost AS(
SELECT *,SUM(cost) OVER(ORDER BY cost) running_total
FROM july.product
)
SELECT c.cust_id,c.cust_name,c.budget,concat(a.name,',') items_purchased,
MAX(running_total) total_expenditure,COUNT(*) total_items
FROM july.customer c INNER JOIN accum_cost a
ON a.running_total <= c.budget
GROUP BY c.cust_id,c.cust_name,c.budget;
