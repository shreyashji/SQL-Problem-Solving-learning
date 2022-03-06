#https://www.youtube.com/watch?v=Ip6Ty2qmQXg&list=PL2-GO-f-XvjBl5fpzdfYaPW28PwsLzLc4&index=32
#dont have data file 
select emp.firstname,emp.lastname,emp.title,,emp.departmentname,emp.phone,emp.startdate,emp.enddate
 from dbo.employee emp, dbo.employee emp1
 where emp.firstname = emp1.firstname
 and emp.lastname = emp1.lastname
 and emp.startdate < emp1.startdate
 and emp.enddate > emp1.startdate