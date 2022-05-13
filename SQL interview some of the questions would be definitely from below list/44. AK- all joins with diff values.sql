#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
#CREATE TABLE t5(id int );
#CREATE TABLE t6(id int );

#insert into t5 values (1);
#insert into t5 values (1);
#insert into t5 values (2);
#insert into t5 values (2);
#insert into t5 values (4);

#insert into t6 values (1);
#insert into t6 values (1);
#insert into t6 values (1);
#insert into t6 values (3);
#insert into t6 values (2);
#insert into t6 values (2);

#delete from t2;
select * from t5;
select * from t6;

select * from t5
inner join t6 on t5.id=t6.id;
#result on inner join+not matching records from left,6+ 2*1=(2) 2 records of 2
 
#all are matching in left table so sresult will be same as inner join
select * from t5
left join t6 on t5.id=t6.id;

#right= non matching records from left
#inner join+not matching records from right
#6+1*2 =2 records of 2+ for non matching 3 1 record will be there =9 records
select * from t5
right join t6 on t5.id=t6.id;

#matching records from oth table & non matching records from both table
#ssms only
# 3*2 +2 +1 + 2*2 + 4 is not matching so 1 record for this + 3 not matching = 12 records
select * from t3
full outer join t4 on t3.id = t4.id;

#mysql full outer join
SELECT * FROM t3
LEFT JOIN t4 ON t3.id = t4.id
UNION 
SELECT * FROM t3
right JOIN t4 ON t3.id = t4.id