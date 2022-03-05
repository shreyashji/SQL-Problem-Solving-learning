#How to find employees with highest salary in a department
select * from emp;
#1)
select emp_id,emp_name,e.department_id,salary from emp e
inner join
(select department_id,max(salary) as MaxSalary from emp
group by department_id) as Maxsalemp
on e.department_id = Maxsalemp.department_id
and e.salary = Maxsalemp.MaxSalary;

#2) to improve performance,use sql analytics functions,greatest will be rank as 1,2nd will be 2,this will avoid self joins
select emp_id,emp_name,department_id,salary from  
(select emp_id,emp_name,department_id,salary 
,rank() over(partition by department_id order by salary desc) as max_salary
from emp ) as e
where e.max_salary = 1; 







#4) Employees having less than average salary of the department but greater than the average salary of any other department
Select EmployeeKey, FirstName, LastName, Emp.DepartmentName, Salary from dbo.Employee Emp 
INNER JOIN 
(Select DepartmentName, Avg(Salary) as AvgSalary from dbo.EMployee 
Group BY DepartmentName ) AvgEmpSal 
ON Emp.DepartmentName = AvgEmpSal.DepartmentName 
AND Emp.Salary < AvgEMpSal.AvgSalary 
WHERE Emp.Salary > ANY (Select Avg(Salary) from dbo.EMployee Group By DepartmentName) 

