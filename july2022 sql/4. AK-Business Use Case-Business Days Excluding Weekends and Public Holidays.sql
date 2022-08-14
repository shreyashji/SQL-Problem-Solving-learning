/*
business use case where we need to find difference between 2 dates excluding weekends and public holidays  .
Basically we need to find business days between 2 given dates using SQL. 
use july;
create table july.tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
#delete from tickets;
insert into july.tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table july.holidays
(
holiday_date date
,reason varchar(100)
);
#delete from july.holidays;
insert into july.holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');
*/
/*
2022-08-01 -> Monday  , --- 2022-08-03 -> wednesday
2022-08-01 -> Monday  , --- 2022-08-12 -> friday
2022-08-01 -> Monday  , --- 2022-08-16 -> tuesday
*/

SELECT * FROM july.tickets;

SELECT *
,DATEDIFF(DAY,create_date ,resolved_date) AS Actual_days
,DATEPART(Week,create_date)
,DATEPART(Week,resolved_date)
,DATEDIFF(week,create_date ,resolved_date) AS week_diff
FROM july.tickets;

SELECT * ,DATEDIFF(DAY,create_date ,resolved_date) AS Actual_days
,DATEDIFF(DAY,create_date ,resolved_date)-2*DATEDIFF(week,create_date ,resolved_date) AS business_days
FROM 
(SELECT ticket_id,create_date , resolved_date,count(holiday_date) AS No_of_holidays
#,DATEDIFF(DAY,create_date ,resolved_date) AS Actual_days
FROM july.tickets
left join july.holidays on holiday_date between create_date and resolved_date
GROUP BY ticket_id,create_date , resolved_date) A 

SELECT * FROM july.holidays;