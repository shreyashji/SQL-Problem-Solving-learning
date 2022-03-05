#How to increment salaries of employees who have 2 years with the organization | Datediff
select * from employe;
#EMPLOYEE INCREMENTED SALARY IF THEY HAVE COMPLETED 2 YEARS
#SSMS ONLY
select id, firstname,lastname,DepartmentName,Salary,HireDate,datediff(YEAR,HireDAate,'2020-12-31') from employe 
WHERE datediff(YEAR,HireDate,'2020-12-31');

select id, firstname,lastname,DepartmentName,Salary,HireDAate from employe 
WHERE datediff(HireDAate,"2022-12-31") > 2

#How to increment salaries of employees who have 2 years with the organization
select id, firstname,lastname,DepartmentName,Salary,Salary * 1.15 as incrementedSalary,HireDate,datediff(YEAR,HireDAate,'2020-12-31') from employe 
WHERE datediff(YEAR,HireDate,'2020-12-31');