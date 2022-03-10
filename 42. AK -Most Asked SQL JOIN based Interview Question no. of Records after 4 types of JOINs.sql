#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
#CREATE TABLE t1(id1 int );
#CREATE TABLE t2(id2 int );

#insert into t1 values (1);
#insert into t1 values (1);

#insert into t2 values (1);
#insert into t2 values (1);
#insert into t2 values (1);
#delete from t2;

select * from t1;
select * from t2;
#how join works on duplicate keys
#inner join,it will go and join with all 3 records from right table 2*3-6 
select * from t1
inner join t2 on t1.id1=t2.id2;
 #result on inner join+not matching records from left
select * from t1
left join t2 on t1.id1=t2.id2;

#right= non matching records from left,but here all are matching so same no of records like above
#inner join+not matching records from right
select * from t1
right join t2 on t1.id1=t2.id2;

#matching records from oth table & non matching records from both table,but there is no unmatching record,so result will be same
#ssms only
select * from t1
full outer join t2 on t1.id1 = t2.id2;