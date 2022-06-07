/*
create table Match_result
(
id int,
Team1 varchar(100),
Team2 Varchar(100),
Result Varchar(100)
);

insert into Match_result Values (1,'India','Australia','India');
insert into Match_result Values (2,'India','England','England');
insert into Match_result Values (3,'SuthAfrica','India','India');
insert into Match_result Values (4,'Australia','England',NULL);
insert into Match_result Values (5,'England','SuthAfrica','SuthAfrica');
insert into Match_result Values (6,'Australia','India','Australia');
*/

select Team,
       count(1) matchs,
       sum(case when Result= Team then 1 else 0 end) Wins,
       sum(case when Result!= Team then 1 else 0 end) Loss,
       sum(case when Result is null then 1 else 0 end) Ties
       from
		(select team1  as Team , Result from Match_Result
		union all select  Team2 as Team ,Result from Match_Result ) matches
group by  Team ;
#Write SQL to display total number of matches played, 
#matches won, matches tied and matches lost for each team

#TOTAL NUMBER OF MATCHES played by each teams
WITH recursive cte_match_played  AS (
SELECT Team,SUM(tot) AS Match_played FROM
(
SELECT Team1 as Team,COUNT(*) AS Tot FROM Match_Result GROUP BY Team1
UNION ALL
SELECT Team2,COUNT(*) AS Tot FROM Match_Result GROUP BY Team2
) A
GROUP BY Team
),
#total number of match won by each teams
CTE_Match_won AS (
SELECT Result,COUNT(*) as Match_won FROM Match_Result WHERE Result is not NULL
GROUP BY Result
),
#total number of match if tied any
CTE_Match_tie AS (
SELECT team1, tie_cnt FROM (
SELECT Team1,COUNT(*) AS tie_cnt FROM Match_Result WHERE Result IS NULL
GROUP BY Team1
UNION ALL
SELECT Team2,COUNT(*) AS tie_cnt FROM Match_Result WHERE Result IS NULL
GROUP BY Team2
)t
)
SELECT A.Team,A.Match_played,B.Match_won,isnull(c.TIE_CNT,0) AS Match_tie,
#totoal number of match lost by each team
(A.Match_played-b.Match_won-ISNULL(C.tie_cnt,0)) AS Match_lost
FROM cte_match_played AS A INNER JOIN CTE_Match_won AS B
ON A.team = B.Result
LEFT JOIN CTE_Match_tie C ON A.Team = C.team1;
