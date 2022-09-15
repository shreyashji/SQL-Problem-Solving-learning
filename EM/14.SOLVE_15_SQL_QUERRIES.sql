#Querry the list of city names from a table that do not start with vowels and do not end with voels and result cannot contain duplicates
#Q1. substring has 3 fields sustring(string or coln,starting value,length) mumbai[1,2,3,4,5,6][-6,-5,-4,-3,-2,-1]
select distinct city from employees where substring(city,1,1) NOT IN ('A','E','I','O','U','a','e','i','o','u')
and  substring(city,-1,1) NOT IN ('A','E','I','O','U','a','e','i','o','u') ;

#Q2.HOW tto create  table (structure) from existing  table(where 1=0 false condition ,now rows will be inserted,just cols with scehma)
select * into new_table from old_table where 1=0 ;

#Q3.to check fro duplicate email in a table
select email from  person group by email having count >1;

#Q4.fetch only first name  from full name column
select substring (fullname,0, charindex('',fullname) ) from employee;

#Q5.fetch duplicates records from a table
select emp_id,dept,count(*) from employee group by emp_id , dept having count(*)>1;

#Q6.remove duplicates
delete from employee where emp_id in (select emp_id from employee group by dept having count(*)>1);

#Q7.increase income of all employees by 5% in a table
update employees SET income=income+(income * 5.0/100.0);


#Q8.find names of employees starting with 'A'
select first_name from employee where  first_name LIKE 'A%';

#Q9. find no. of employees working in department 'ABC'
SELECT COUNT FROM EMPLOYEE WHERE department_name='ABC';

#Q10. PRINT DETAILS OF EMPLOYEES WHOSE FIRST_NAME END WITH 'A' AND CONTAINS 6 alphabets
select * from employees where first_name LIKE '______A';

#Q11.print details of employees whose salary lies between 10000 and 50000
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 10000 AND 50000;

#Q12.fetch common records from booth tables
select * from table1 intersects 
select * from table2;

#Q13. fetch to n recordsselec top n* from employees order by salary desc
select TOP 10 * from employee order by salary desc; 

#Q14. retrive empfname,and emplname in a single column as 'fullname', first name ,last name seprated with space
select CONCAT(empfname,' ',emplname) as 'Fullname' from employee;
