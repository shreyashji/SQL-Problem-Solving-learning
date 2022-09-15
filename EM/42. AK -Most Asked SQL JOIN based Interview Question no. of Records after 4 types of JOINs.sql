#Most Asked SQL JOIN based Interview Question | # of Records after 4 types of JOINs
use em;
CREATE TABLE join_tabl1(id1 int);
CREATE TABLE join_tabl2(id2 int);

insert into join_tabl1 values (1);
insert into join_tabl1 values (1);

insert into join_tabl2 values (1);
insert into join_tabl2 values (1);
insert into join_tabl2 values (1);
#delete from t2;

select * from join_tabl1; #2 records
select * from join_tabl2; #3 records
#how join works on duplicate keys
#inner join,it will go and join with all 3 records from right table 2*3-6 

select * from join_tabl1
inner join join_tabl2 on join_tabl1.id1 = join_tabl2.id2;
#result on inner join+not matching records from left

select * from join_tabl1
left join join_tabl2 on join_tabl1.id1 = join_tabl2.id2;

#right= non matching records from left,but here all are matching so same no of records like above
#inner join+not matching records from right

select * from join_tabl1
right join join_tabl2 on join_tabl1.id1 = join_tabl2.id2;

#matching records from oth table & non matching records from both table,but there is no unmatching record,so result will be same
#ssms only
select * from join_tabl1
full outer join join_tabl2 on join_tabl1.id1 = join_tabl2.id2;