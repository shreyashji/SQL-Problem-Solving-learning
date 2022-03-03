#Practice SQLs Without Creating Tables In Your Database 
with emp as 
(
select 1 as emp_id,1000 as emp_salary,1 as dep_id
union all select 2 as emp_id,2000 as emp_salary,2 as dep_id
union all select 3 as emp_id,3000 as emp_salary,3 as dep_id
union all select 4 as emp_id,4000 as emp_salary,4 as dep_id
),
dep as 
(
select 1 as dep_id,'d1' as dep_name
union all select 2 as dep_id,'d2' as dep_name
union all select 3 as dep_id,'d3' as dep_name
union all select 4 as dep_id,'d4' as dep_name
)
select * from emp