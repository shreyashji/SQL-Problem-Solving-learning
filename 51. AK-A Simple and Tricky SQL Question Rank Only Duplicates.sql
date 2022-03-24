#This video we will discuss a SQL question where we need to rank only the duplicate records and unique records should have null values.
#create table list (id varchar(5));
#insert into list values ('a');
#insert into list values ('a');
#insert into list values ('b');
#insert into list values ('c');
#insert into list values ('c');
#insert into list values ('c');
#insert into list values ('d');
#insert into list values ('d');
#insert into list values ('e');
#1.find duplicate 
#2.only for duplicate give ranking join it back with original table
with cte_dupl as (
select id from list group by id having count(1)>1)
,cte_rank as ( select *, rank() over(order by id asc) as rn from cte_dupl )
select l.* , 'DUP'+ cast(cr.rn as char(2)) as output  #rnk coming from cr
from list l
left join cte_rank cr on
l.id = cr.id;
#above is for ssms only
#b is not in cte rank table so coming as null

with cte_dupl as (
select id from list group by id having count(1)>1)
,cte_rank as ( select *, rank() over(order by id asc) as rn from cte_dupl )
select l.* , concat('DUP',cast(cr.rn as char(5))) as output  #rnk coming from cr
from list l
left join cte_rank cr on
l.id = cr.id