/* 
CREATE TABLE int_orders2(
 order_number int NOT NULL,
 order_date date NOT NULL,
 cust_id int NOT NULL,
 salesperson_id int NOT NULL,
 amount float NOT NULL
) ;

INSERT INTO int_orders2  VALUES (30, CAST('1995-07-14' AS Date), 9, 1, 460);
INSERT INTO int_orders2  VALUES  (10, CAST('1996-08-02' AS Date), 4, 2, 540);
INSERT INTO int_orders2  VALUES  (40, CAST('1998-01-29' AS Date), 7, 2, 2400);
INSERT INTO int_orders2 VALUES  (50, CAST('1998-02-03' AS Date), 6, 7, 600);
INSERT INTO int_orders2  VALUES  (60, CAST('1998-03-02' AS Date), 6, 7, 720);
INSERT INTO int_orders2 VALUES  (70, CAST('1998-05-06' AS Date), 9, 7, 150);
INSERT INTO int_orders2 VALUES (20, CAST('1999-01-30' AS Date), 4, 8, 1800);
*/
#FIND THE LARGEST ORDER BY VALUE FOR EACH SALESPERSON  AND DISPLAY  ORDER DETAILS
#GET result without using subquery , cte, windows function , temp tables

SELECT a.order_number,a.order_date,a.cust_id,a.salesperson_id,a.amount FROM int_orders2 as a
left join int_orders2 as b on a.salesperson_id = b.salesperson_id
group by a.order_number,a.order_date,a.cust_id,a.salesperson_id,a.amount
HAVING a.amount >= max(b.amount);