/*
use july;

create table july.salary(id int,employee_id int, amount int,pay_date date);
insert into july.salary values(1,1,9000,'2017-3-31');
insert into july.salary values(2,2,6000,'2017-3-31');
insert into july.salary values(3,3,10000,'2017-3-31');
insert into july.salary values(4,1,7000,'2017-2-28');
insert into july.salary values(5,2,6000,'2017-2-28');
insert into july.salary values(6,3,8000,'2017-2-28');

create table july.employee(employee_id int,department_id int);
insert into july.employee values(1,1);
insert into july.employee values(2,2);
insert into july.employee values(3,2);
*/

SELECT * FROM july.employee;
SELECT * FROM july.salary;
#write a sql query to report the comparison result(lower/higher/same) of the average salary of employees in a department to the company average salary
#return the result table in any order

select department_salary.pay_month, department_id,
case
  when department_avg>company_avg then 'higher'
  when department_avg<company_avg then 'lower'
  else 'same'
end as comparison
from
(
  select department_id, avg(amount) as department_avg, date_format(pay_date, '%Y-%m') as pay_month
  from salary join employee on salary.employee_id = employee.employee_id
  group by department_id, pay_month
) as department_salary
join
(
  select avg(amount) as company_avg,  date_format(pay_date, '%Y-%m') as pay_month from salary group by date_format(pay_date, '%Y-%m')
) as company_salary
on department_salary.pay_month = company_salary.pay_month;
