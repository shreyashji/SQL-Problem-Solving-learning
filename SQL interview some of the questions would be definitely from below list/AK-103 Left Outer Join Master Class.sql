
use it;
create table empl(
emp_id int,
emp_name varchar(20),
dep_id int,
salary int,
manager_id int,
emp_age int
);
#delete from emp;
/*
insert into empl
values
(1, 'Ankit', 100,10000, 4, 39);
insert into empl
values (2, 'Mohit', 100, 15000, 5, 48);
insert into empl
values (3, 'Vikas', 100, 10000,4,37);
insert into empl
values (4, 'Rohit', 100, 5000, 2, 16);
insert into empl
values (5, 'Mudit', 200, 12000, 6,55);
insert into empl
values (6, 'Agam', 200, 12000,2, 14);
insert into empl
values (7, 'Sanjay', 200, 9000, 2,13);
insert into empl
values (8, 'Ashish', 200,5000,2,12);
insert into empl
values (9, 'Mukesh',300,6000,6,51);
insert into empl
values (10, 'Rakesh',500,7000,6,50);

create table dept (
dep_id int,
dep_name varchar(20)
);
insert into dept values (100,'Analytics'),(200,'IT'),(300,'HR'),(400,'Text Analytics');

*/


SELECT * FROM empl;
SELECT * FROM dept;

SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id
where dept.dep_name = 'Analytics' ; 

#left join all records from left,in right null if there is no record
SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id;

SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id AND dept.dep_name = 'Analytics' ; 

SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id
where dept.dep_name = 'Analytics' ; #4 RECORDS IT IS SAME AS INNER JOIN ,null will not qualify
# so there is  no point of puting a where condition in left join on right column ,performace wise use inner join in this case
#one exception isnull

SELECT * FROM empl 
inner JOIN dept ON empl.dep_id = dept.dep_id;

#one exception isnull
# mostly asked question : give me all the employees whose dept is not present in department table
SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id
where dept.dep_name  is null;

#now lets put filter on column of a left table
SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id AND Empl.salary=10000; #wrong way

SELECT * FROM empl 
LEFT JOIN dept ON empl.dep_id = dept.dep_id 
where Empl.salary=10000; #right way
