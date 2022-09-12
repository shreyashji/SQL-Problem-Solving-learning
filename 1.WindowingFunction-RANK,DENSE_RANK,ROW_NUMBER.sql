use world;
#RANK, DENSE_RANK, ROW_NUMBER
#jiski slary zyaya usko top rank 

#RANK===GIVE SAME RANK TO SAME SALARY,skip numbers in rank after assigning same rnk to same salary,rank over coln
select emp_id, emp_name ,department_id, salary,
rank() OVER(order by salary desc) as rnk
from emp;

##DENSE RANK== two peple with same slary get same rank,dense rank dont skip number like rank

select emp_id, emp_name ,department_id, salary
,RANK() OVER(order by salary desc) as rnk
,DENSE_RANK() OVER(order by salary desc) as dens_rnk
from emp;
use world;

## give different trank to same nos
select emp_id, emp_name ,department_id, salary
,RANK() OVER(order by salary desc) as rnk
,DENSE_RANK() OVER(order by salary desc) as dens_rnk
,row_number() OVER(order by salary desc) as rows_number
from emp;
##IF WANT DEPARTMENT WISE RANK,ADD A CLAUSE PARTITION BY

select emp_id, emp_name ,department_id, salary
,RANK() OVER(partition by department_id ORDER by salary desc) as rnk
,DENSE_RANK() OVER(partition by department_id order by salary desc) as dens_rnk
,row_number() OVER(partition by department_id order by salary desc) as rows_number
from emp;

##IF WANT DEPARTMENT WISE HIGHEST SALARY,ADD PARTITION BY DEPARTMENT
select * from (
select emp_id, emp_name ,department_id, salary
,RANK() OVER(partition by department_id ORDER by salary desc) as rnk
from emp ) a
WHERE rnk=1;


#create table emp
#(
#emp_id int,
#emp_name Varchar(20),
#department_id Varchar(20),
#salary int
#);
#INSERT INTO emp values(1,'Ankit',100,10000);
#INSERT INTO emp values(2,'Mohit',100,15000);
#INSERT INTO emp values(3,'Vikas',100,10000);
#INSERT INTO emp values(4,'Rohit',100,5000);
#INSERT INTO emp values(5,'Mudit',200,12000);
#INSERT INTO emp values(6,'Agam',200,12000);
#INSERT INTO emp values(7,'Sanjay',200,9000);
#INSERT INTO emp values(8,'Ashish',200,5000);
