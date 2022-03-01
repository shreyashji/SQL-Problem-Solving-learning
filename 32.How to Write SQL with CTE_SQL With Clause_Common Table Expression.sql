#with clause is subquerry instead of subquerry we can write with clause
#it looks clean,
#without CTE
select * from empl where 
salary>(select avg(salary) from empl);
#WITH CTE

with avg_salary as (
select avg(salary) as avg_sal from empl
)
select * from empl
inner join avg_salary on salary > avg_sal;

#multiple cte,no object created in db
with avg_salary as (
select avg(salary) as avg_sal from empl
),
max_sal as (select max( avg_sal) as  maxsal from avg_salary )
select * from max_sal
#inner join avg_salary on salary > avg_sal