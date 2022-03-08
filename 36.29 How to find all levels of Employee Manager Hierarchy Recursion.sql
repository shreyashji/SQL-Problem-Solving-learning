#How to find all levels of Employee Manager Hierarchy | Recursion
#manager id is null then he is the top most manager in orgz
#create table emmp(emp_id int,emp_name varchar(20),department_id int,manager_id int);
select * from emmp;
#insert into emmp values(1,'Adam Owens',103,3);
#insert into emmp values(2,'Smith Jones',102,5);
#insert into emmp values(3,'Hilary Riles',101,4);
#insert into emmp values(4,'Richard Robinson',103,3);
#insert into emmp values(5,'Samuel Pitt',103,3);
#insert into emmp values(6,'Mark Miles',null,7);
#insert into emmp values(7,'Jenny Jeff',999,null);

#name of the immediate manager
select emp.emp_name as EmployeeName, mgr.emp_name as ManagerName  from emmp emp
inner join emmp mgr 
on emp.Manager_id=mgr.emp_id ;

with EmpMgrCTE
AS(
Select emp_id,emp_name,manager_id,0 as EmpLevel from emmp
where manager_id is null
union all
Select EMPP.emp_id,EMPP.emp_name,EMPP.manager_id,mngr.EmpLevel+1
from emmp EMPP
INNER JOIN EmpMgrCTE AS mngr
on empp.Manager_id = mngr.emp_id
)
select * from EmpMgrCTE 
order by EmpLevel;
