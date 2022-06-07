
/*
Create Table Team(
ID INT,
TeamName Varchar(50)
);

INSERT INTO Team VALUES(1,'India'),(2,'Australia'),(3,'England'),(4,'NewZealand');
*/

SELECT * FROM Team;
#self join
select concat(t1.teamname, " Vs " ,t2.teamname) as Matches from 
(SELECT id,teamname FROM Team) AS t1
INNER JOIN
(SELECT id,teamname FROM Team) AS t2
ON t1.id < t2.id
order by t1.id;

#cte
WITH t2 as  
(SELECT ID,TEAMNAME FROM TEAM),
t1 as 
(SELECT ID,TEAMNAME FROM TEAM)
select concat(t1.teamname, " VS " ,t2.teamname) AS MATCHES from t1,t2
where t1.id < t2.id
ORDER BY 1 ;