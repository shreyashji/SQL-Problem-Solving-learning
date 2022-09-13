create schema em;
use em;

create table emp_manager(emp_id int,emp_name varchar(50),salary int,manager_id int);
/*
#drop table emp_manager
insert into emp_manager values(	1	,'Ankit',	10000	,4	);
insert into emp_manager values(	2	,'Mohit',	15000	,5	);
insert into emp_manager values(	3	,'Vikas',	10000	,4	);
insert into emp_manager values(	4	,'Rohit',	5000	,2	);
insert into emp_manager values(	5	,'Mudit',	12000	,6	);
insert into emp_manager values(	6	,'Agam',	12000	,2	);
insert into emp_manager values(	7	,'Sanjay',	9000	,2	);
insert into emp_manager values(	8	,'Ashish',	5000	,2	);
*/
SELECT * FROM emp_manager;

# FIND employees with salary  more than their managers salary :SELF JOIN
SELECT E.emp_id,E.emp_name,M.emp_name as Manager_name, E.salary as Emp_salary, M.salary as Manager_Salary 
FROM emp_manager E
INNER JOIN emp_manager M
on E.manager_id = M.emp_id
WHERE E.salary > M.salary;

#GIVE MANAGER Name for each employee
SELECT E.emp_id,E.emp_name,M.emp_name as Manager_name
FROM emp_manager E
INNER JOIN emp_manager M
on E.manager_id = M.emp_id

