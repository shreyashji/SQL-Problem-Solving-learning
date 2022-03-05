#How to find employees with salary greater than their manager's salary
select * from empm;
select emp_id,emp_name,department_id,salary from empm e
where salary > (select salary from empm where emp_id = e.manager_id);

#to fetch manager name
select e.emp_id,e.emp_name,e.department_id,e.salary,Mgr.manager_name,mgr.manager_salary from empm e
join 
(select manager_id ,emp_name as manager_name,salary as manager_salary from empm) as mgr
on e.emp_id = mgr.manager_id
and e.salary > mgr.manager_salary;
