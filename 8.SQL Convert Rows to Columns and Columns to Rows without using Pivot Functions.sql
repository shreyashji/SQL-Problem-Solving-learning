
create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);
insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

select * from emp_compensation;
#pivot
select emp_id
,sum(CASE WHEN salary_component_type='salary' then val end) as salary  
,sum(CASE WHEN salary_component_type='bonus' then val end) as bonous  
,sum(CASE WHEN salary_component_type='hike_percent' then val end) as hike_percent  
from emp_compensation group by emp_id;

#unpivot insert 
select emp_id
,sum(CASE WHEN salary_component_type='salary' then val end) as salary  
,sum(CASE WHEN salary_component_type='bonus' then val end) as bonous  
,sum(CASE WHEN salary_component_type='hike_percent' then val end) as hike_percent  
into emp_compensation_pivot from emp_compensation group by emp_id;

create table emp_compensation_pivot (
emp_id int,
salary int,
bonous int,
hike_percent int
);
select * from emp_compensation_pivot;
insert into emp_compensation_pivot values (1,10000,5000,10);
insert into emp_compensation_pivot values (2,15000,7000,8);
insert into emp_compensation_pivot values (3,12000,6000,7);

select * from (
select emp_id, 'salary' as salary_component_type, salary as val  from emp_compensation_pivot
union all
select emp_id, 'bonous' as salary_component_type, bonous as val  from emp_compensation_pivot
union all
select emp_id , 'hike_percent' as salary_component_type, hike_percent as val  from emp_compensation_pivot
) as a order by emp_id;


