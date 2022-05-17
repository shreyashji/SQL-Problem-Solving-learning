/*CREATE TABLE dbo.int_orders(
 order_number int NOT NULL,
 order_date date NOT NULL,
 cust_id int NOT NULL,
 salesperson_id int NOT NULL,
 amount float NOT NULL
) ;
SELECT * FROM dbo.int_orders;
INSERT INTO dbo.int_orders VALUES (30, CAST(N'1995-07-14' AS Date), 9, 1, 460);
INSERT INTO dbo.int_orders VALUES (10, CAST(N'1996-08-02' AS Date), 4, 2, 540);
INSERT INTO dbo.int_orders VALUES (40, CAST(N'1998-01-29' AS Date), 7, 2, 2400);
INSERT INTO dbo.int_orders VALUES (50, CAST(N'1998-02-03' AS Date), 6, 7, 600);
INSERT INTO dbo.int_orders VALUES (60, CAST(N'1998-03-02' AS Date), 6, 7, 720);
INSERT INTO dbo.int_orders VALUES (70, CAST(N'1998-05-06' AS Date), 9, 7, 150);
INSERT INTO dbo.int_orders VALUES (20, CAST(N'1999-01-30' AS Date), 4, 8, 1800);
*/
#SIMPLE SUM
SELECT SUM(amount) from dbo.int_orders;

#cant use any other column,not in group by nor aggreagated value
SELECT salesperson_id,order_number,SUM(amount) from dbo.int_orders
group by salesperson_id;

#USE ADVANCE FUNCTION
select  salesperson_id,order_number,ORDER_DATE,
SUM(amount) over(partition by salesperson_id order by ORDER_DATE ) from dbo.int_orders;

select  salesperson_id,order_number,ORDER_DATE, #sum of previous two rows + current
SUM(amount) over(order by ORDER_DATE rows  between 2 preceding and current row) from dbo.int_orders;

select  salesperson_id,order_number,ORDER_DATE, #sum of previous two rows + current
SUM(amount) over(order by ORDER_DATE rows  between 1 preceding and 1 preceding) from dbo.int_orders;

select  salesperson_id,order_number,ORDER_DATE, #sum of previous two rows + current
SUM(amount) over(order by ORDER_DATE rows  between unbounded  preceding and current row) from dbo.int_orders;

#lag without lag
select  salesperson_id,order_number,ORDER_DATE, #sum of previous two rows + current
SUM(amount) over(order by ORDER_DATE rows  between 1  preceding and 1 preceding) from dbo.int_orders;
/*lead*/
select  salesperson_id,order_number,ORDER_DATE, #sum of previous two rows + current
SUM(amount) over(order by ORDER_DATE rows  between 1  following and 1 following) from dbo.int_orders;