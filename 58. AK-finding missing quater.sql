CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);

select * from STORES;
#Method 1 Aggregation : 1+2+3+4=10 ,whatevver be missing 10 - summationn of other quater
select store,10-sum((right(quarter,1))) as q_no from STORES
group by store;

select store,'Q'+ cast(10-sum(cast(right(quarter,1) as int)) as char(2)) as q_no from STORES
group by store;
#Method 2 Recursive CTE
WITH ctq as(
select distinct store, 1 as q_no from stores
union all
select store, q_no+1 as q_no from ctq 
where q_no < 4
)
select * from ctq
order by stores;

WITH ctq as(
select distinct store, 1 as q_no from stores
union all
select store, q_no+1 as q_no from ctq 
where q_no < 4
)
, q as (select  store,'Q'+ cast(q_no  as char(1)) as q_no from ctq)
select  q.* from q left join stores s 
on q.store = s.store and q.q_no = s.quarter
where s.store is null;


#Method 3 Cross Join
WITH ctq as(
select distinct s1.store,s2.quarter
from stores s1, stores s2 
)
select  q.* from cte q left join stores s 
on q.store = s.store and q.quarter = s.quarter
where s.store is null;