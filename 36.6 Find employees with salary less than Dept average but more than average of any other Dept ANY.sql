select * from emp;
#Find employees with salary less than Dept average but more than average of any other Dept | ANY
select emp_id, emp_name, S.department_id, salary from emp AS EEMP
inner join 
(select department_id ,avg(salary) as AvgSalary from emp
group by department_id) as S
ON EEMP.department_id = S.department_id
and salary=S.AvgSalary
where salary > ANY (select Avg(E.salary) from emp E group by department_id); #employeey slary less than overall 
#ANY COMPARE SAALRY WITH ANY OF THE SALRY IN DEPARTMENT COMING OUT OF 2 RECORDS 

