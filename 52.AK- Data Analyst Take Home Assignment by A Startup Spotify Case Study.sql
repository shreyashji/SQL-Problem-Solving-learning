#CREATE table activityy
(
user_id char(20),
event_name char(20),
event_date date,
country char(20)
);
#delete from activityy;
#insert into activityy values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');
#THe activity table shows the app-installed and app purchase activities fro spotify app along with country details
select * from activityy;
#Q.1 find totoal active users each day (Daily active users)
select event_date,count(distinct user_id) from activityy a 
group by event_date;

# Q.2 find total active users each week (Weekly active users)
#ssms only
select *,datepart(week,event_date) from activityy;

# Q.3 datewise total number of users who made the purchase same day they insatlled the app  (same day install and purchase)
select user_id,event_date,count(distinct event_name) as  no_of_events from activityy 
group by user_id,event_date having (count(distinct event_name))=2;
#or
select event_date,count(user_id) as no_of_users from (
select user_id,event_date,count(distinct event_name) as  no_of_events from activityy 
group by user_id,event_date having (count(distinct event_name))=2 ) a
group by event_date;
# final answer
select event_date,count(new_user) as no_of_users from (
select user_id,event_date,case when (count(distinct event_name))=2 then user_id else null end as new_user from activityy 
group by user_id,event_date  #having (count(distinct event_name))=2 ) a
) a
group by event_date;

#Q4. percentage of paid users in INDIA,USA AND ANY OTHER country should be tagged as others (country wise paid users)
select case when country in('India','USA') then country else 'Others' end as new_country,count(distinct user_id) from activityy
 where event_name = "app-purchase"
 group by case when country in('India','USA') then country else 'Others' end ;
 #cte
 with country_wise_users as (
 select case when country in('India','USA') then country else 'Others' end as new_country,count(distinct user_id) as user_cnt from activityy
 where event_name = "app-purchase"
 group by case when country in('India','USA') then country else 'Others' end ),
 total as (select sum(user_cnt) as total_users from country_wise_users )
 select 
 new_country,user_cnt*1.0/total_users*100 as percent_users
 from country_wise_users,total;
 
 #Q.5 among All the users who installed the apps on a given day,how many did in app purchased on the very  next day --day wise result
select *
,lag(event_name,1) over(partition by user_id order by event_date) as prev_event_name
,lag(event_date,1) over(partition by user_id order by event_date) as prev_event_date
from activityy;
#only ssms
with prev_data as (
select *
,lag(event_name,1) over(partition by user_id order by event_date) as prev_event_name
,lag(event_date,1) over(partition by user_id order by event_date) as prev_event_date
from activityy)
select * from prev_data
 where event_name= 'app-purchase' and prev_event_name='app-installed' and datedifff(day,prev_event_date,event_date)=1
 
 #
 with prev_data as (
select *
,lag(event_name,1) over(partition by user_id order by event_date) as prev_event_name
,lag(event_date,1) over(partition by user_id order by event_date) as prev_event_date
from activityy)
select event_date,count(distinct user_id) as cnt_users from prev_data
where event_name= 'app-purchase' and prev_event_name='app-installed' and datedifff(day,prev_event_date,event_date)=1
group by event_date