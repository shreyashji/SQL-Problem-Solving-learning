#SQL Self Join Concept | Most Asked Interview Question | Employee Salary More than Manager's Salary
create table empm
(
emp_id int,
emp_name Varchar(20),
department_id Varchar(20),
salary int,
manager_id int
);
#INSERT INTO empm values(1,'Ankit',100,10000,4);
#INSERT INTO empm values(2,'Mohit',100,15000,5);
#INSERT INTO empm values(3,'Vikas',100,10000,4);
#INSERT INTO empm values(4,'Rohit',100,5000,2);
#INSERT INTO empm values(5,'Mudit',200,12000,6);
#INSERT INTO empm values(6,'Agam',200,12000,2);
#INSERT INTO empm values(7,'Sanjay',200,9000,2);
#INSERT INTO empm values(8,'Ashish',200,5000,2);
use world;
select e.emp_id, e.emp_name, m.emp_name as manager,e.salary as emp_salary, m.salary as manager_salary
from empm as e 
inner join empm as m on e.manager_id=m.emp_id
where e.salary>m.salary;





