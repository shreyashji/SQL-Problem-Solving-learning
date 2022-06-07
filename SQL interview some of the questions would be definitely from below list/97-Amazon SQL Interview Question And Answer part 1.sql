use  it;
/*
CREATE TABLE Order_Tbl(
 ORDER_DAY date,
 ORDER_ID varchar(10) ,
 PRODUCT_ID varchar(10) ,
 QUANTITY int ,
 PRICE int 
) ;

INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR1', 'PROD1', 5, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR2', 'PROD2', 2, 10);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR3', 'PROD3', 10, 25);
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR4', 'PROD1', 20, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR5', 'PROD3', 5, 25);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR6', 'PROD4', 6, 20);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR7', 'PROD1', 2, 5);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR8', 'PROD5', 1, 50);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR9', 'PROD6', 2, 50);
INSERT INTO Order_Tbl  VALUES ('2015-05-02','ODR10','PROD2', 4, 10);
*/
select * from Order_Tbl;
/* part 1
This question has been asked in Amazon interview for the role of Data Analyst
Order_Tbl has four columns namely ORDER_DAY, ORDER_ID, PRODUCT_ID, QUANTITY and PRICE
(a) Write a SQL to get all the products that got sold on both the days and the number of times
 the product is sold.*/
SELECT product_id,COUNT(product_id) as ccount #COUNT(DISTINCT order_day)  AS distinct_order_day
FROM Order_Tbl
GROUP BY product_id
HAVING COUNT(DISTINCT order_day)>1;

/* (b) (b) Write a SQL to get products that was ordered on 02-May-2015 but not on 01-May-2015*/
#Using Subquerry
SELECT DISTINCT(product_id) FROM Order_Tbl
WHERE order_day = '2015-05-02'
AND product_id NOT IN (SELECT product_id FROM Order_Tbl WHERE order_day = '2015-05-01');

#using JOIN
SELECT A.product_id #,B.product_id 
FROM (
(SELECT product_id FROM Order_Tbl WHERE order_day = '2015-05-02') A
LEFT JOIN
(SELECT product_id FROM Order_Tbl WHERE order_day = '2015-05-01') B
ON A.product_id =B.product_id)
WHERE B.product_id IS NULL;

#USING eXCEPT qUERY
#SELECT product_id FROM Order_Tbl WHERE order_day = '2015-05-02' EXCEPT
#SELECT product_id FROM Order_Tbl WHERE order_day = '2015-05-01';

/* part 2
(a) Write a SQL to get the highest sold Products (Quantity*Price) on both the days */
select * from Order_Tbl;

SELECT A.order_day,B.product_id,A.sold_amount FROM(
(SELECT order_day,MAX(quantity*price) AS sold_amount FROM Order_Tbl GROUP BY  order_day) A
INNER JOIN 
(SELECT order_day,product_id,quantity*price AS sold_amount FROM Order_Tbl GROUP BY  order_day)B
ON A.order_day = B.order_day AND A.sold_amount = B.sold_amount);

#OTHER WAYS
select order_day, product_id , TOTAL_MONEY from(
 SELECT order_day, product_id,(price*quantity) as TOTAL_MONEY,
 ROW_NUMBER () over (partition by (order_day) order by (price*quantity) desc) as MAX_PRICE from pro
 ) AS a
 where MAX_PRICE='1';

/* (b) Write a SQL to get all product's  total sales on 1st May and 2nd May adjacent to each other */
SELECT product_id,
SUM(ISNULL(Sales_01,0)) AS Total_Sales_01,
SUM(ISNULL(Sales_02,0)) AS Total_Sales_02
FROM 
(
SELECT product_id,
CASE WHEN order_day='2015-05-01' THEN Total_Sales END AS 'Sales_01',
CASE WHEN order_day='2015-05-01' THEN Total_Sales END AS 'Sales_02'
FROM 
(
SELECT order_day,product_id,SUM(quantity*price) AS Total_Sales 
FROM Order_Tbl GROUP BY order_day,product_id)A
)B
GROUP BY product_id;


/* (c) Write a SQL to get all products day wise, that was ordered more than once*/
