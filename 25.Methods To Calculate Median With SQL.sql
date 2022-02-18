#oddno.  1 2 3 4 10 12 14 median =4
#even no 1 2 3 4 10 12 14 16 , to middle 10+4=14/2=7 medain

#method 1 : median using row_number (can be used in any database),for even, for add remove # from where
with value_S as (select *
,row_number() over (order by emp_age asc) as rn_asc 
,row_number() over (order by emp_age desc) as rn_desc
from empl
##WHERE EMP_ID<10
)
select avg(emp_age) from value_S
where abs(rn_asc - rn_desc) <=1
order by emp_age;


#method 2 only in sql server: median using percentile count
select * 
,percentile_cont(0.5) within  group (order by emp_age) over( ) as median
from empl 
where emp_id<10;

select * 
,percentile_cont(0.5) within  group (order by emp_age) over(partition by department_id) as median
from empl 
where emp_id<10;

create table empl
(
emp_id int,
emp_name Varchar(20),
department_id Varchar(20),
salary int,
manager_id int,
emp_age int
);
#drop table empl;
INSERT INTO empl values(1,'Ankit',100,10000,4,39);
INSERT INTO empl values(2,'Mohit',100,15000,5,48);
INSERT INTO empl values(3,'Vikas',100,10000,4,37);
INSERT INTO empl values(4,'Rohit',100,5000,2,16);
INSERT INTO empl values(5,'Mudit',200,12000,6,55);
INSERT INTO empl values(6,'Agam',200,12000,2,14);
INSERT INTO empl values(7,'Sanjay',200,9000,2,13);
INSERT INTO empl values(8,'Ashish',200,5000,2,12);
INSERT INTO empl values(9,'Mukesh',300,6000,6,51);
INSERT INTO empl values(10,'Rakesh',300,7000,6,50);