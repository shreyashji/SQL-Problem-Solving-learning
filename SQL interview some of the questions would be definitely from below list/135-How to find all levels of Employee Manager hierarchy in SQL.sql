
use it;
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

select * from Employee_Table;

with recursive cte_a as (
	select EmployeeID,EmployeeName,ManagerID,0 AS EmployeeLevel from Employee_Table where ManagerID is null #base query
    union all
    SELECT emp.EmployeeID,emp.EmployeeName,emp.ManagerID,EmployeeLevel + 1 from Employee_Table AS Emp
    INNER JOIN cte_a AS Mgr
    ON Emp.ManagerID = Mgr.EmployeeID
)
select * from cte_a order by EmployeeLevel;
