#create table userss (user_id integer,name varchar(20),join_date date);
#insert into userss values (1, 'Jon','2020-02-14'), (2, 'Jane', '2020-02-14'), (3, 'Jill','2020-02-15' ), (4, 'Josh','2020-02-15'), (5, 'Jean','2020-02-16'), (6, 'Justin','2020-02-17'),(7, 'Jeremy', '2020-02-18');
select * from  userss;
#delete from userss;
#create table events(user_id integer,type varchar(10),access_date date);
#insert into events values (1, 'Pay', '2020-03-01'), (2, 'Music', '2020-03-02'), (2, 'P', '2020-03-12'),(3, 'Music', '2020-03-15'), (4, 'Music','2020-03-15'), (1, 'P', '2020-03-16'), (3, 'P', '2020-03-22');

select * from  userss;
select * from  events;
#Given the following two tables, return the fraction of users, rounded to two decimal places,
#who accessed Amazon music and upgraded to prime membership within the first 30 days of signing up. 
#p stands for when user purchase prime membership
#10 users,5 access amazon music,only 2 purchase prime membership ,ratio 2 divide by 5 =40%

#find who access amazon music
select * from userss
where user_id in (select user_id from events where type='Music');
#out of this i have to check how many have subscibed to amazon prime within 30 dyas of joining date
#need access date when they converted there membership to prime membership
#left join there woulb be users who did not join prime membership
select u.*,e.type,e.access_date from userss u 
left join events  e on u.user_id=e.user_id and e.type='P'
where u.user_id in (select user_id from events where type='Music');

#calculate the difference also
select u.*,e.type,e.access_date,datediff(day,u.join_date,e.access_date) as no_of_days from userss u 
left join events  e on u.user_id=e.user_id and e.type='P'
where u.user_id in (select user_id from events where type='Music');

#
#CASE When datediff(day,u.join_date,e.access_date) <=30 then user_id -->who bought in 30 days  taking user_id 

select #u.*,e.type,e.access_date,datediff(day,u.join_date,e.access_date) as no_of_days from userss u 
count(distinct u.user_id) as total_users,count(distinct CASE When datediff(day,u.join_date,e.access_date) <=30 then user_id end)
,1.0*count(distinct CASE When datediff(day,u.join_date,e.access_date) <=30 then user_id end) / count(distinct u.user_id) * 100
from userss u 
left join events  e on u.user_id=e.user_id and e.type='P'
where u.user_id in (select user_id from events where type='Music')

