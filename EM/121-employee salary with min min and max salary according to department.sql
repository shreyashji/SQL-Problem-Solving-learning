use it;
/*
Create Table Employee_2(
EmpName Varchar(30),
DeptName Varchar(25),
DeptNo Bigint,
Salary Bigint);

Insert into Employee_2 Values('Mark','HR',101,30000);
Insert into Employee_2 Values('John','Accountant',101,20000);
Insert into Employee_2 Values('Smith','Analyst',101,25000);
Insert into Employee_2 Values('Donald','HR',201,40000);
Insert into Employee_2 Values('James','Analyst',201,22000);
Insert into Employee_2 Values('Maria','Analyst',201,38000);
Insert into Employee_2 Values('David','Manager',201,33000);
Insert into Employee_2 Values('Martin','Analyst',301,22000);
Insert into Employee_2 Values('Robert','Analyst',301,56000);
Insert into Employee_2 Values('Michael','Manager',301,34000);
Insert into Employee_2 Values('Robert','Accountant',301,37000);
Insert into Employee_2 Values('Michael','Analyst',301,28000);
*/

SELECT * FROM Employee_2;


with recursive cte_a as
(
	select Empname,deptname,deptno,salary,
	rank() over(partition by deptno order by salary desc) as rank_top
	,rank() over(partition by deptno order by salary asc) as rank_BOTTOM
	from Employee_2
)
select Empname,deptname,deptno,salary from cte_a
WHERE rank_top=1 OR rank_BOTTOM=1
ORDER BY deptno,SALARY;

with recursive cte_b as
(
	select Empname,deptname,deptno,salary,
	max(salary) over(partition by deptno order by salary desc) as max_salary
	,min(salary) over(partition by deptno order by salary asc) as min_salary
	from Employee_2
)
select Empname,deptname,deptno,salary from cte_b
WHERE salary in (max_salary,min_salary)  
ORDER BY deptno,SALARY;




