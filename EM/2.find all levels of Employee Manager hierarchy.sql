#How to find all levels of Employee Manager hierarchyuse 
use em;
/*
Create Table Employee_Table(
EmployeeID int,
EmployeeName Varchar(30),
DepartmentID int,
ManagerID int);

Insert into Employee_Table Values(1001,'James Clarke',13,1003);
Insert into Employee_Table Values(1002,'Robert Williams',12,1005);
Insert into Employee_Table Values(1003,'Henry Brown',11,1004);
Insert into Employee_Table Values(1004,'David Wilson',13,1006);
Insert into Employee_Table Values(1005,'Michael Lee',11,1007);
Insert into Employee_Table Values(1006,'Daniel Jones',Null,1007);
Insert into Employee_Table Values(1007,'Mark Smith',14,Null);
*/
SELECT * FROM Employee_Table;

WITH recursive CTE_A AS (
	SELECT EmployeeID,EmployeeName,ManagerID, 0 AS Employee_Level FROM Employee_Table WHERE ManagerID IS NULL #now need to write recursiv epart
    UNION
    SELECT Emp.EmployeeID, Emp.EmployeeName,Emp.ManagerID ,Employee_Level+1 FROM Employee_Table AS Emp 
    INNER JOIN CTE_A AS Mngr ON Emp.ManagerID = Mngr.EmployeeID
)
SELECT * from CTE_A 
order by Employee_Level