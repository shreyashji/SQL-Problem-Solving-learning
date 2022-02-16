create table employee (
emp_id int , emp_name char(10) ,emp_salary int
);
#drop table employee;
#delete from employee;
select * from employee;
#insert into employee values(1,'roshan',7000);
#insert into employee values(2,'Moshan',6000);
#insert into employee values(3,'kanti',5000);
#insert into employee values(4,'gagan',2000);

#second highest salary 
#using max
select max(emp_salary) from employee where emp_salary < (select max(emp_salary) from employee);

#using limit,inner querry run first will give 2 highest salry, then order by ascending(default) 
select emp_salary from (select emp_salary from employee order by  emp_salary desc limit 2) as emp order by emp_salary limit 1;

#using top ,SSMS
select TOP 3 emp_salary  from (select top 2 emp_salary from employee order by emp_salary desc) as emp order by emp_salary ;
