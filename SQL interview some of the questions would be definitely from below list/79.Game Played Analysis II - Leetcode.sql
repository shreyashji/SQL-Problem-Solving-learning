Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)
Truncate table Activity;
insert into Activity values (1, 2, '2016-03-01', 5);
insert into Activity  values (1, 2, '2016-05-02', 6);
insert into Activity  values (2, 3, '2017-06-25', 1);
insert into Activity values (3, 1, '2016-03-02', 0);
insert into Activity values (3, 4, '2018-07-03', 5);
/* Write an SQL query to report the device that is first logged in for each player. */
select player_id,device_id,event_date,games_played ,
dense_rank()  over(partition by player_id order by event_date asc ) as rnk
from Activity;

with rnk_table as (
select player_id,device_id,event_date,games_played ,
dense_rank()  over(partition by player_id order by event_date asc ) as rnk
from Activity
)
select player_id,device_id from rnk_table where rnk = 1;

/*Write an SQL query to report for each player and date, how many games played so far by the player. 
That is, the total number of games played by the player until that date */
select * from Activity;
SELECT 
	player_id,
	event_date,
	SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
from Activity;

/* Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in
, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at
 least two consecutive days starting from their first login date, then divide that number by
 the total number of players. */
 SELECT 
	player_id,
	event_date,
	datediff(event_date,min(event_date) OVER(PARTITION BY player_id) ) AS date_difff
from Activity;

with activity_stats as (
	SELECT 
		player_id,
		event_date,
		datediff(event_date,min(event_date) OVER(PARTITION BY player_id) ) AS date_difff
	from Activity
)
SELECT round(
	COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2
	) AS fraction
FROM activity_stats
WHERE date_difff=1

