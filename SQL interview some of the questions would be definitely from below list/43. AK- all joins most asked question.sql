#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
CREATE TABLE t3(id int );
CREATE TABLE t4(id int );

insert into t3 values (1);
insert into t3 values (1);
insert into t3 values (2);

insert into t4 values (1);
insert into t4 values (1);
insert into t4 values (1);
insert into t4 values (3);

#delete from t2;
select * from t3;
select * from t4;

select * from t3
inner join t4 on t3.id=t4.id;
 #result on inner join+not matching records from left
select * from t3
left join t4 on t3.id=t4.id;

#right= non matching records from left
#inner join+not matching records from right
select * from t3
right join t4 on t3.id=t4.id;

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