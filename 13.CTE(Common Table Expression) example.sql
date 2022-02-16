# common table expression
# it is a temporary named result set that you can refrence within a select,insert,update,delete
#syntax : WITH cte_name as (cte querry)  , with clause can include one or more  cte seprated by commas
 select * from emp;
with cte1 as (select emp_id,department_id from emp)
select * FROM cte1;

# this gives max avg salry from department
with cte2  as (select department_id,AVG(salary) as avg_salary from emp group by department_id) 
select max(avg_salary) FROM cte2;

# max avg salary in department
select department_id,AVG(salary) as avg_salary from emp group by department_id