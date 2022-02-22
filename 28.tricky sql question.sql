create table tasks (
date_value date,
state varchar(10)
);
#insert into tasks  values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail'),('2019-01-05','fail'),('2019-01-06','success');
select *
,row_number() over(partition by state order by date_value) as  rn
 from tasks
 order by date_value;
 
 #ssms
 select *
,row_number() over(partition by state order by date_value) as  rn
,dateadd(day,-1*row_number() over(partition by state order by date_value) as group_date)
 from tasks
 order by date_value;
#dates are continuous and if we subtract the continuous rowno,they will come to a one date
#final queery ans
with all_dates as 
(select *
,row_number() over(partition by state order by date_value) as  rn
,dateadd(day,-1*row_number() over(partition by state order by date_value) as group_date)
 from tasks)
select state,min(date_value) as start_date,max(date_value) as end_date,state 
from all_date 
group by group_date,state
order by start_date;

