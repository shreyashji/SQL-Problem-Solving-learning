/*
use it;
Create Table Employee_1(
EmployeeID Varchar(20),
EmployeeName Varchar(20),
ManagerID varchar(20));

Insert Into Employee_1 Values(100,'Mark',103);
Insert Into Employee_1 Values(101,'John',104);
Insert Into Employee_1 Values(102,'Maria',103);
Insert Into Employee_1 Values(103,'Tom',NULL);
Insert Into Employee_1 Values(104, 'David',103);
*/

#Input :- Employee Table has three columns namely EmployeeID,  EmployeeName and ManagerID
#Problem Statement :- Write a SQL query to get the output as shown in the Output table

SELECT * FROM Employee_1;
#BY USING SELF JOIN

SELECT emp.employeeName,mng.employeeName as Manager_name FROM Employee_1 emp
inner join Employee_1 mng
on emp.managerid = mng.employeeid;


SELECT emp.employeeName,isnull(mng.employeeName,'BOSS') as Manager_name FROM Employee_1 emp
left join Employee_1 mng
on emp.managerid = mng.employeeid;


SELECT emp.employeeName,
CASE WHEN mng.employeeName IS NULL THEN 'BOSS' ELSE mng.employeeName END AS Manager_name FROM Employee_1 emp
left join Employee_1 mng
on emp.managerid = mng.employeeid;

