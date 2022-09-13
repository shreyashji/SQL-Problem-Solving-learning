#How to get employee details who are also Manager
use em;
create table emp_manager(emp_id int,emp_name varchar(50),salary int,manager_id int);

SELECT * FROM emp_manager;


select distinct emp_id, emp_name from emp_manager 
where emp_id in ( select distinct manager_id from emp_manager ) ;

select distinct a.emp_id, a.emp_name from emp_manager a 
inner join emp_manager b
on a.emp_id=b.manager_id