#create table emp_2020
(
emp_id int,
designation varchar(20)
);

#create table emp_2021
(
emp_id int,
designation varchar(20)
)
#insert into emp_2020 values (1,'Trainee'), (2,'Developer'),(3,'Senior Developer'),(4,'Manager');
#insert into emp_2021 values (1,'Developer'), (2,'Developer'),(3,'Manager'),(5,'Trainee');
#find the change in employee status
# 1,3,4,5 IN OP
#IF INNER join on emp_id 1,2,3 come 4,5 not common
#left join 1,2,3,4,  & 5 will not be there 
#right join 1,2,3,5 & 4 will not come
select * from emp_2020;
select * from emp_2021;

select e20.* ,e21. * from emp_2020 e20 
full outer join emp_2021 e21 on e21.emp_id = e20.emp_id;
#1,2,3 come ,4 & 5 will come as some nulls

select e20.* ,e21. * from emp_2020 e20 
full outer join emp_2021 e21 on e21.emp_id = e20.emp_id
where e20.designation != e21.designation;
#only 2 rows will come 1 & 3 id,! cant compare nulls with null

select e20.* ,e21. * from emp_2020 e20 
full outer join emp_2021 e21 on e21.emp_id = e20.emp_id
where isnull(e20.designation,'xxx') != isnull(e21.designation,'yyy');
#now we will get 4 rows 

select e20.emp_id ,e21.emp_id
,case when e20.designation!=e21.designation then 'Promoted'
when e21.designation is null then 'Resigned'
else 'New' end as comment 
from emp_2020 e20 
full outer join emp_2021 e21 on e21.emp_id = e20.emp_id
where isnull(e20.designation,'xxx') != isnull(e21.designation,'yyy');

select isnull(e20.emp_id ,e21.emp_id) as emp_id #if e20 is null put e21 value
,case when e20.designation!=e21.designation then 'Promoted'
when e21.designation is null then 'Resigned'
else 'New' end as comment 
from emp_2020 e20 
full outer join emp_2021 e21 on e21.emp_id = e20.emp_id
where isnull(e20.designation,'xxx') != isnull(e21.designation,'yyy');
#1,3,4,5 as output emp_id