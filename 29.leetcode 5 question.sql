#create table activity (player_id int,device_id int, event_date date, games_played  int );
#insert into activity values (1,2,'2016-03-01',5 ),(1,2,'2016-03-02',6 ),(2,3,'2017-06-25',1 ),(3,1,'2016-03-02',0 ),(3,4,'2018-07-03',5 );
select * from activity;
questions:
--Game Play Analysis 
#q1: Write an SQL query that reports the first login date for each player
select player_id, min(event_date) as first_time_login from activity group by player_id;
#q2: Write a SQL query that reports the device that is first logged in for each player
select * from ( select *
,rank() over(partition by player_id order by event_date) as rn
from activity) a
where rn=1;
#q3: Write an SQL query that reports for each player and date, how many games played so far by the player. 
#--That is, the total number of games played by the player until that date
select *
,sum(games_played) over(partition by player_id order by event_date) as total_played
from activity;

#q4: Write an SQL query that reports the fraction of players that logged in again 
#on the day after the day they first logged in, rounded to 2 decimal places
#ssms
with mindate as 
(select player_id,min(event_date)  as first_date from activity group by player_id)
select a.*,first_date
from activity a 
inner join mindate md on a.player_id=md.player_id
where DATEDIFF(DAY,first_date,event_date)=1 ;