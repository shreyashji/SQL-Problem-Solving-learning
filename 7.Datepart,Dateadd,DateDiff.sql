
#dateapart function in mysql
select datepart(day,'2022-01-23') ;
select datepart(week,'2022-01-23') ;
select datepart(year,'2022-01-23') ;
select datepart(month,'2022-01-23') ;

#dateadd function, increment day,month,week,year
select dateadd(day,2,'2022-01-23');

#datediff 
select datediff(day,'2022-01-01','2022-01-23');
select datediff(week,'2022-01-01','2022-01-23');
#or abbrevation
select datediff(wk,'2022-01-01','2022-01-23');

create table customer_orders_dates ( 
order_id int,
customer_id int,
order_date date,
ship_date date
);

select * from customer_orders_dates;
#insert into customer_orders_dates values(1000, 1 , '2022-01-05', '2022-01-11');
#insert into customer_orders_dates values(1001, 2 , '2022-02-04', '2022-02-16');
#insert into customer_orders_dates values(1002, 3 , '2022-01-01', '2022-01-19');
#insert into customer_orders_dates values(1003, 4 , '2022-01-06', '2022-01-30');
#insert into customer_orders_dates values(1004, 1 , '2022-02-07', '2022-02-13');
#insert into customer_orders_dates values(1005, 4 , '2022-01-07', '2022-01-31');
#insert into customer_orders_dates values(1006, 3 , '2022-02-08', '2022-02-26');
#insert into customer_orders_dates values(1007, 2 , '2022-02-09', '2022-02-21');
#insert into customer_orders_dates values(1008, 4 , '2022-02-10', '2022-03-06');

select * from customer_orders_dates;
#ssms
select *, DATEDIFF(day,order_date,ship_date) as days_to_ship from customer_orders_dates ;
select *, DATEDIFF(week,order_date,ship_date) as days_to_ship from customer_orders_dates ;
#mysql
select *, DATEDIFF(order_date,ship_date) as days_to_ship from customer_orders_dates ;

#want to know the no. of business days,let say company doesnt work on weekends
##ssms ,if one week we have to minus 2 days saturday,sunday
select *, DATEDIFF(day,order_date,ship_date) as days_to_ship
,DATEDIFF(week,order_date,ship_date) as week_between_days
,DATEDIFF(day,order_date,ship_date) - 2 * DATEDIFF(week,order_date,ship_date) as business_days_to_ship
 from customer_orders_dates ;
 
 ##mysql wrongs otp
 select *, DATEDIFF(order_date,ship_date) as days_to_ship
,DATEDIFF(order_date,ship_date) as week_between_days
,DATEDIFF(order_date,ship_date) - 2 * DATEDIFF(order_date,ship_date) as business_days_to_ship
 from customer_orders_dates ;
 
create table customer_dob ( 
customer_id int,
customer_name varchar(20),
gender varchar(7),
dob date
);
#drop table customer_dob;
#insert into customer_dob values(1,'Rahul' , 'M', '2000-01-05');
#insert into customer_dob values(2,'Shilpa' , 'F', '2004-04-05');
#insert into customer_dob values(3,'Ramesh' , 'M', '2003-07-07');
#insert into customer_dob values(4,'katrina' , 'F', '2005-02-05');
#insert into customer_dob values(5,'Alia' , 'F', '1992-01-01');

# present age of the customer
#ssms
SELECT *,
datediff(years,dob,getdate()) as customer_age
 FROM  customer_dob;
 
 #mysql wrong opt
 SELECT *,
datediff(dob,YEAR(now())) as customer_age
 FROM  customer_dob;

