use july;

create table empsmgr(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into empsmgr values (1, 'Ankit', 100,10000, 4, 39);
insert into empsmgr values (2, 'Mohit', 100, 15000, 5, 48);
insert into empsmgr values (3, 'Vikas', 100, 12000,4,37);
insert into empsmgr values (4, 'Rohit', 100, 14000, 2, 16);
insert into empsmgr values (5, 'Mudit', 200, 20000, 6,55);
insert into empsmgr values (6, 'Agam', 200, 12000,2, 14);
insert into empsmgr values (7, 'Sanjay', 200, 9000, 2,13);
insert into empsmgr values (8, 'Ashish', 200,5000,2,12);
insert into empsmgr values (9, 'Mukesh',300,6000,6,51);
insert into empsmgr values (10, 'Rakesh',500,7000,6,50);

SELECT * FROM empsmgr;
#WRITE sql to list emp name along with their managerand the senior manager name
#senior manager is mangers manager
SELECT * FROM empsmgr;

SELECT Emp_id,emp_name,department_id,salary,manager_id,emp_age FROM empsmgr;


SELECT e.Emp_id,e.emp_name,m.emp_name as Manager_name,sm.emp_name as Senior_manager FROM empsmgr e
LEFT JOIN empsmgr m on e.manager_id = m.emp_id
left join  empsmgr sm on m.manager_id = sm.emp_id
