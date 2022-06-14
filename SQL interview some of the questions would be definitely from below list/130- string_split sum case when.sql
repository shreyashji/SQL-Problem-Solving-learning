/*
use it;
Create Table Club (
Club_Id int,
Member_Id int,
EDU varchar(30));

Insert into Club Values (1001,210,Null);
Insert into Club Values (1001,211,'MM:CI');
Insert into Club Values (1002,215,'CD:CI:CM');
Insert into Club Values (1002,216,'CL:CM');
Insert into Club Values (1002,217,'MM:CM');
Insert into Club Values (1003,255,Null);
Insert into Club Values (1001,216,'CO:CD:CL:MM');
Insert into Club Values (1002,210,Null);

Problem Statement :-  Club Table has three columns namely Club_ID, Member_id and EDU.
Same member can be a part of different club.  The EDU column has different rewards. The points for these awards are as follows :-
MM – 0.5, CI – 0.5, CO- 0.5, CD – 1, CL-1, CM – 1
Write a SQL query to find the  total points scored by each club as shown in the desired output. 
Club_Id Reward
1001 4.0
1002 6.0
1003 NULL
*/

SELECT * FROM Club;

select club_id,sum( CASE WHEN VALUE IN ('MM','CI','CD') THEN 0.5
						 WHEN VALUE IN ('CD','CL','CM') THEN 1 END) AS Reward 
FROM 
(SELECT club_id,Member_id ,value from Club C
OUTER APPLY string_split(c.edu,':')) x
group by club_id


