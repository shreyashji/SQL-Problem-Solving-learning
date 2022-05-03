CREATE TABLE Emp_emails_string (
EMPID int,
Gender varchar(3),
EmailID varchar(30),
DeptID int
);

/*
Emp_Details  Table has four columns EmpID, Gender, EmailID and DeptID. User has to write a SQL 
query to derive another column called Email_List to display all
 Emailid concatenated with semicolon associated with a each DEPT_ID  as shown below in output Table.
 
INSERT INTO Emp_emails_string VALUES (1001,'M','YYYYY@gmaix.com',104);
INSERT INTO Emp_emails_string VALUES (1002,'M','ZZZ@gmaix.com',103);
INSERT INTO Emp_emails_string VALUES (1003,'F','AAAAA@gmaix.com',102);
INSERT INTO Emp_emails_string VALUES (1004,'F','PP@gmaix.com',104);
INSERT INTO Emp_emails_string VALUES (1005,'M','CCCC@yahu.com',101);
INSERT INTO Emp_emails_string VALUES (1006,'M','DDDDD@yahu.com',100);
INSERT INTO Emp_emails_string VALUES (1007,'F','E@yahu.com',102);
INSERT INTO Emp_emails_string VALUES (1008,'M','M@yahu.com',102);
INSERT INTO Emp_emails_string VALUES (1009,'F','SS@yahu.com',100);
*/
select * from Emp_emails_string ; 


SELECT DEPTID, SUBSTR(LIST,1, LENGTH(LIST)-1) AS EMAIL_LIST_Dept
FROM
(
SELECT DEPTID, GROUP_CONCAT(EMAILID, ';')
LIST
FROM Emp_emails_string
GROUP BY DEPTID
) A ;

SELECT DEPTID, STRING_AGG(Emailid,';') within group(order by Emailid ) as Emailid_list 
from Emp_emails_string
group by DEPTID
