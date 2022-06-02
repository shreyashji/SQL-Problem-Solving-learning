/*
create table cemployee 
(
emp_id int,
company varchar(10),
salary int
);

insert into cemployee values (1,'A',2341);
insert into cemployee values (2,'A',341);
insert into cemployee values (3,'A',15);
insert into cemployee values (4,'A',15314);
insert into cemployee values (5,'A',451);
insert into cemployee values (6,'A',513);
insert into cemployee values (7,'B',15);
insert into cemployee values (8,'B',13);
insert into cemployee values (9,'B',1154);
insert into cemployee values (10,'B',1345);
insert into cemployee values (11,'B',1221);
insert into cemployee values (12,'B',234);
insert into cemployee values (13,'C',2345);
insert into cemployee values (14,'C',2645);
insert into cemployee values (15,'C',2645);
insert into cemployee values (16,'C',2652);
insert into cemployee values (17,'C',65);
*/

#WRITE A SQL QUERY TO FIND THE MEDIAN salary of each company
#bonus if you can solve it withou any built in functions
# 2 5 7 8 9 ,median 7
#even no.  2 5 6 7 8 9 ,median 6+7/2=6.5

select *
,ROW_NUMBER() OVER(partition by company order by salary) as rn
,count(1) over(partition by company) as total_cnt
from cemployee;

SELECT company,AVG(salary) FROM
(SELECT *
,ROW_NUMBER() OVER(partition by company order by salary) as rn
,count(1) OVER(partition by company) as total_cnt
FROM cemployee) a
WHERE rn BETWEEN total_cnt*1.0/2 AND total_cnt*1.0/2+1
group by company;

#other way

with cte as
(
select *,
ROW_NUMBER() over(partition by company order by salary) as rn
,count(1) over(partition by company) as cn
from cemployee)
select company,
avg(salary) as med
from cte
where rn in (floor((cn+1)*1.0/2), ceiling((cn+1)*1.0/2))
group by company