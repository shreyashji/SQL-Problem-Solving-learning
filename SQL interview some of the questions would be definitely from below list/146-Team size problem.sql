use it;

create table team_size (
employee_id int,
team_id int
);
insert into team_size values (1,8);
insert into team_size values (2,8);
insert into team_size values (3,8);
insert into team_size values (4,7);
insert into team_size values (5,9);
insert into team_size values (6,9);

#Employees with Id 1,2,3 are part of a team with team_id = 8.
#Employees with Id 4 is part of a team with team_id = 7.
#Employees with Id 5,6 are part of a team with team_id = 9.

select * from team_size;

#1:- Window Functions (Most Simpler Soln)
SELECT employee_id,COUNT(employee_id) OVER(PARTITION BY  team_id ) AS team_size
FROM team_size ORDER BY employee_id;

#2:- Self Join
SELECT e1.employee_id,COUNT(*) AS team_size 
FROM team_size e1 JOIN team_size e2 ON
e1.team_id = e2.team_id
GROUP BY e1.employee_id ORDER BY e1.employee_id;

#3:- Using Correlated SubQuery
SELECT employee_id,
(SELECT COUNT(1) FROM team_size e2 WHERE E2.team_id = e.team_id ) as teaam_sizee
from team_size e