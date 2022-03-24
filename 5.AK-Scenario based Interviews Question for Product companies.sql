create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

with 
Distinct_resources as (select name,resources from entries)
,agg_resources as (select name,string_agg(resources,',') as used_resouces from distinct_resources group by name)
,total_visits as (select name, count(1) as total_visits , STRING_AGG(resources,',') as resources_used from entries group by name)
, floor_visit as 
(select name,floor ,count(1) as no_of_floor_visits,
rank() over(partition by name order by count(1) desc) as rn
from entries  
group by name , floor)
select fv.name,fv.floor as most_visited_floor ,tv.total_visits, ar.used_resouces
from floor_visit as fv 
inner join total_visits as tv on fv.name=tv.name
inner join agg_resources as ar on fv.name=ar.name
where rn=1;


 