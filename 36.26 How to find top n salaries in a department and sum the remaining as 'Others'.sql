select emp_name,department_id,salary from
(select emp_name,department_id,salary
,rank() over(partition by department_id order by salary desc) as maxsal
 from empm) as empsal
 where empsal.maxsal <= 2 #top 2 highest salary
union all  #union have impact on performance,union all 
select 'others' as emp_name,department_id,sum(salary) from
(select department_id,salary
,rank() over(partition by department_id order by salary desc) as maxsal
 from empm) as empsal
 where empsal.maxsal > 2 #>2 does not lie in top 2 salary of the dapartment
 group by department_id
 #union all combines duplicate record in two queries if exist,union combines only distict record