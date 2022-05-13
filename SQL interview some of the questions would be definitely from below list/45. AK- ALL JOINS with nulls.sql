#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
#CREATE TABLE t7(id int );
#CREATE TABLE t8(id int );

#insert into t7 values (1);
#insert into t7 values (1);
#insert into t7 values (2);
#insert into t7 values (2);
#insert into t7 values (4);
#insert into t7 values (null);

#insert into t8 values (1);
#insert into t8 values (1);
#insert into t8 values (1);
#insert into t8 values (3);
#insert into t8 values (2);
#insert into t8 values (2);
#insert into t8 values (null);

#delete from t2;
select * from t7;
select * from t8;

#null cant be compare with other null,so null also not joined with another null

select * from t7
inner join t8 on t7.id=t8.id;
#result on inner join+not matching records from left,6+ 2*1=(2) 2 records of 2
 
#all are matching in left table so sresult will be same as inner join
# 2*3 + 4+ 1 not matching+1 not matching =12
select * from t7
right join t8 on t7.id=t8.id;

#right= non matching records from left
#inner join+not matching records from right
#2*3 +4+ 1 not m+1 not m
select * from t7
left join t8 on t7.id=t8.id;

#matching records from oth table & non matching records from both table
#ssms only
# 3*2 +2 +1 + 2*2 + 4 is not matching so 1 record for this + 3 not matching = 12 records
select * from t7
full outer join t8 on t7.id=t8.id;

#mysql full outer join
SELECT * FROM t3
LEFT JOIN t4 ON t3.id = t4.id
UNION 
SELECT * FROM t3
right JOIN t4 ON t3.id = t4.id