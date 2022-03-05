#Find employees with salary greater than department average / and less than company average

select emp_id,emp_name,e.department_id,salary from emp e
INNER JOIN
(select department_id,avg(salary) as AvgSalary from emp
group by department_id) AS AvgEmpSal
on e.department_id =  AvgEmpSal.department_id
and e.salary > AvgEmpSal.AvgSalary;

#Find employees having more than average salary of the department but less than company(overall) average
select emp_id,emp_name,e.department_id,salary from emp e
INNER JOIN
(select department_id,avg(salary) as AvgSalary from emp
group by department_id) AS AvgEmpSal
on e.department_id =  AvgEmpSal.department_id
and e.salary > AvgEmpSal.AvgSalary
where  e.salary < (select avg(salary) from emp);


