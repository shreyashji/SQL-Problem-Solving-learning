create table emp_mgr_age
(
emp_id int,
emp_name Varchar(20),
department_id Varchar(20),
salary int,
manager_id int,
emp_age int
);
#DROP TABLE emp_mgr_age;
#INSERT INTO emp_mgr_age values(1,'Ankit',100,10000,4,39);
#INSERT INTO emp_mgr_age values(2,'Mohit',100,15000,5,48);
#INSERT INTO emp_mgr_age values(3,'Vikas',100,10000,4,37);
#INSERT INTO emp_mgr_age values(4,'Rohit',100,5000,2,16);
#INSERT INTO emp_mgr_age values(5,'Mudit',200,12000,6,55);
#insert INTO emp_mgr_age values(6,'Agam',200,12000,2,14);
#INSERT INTO emp_mgr_age values(7,'Sanjay',200,9000,2,13);
#INSERT INTO emp_mgr_age values(8,'Ashish',200,5000,2,12);
#INSERT INTO emp_mgr_age values(9,'Rakesh',300,5000,6,51);
#INSERT INTO emp_mgr_age values(10,'Mukesh',300,5000,6,50);
select * from emp_mgr_age;

#CASE WHEN STATEMENT , else is optional,CHECK FROM TOP WHEREVER IT MATCHES IT GIVE RESULT
select  * ,
CASE 
	when emp_age < 20 then 'Kids'
    when emp_age >= 20 and emp_age <=40 then 'Adult'
    else 'old'
End as emp_age_bracket
from emp_mgr_age
order by emp_age;

SELECT * FROM DEPT;

SELECT ema.EMP_NAME,ema.SALARY,dp.dep_name
,CASE 
	WHEN dep_name='Analytics' then salary + 0.2 * salary
    WHEN dep_name='IT' then salary + 0.15 * salary
    ELSE SALARY + 0.15 * salary
END as new_salary
FROM emp_mgr_age as ema 
inner join dept as dp on ema.department_id=dp.dep_id;


