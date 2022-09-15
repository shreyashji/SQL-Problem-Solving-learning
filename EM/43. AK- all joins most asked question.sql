#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
use em;
CREATE TABLE Join_Table1(id int );
CREATE TABLE Join_Table2(id int );

insert into Join_Table1 values (1);
insert into Join_Table1 values (1);
insert into Join_Table1 values (2);

insert into Join_Table2 values (1);
insert into Join_Table2 values (1);
insert into Join_Table2 values (1);
insert into Join_Table2 values (3);

#delete from t2;
select * from Join_Table1;
select * from Join_Table2;

select * from Join_Table1
inner join Join_Table2 on Join_Table1.id = Join_Table2.id;
#result on inner join+not matching records from left

select * from Join_Table1
left join Join_Table2 on Join_Table1.id = Join_Table2.id;

#right= non matching records from left
#inner join+not matching records from right
select * from Join_Table1
right join Join_Table2 on Join_Table1.id=Join_Table2.id;

#matching records from oth table & non matching records from both table
#ssms only
select * from t3
full outer join t4 on t3.id = t4.id;

#mysql full outer join
SELECT * FROM t3
LEFT JOIN t4 ON t3.id = t4.id
UNION 
SELECT * FROM t3
right JOIN t4 ON t3.id = t4.id