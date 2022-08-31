USE JULY;

#Q1.Find Year On Year growth percentage.
/*
Create table JULY.growth(customer VARCHAR(50),year int, sales int);

insert into JULY.growth values('cust1',2014,2000);
insert into JULY.growth values('cust1',2015,5000);
insert into JULY.growth values('cust2',2013,1000);
insert into JULY.growth values('cust2',2014,1500);
insert into JULY.growth values('cust2',2015,800);
*/
with  recursive cte as 
(
SELECT 
	customer,year,sales,lag(sales) OVER (PARTITION BY customer order by year) sales2 
FROM growth
)
select customer,year,round((100.0*(sales-sales2)/sales2),2) as YoY from cte where round((100.0*(sales-sales2)/sales2),2) IS NOT NULL;

#Q2.Questions based on the below employee details tables.
/*
Create table JULY.FKART_employee( eid VARCHAR(50),ename VARCHAR(50),deptid VARCHAR(50), salary int);

insert into JULY.FKART_employee values('E1','Rahul','D1',20000);
insert into JULY.FKART_employee values('E2','Anjali','D2',15000);
insert into JULY.FKART_employee values('E3','Rohan','D3',25000);
insert into JULY.FKART_employee values('E4','Ramesh','D4',5000);
insert into JULY.FKART_employee values('E5','Pooja','D1',10000);
insert into JULY.FKART_employee values('E6','Divya','D2',15000);
insert into JULY.FKART_employee values('E7','Amir','D3',10000);

create table JULY.FKART_department( deptid VARCHAR(50), deptname VARCHAR(50) );

insert into JULY.FKART_department values('D1','Engineering');
insert into JULY.FKART_department values('D2','IT and Networking');
insert into JULY.FKART_department values('D3','Customer Support');
insert into JULY.FKART_department values('D4','Front Desk');
insert into JULY.FKART_department values('D5','Sales');
*/
SELECT * FROM JULY.FKART_employee;
SELECT * FROM JULY.FKART_department;
/*Questions :*/

/*1. Which department spends the most on salary. */
with recursive cte1 as 
(
select deptid,sum(salary) as salary from JULY.FKART_employee group by deptid
), 
cte2 as (
select deptid,salary from cte1 where salary=(select max(salary) from cte1)
)
select deptname from JULY.FKART_department d join cte2 on d.deptid=cte2.deptid;

/* 2. Find all employees with the same salary */
with recursive cte1 as 
(
select ename,salary,row_number() over(order by eid) as rank1 from JULY.FKART_employee
), 
cte2 as (
select ename,salary,row_number() over(order by eid) as rank2 from JULY.FKART_employee
)
select cte1.ename,cte2.ename, cte2.salary 
from cte1 join cte2 
on cte1.rank1<cte2.rank2 and cte1.salary=cte2.salary;

/* 3. Find the employee with the 4th highest salary. */
 with recursive cte as 
 (
 Select ename, dense_rank() over(order by salary desc) as RNK from JULY.FKART_employee
 ) 
 select ename from cte where RNK=4;

/* 4.Which department has no employees.  */
Select deptName from JULY.FKART_department where deptId not in (select distinct deptId from employee);

/* 5.Find all departments that have more than one employee. */
Select deptid as Departments from JULY.FKART_employee group by deptid having count(*) > 1;

/* 6.Return the departments and the list of employees belonging to them. */
Select deptid,group_concat(ename) as dept_employees from JULY.FKART_employee group by deptid;

/* Q.) CSV vs ORC vs Parquet vs AVRO (Explain each file format in detail and which is suitable for what type of situation) */
/* Q.) Hive Partitioning & Bucketing (Why/How/When) */
/* Q.) Repartition & coalesce (Why/How/When) */
/* Q.)Data Modeling of a Library Database (State dimensions and facts) */
