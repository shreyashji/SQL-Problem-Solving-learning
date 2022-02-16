#https://youtu.be/OX6kA3JDO_E
#How to delete duplicates from a table?
with emp_table as 
(select *,
RANK() OVER(PARTITION by firstname,lastname order by employee_id desc) as rnk
from empm)
delete from emp_table where rnk>1;

select * from emp;
# to get second highest salary,How to find nth highest salary
select max(salary) from emp where 
salary<
(select max(salary) from emp);

# from top
SELECT TOP 1 * FROM 
(select TOP 1 * from emp order by salary desc) AS SAL_ORDER
ORDER BY SALARY;

# WITH DENSE RANK, 2rd highest salary
with salry_cte as
(SELECT * , 
DENSE_RANK() OVER(order by salary desc) as sal_order FROM emp)
select * from salry_cte where sal_order =2;

# Employee Manager Hierarchy - Self Join
SELECT e.emp_id,e.emp_name as employeeee,m.emp_name as magr_name
 FROM EMPM e INNER JOIN empm m on  e.manager_id=m.emp_id


