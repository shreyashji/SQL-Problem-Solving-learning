/*
use it ;
Create table facebook_web_log
(
Userid int,
Time_stamp datetime,
Actions varchar(30)
);


INSERT INTO facebook_web_log values(0,'2019-04-25 13:30:15','page_load');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:30:18','page_load');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:30:40','scroll_down');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:30:45','scroll_up');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:31:10','scroll_down');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:31:25','scroll_down');
INSERT INTO facebook_web_log values(0,'2019-04-25 13:31:40','page_exit');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:00','page_load');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:10','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:15','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:20','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:25','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:30','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-25 13:40:35','page_exit');
INSERT INTO facebook_web_log values(2,'2019-04-25 13:41:21','page_load');
INSERT INTO facebook_web_log values(2,'2019-04-25 13:41:30','scroll_down');
INSERT INTO facebook_web_log values(2,'2019-04-25 13:41:35','scroll_down');
INSERT INTO facebook_web_log values(2,'2019-04-25 13:41:40','scroll_up');
INSERT INTO facebook_web_log values(1,'2019-04-26 11:15:00','page_load');
INSERT INTO facebook_web_log values(1,'2019-04-26 11:15:10','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-26 11:15:20','scroll_down');
INSERT INTO facebook_web_log values(1,'2019-04-26 11:15:25','scroll_up');
INSERT INTO facebook_web_log values(1,'2019-04-26 11:15:35','page_exit');
INSERT INTO facebook_web_log values(0,'2019-04-28 14:30:15','page_load');
INSERT INTO facebook_web_log values(0,'2019-04-28 14:30:10','page_load');
INSERT INTO facebook_web_log values(0,'2019-04-28 13:30:40','scroll_down');
INSERT INTO facebook_web_log values(0,'2019-04-28 15:31:40','page_exit');

Problem Statement : Write a SQL query to calculate each user's average session time. 
A session is defined as the time difference between a page_load and page_exit.  Assume a user has only
 1 session per day and if there are multiple of the same events on that day, consider only the latest 
 page_load and earliest page_exit. Output the user_id and their average session time 
 */
 
select * from facebook_web_log;

with recursive cte_pageload as (
	select userid,cast(Time_stamp AS date ) AS Dates,max(Time_stamp) as max_page_load
	from facebook_web_log
	where actions='page_load'
	group by userid,cast(Time_stamp AS date )
),
cte_pageexit as (
	select userid,cast(Time_stamp AS date) AS Dates,min(Time_stamp) as min_page_load
	from facebook_web_log
	where actions='page_exit'
	group by userid,cast(Time_stamp AS date)
)
select pl.userid, pl.Dates,cast(avg(datediff(second,max_page_load,min_page_load)*1.0) as decimal(5,1)) 
as Sessions from cte_pageload pl inner join cte_pageexit pe
on pl.userid = pe.userid AND pl.Dates = pe.Dates
group by pl.userid
