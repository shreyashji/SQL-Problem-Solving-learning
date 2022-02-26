#In this video we will be talking about SQL NULL values. Following aspects will be covered :
#1- How to filter null values
#2- How to handle null values
#3- ISNULL and COALESCE functions
#4- How aggregate functions handle nulls
#5- how to insert nulls into a table.
create table customern (
customer_id int,
customer_name varchar(10),
gender varchar(2),
dob date,
age int
);
#drop table customern;
select * from customern;
#insert into customern values (1,'Rahul','M',current_date(),22);
#insert into customern values (2,'Shilpa','F',current_date(),18);
#insert into customern values (3,'Ramesh','M',current_date(),19);
#insert into customern values (4,'Katrina','F',current_date(),17);
#insert into customern values (5,'Alia','F',current_date(),30);
#insert into customern values (6,'All','M',NULL,null);

#FILTERING NULL VALUES  = / IS NULL / IS NOT NULL ,unknown never equal to unknown,we use is null
select * FROM  customern where null=null;
select * FROM  customern where dob is null;
select * FROM  customern where dob is not null;

#handling null values ..isNull/coalace ,coalace is extension of null function
#ssms
select *, isnull(age,11) from customern;
select *, isnull(dob,'2205-01-01') from customern;
select *,coalesce(dob,null,null,'2020-01-01') as col from customern;
select *,coalesce(dob,null,'2020-01-03',null,'2020-01-01') as col from customern;

#count(col) function,bydefaulr count ignore null values
select count(age) from customern;
select count(isnull(age,0)) from customern;

#avg() ,dive by 5 not 6
select avg(age) from customern;
select avg(isnull(age,0)) from customern;