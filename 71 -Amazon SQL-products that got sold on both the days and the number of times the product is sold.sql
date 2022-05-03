CREATE TABLE Order_Tbl(
 ORDER_DAY date,
 ORDER_ID varchar(10) ,
 PRODUCT_ID varchar(10) ,
 QUANTITY int ,
 PRICE int 
) ;
/*
INSERT INTO Order_Tbl  VALUES ('2015-05-01','ODR1', 'PROD1', 5, 5);
INSERT INTO Order_Tbl   VALUES ('2015-05-01','ODR2', 'PROD2', 2, 10);
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
#write a sql querry to get all the product thAt got sold on both days and the number of times the product is sold
select product_id,count(product_id) as COUNT_n #,count(distinct ORDER_dAY)
from Order_Tbl
GROUP BY product_id
HAVING COUNT(distinct ORDER_dAY) > 1;


# write a sql querry to get product that was ordered on 2 may 2015 but not on 1 may 2015
#SIMPLE WAY
select product_id  from Order_Tbl
where order_day = '2015-05-02'
EXCEPT
select product_id  from Order_Tbl
where order_day = '2015-05-01';

#using subquerry
select distinct(product_id)  from Order_Tbl
where order_day = '2015-05-02' 
and product_id not in (select product_id  from Order_Tbl
where order_day = '2015-05-01' );

#using join
select A.product_id,B.product_id FROM
(
select product_id  from Order_Tbl
where order_day = '2015-05-02' ) A
LEFT JOIN 
(
select product_id  from Order_Tbl
where order_day = '2015-05-01'
) B
ON A.PRODUCT_ID = B.PRODUCT_ID
WHERE B.PRODUCT_ID IS NULL