#Write an SQL query to find all numbers that appear at least three times consecutively.
#Create table If Not Exists Logs (id int, num int)
/*
Truncate table Logs;
insert into Logs values (1, 1);
insert into Logs values (2, 1);
insert into Logs values (3, 1);
insert into Logs values (4, 2);
insert into Logs values (5, 1);
insert into Logs values (6, 2);
insert into Logs values (7, 2);
*/
SELECT distinct a.num as consecutivenums FROM Logs a 
INNER JOIN Logs b
on a.id = b.id - 1 and a.num = b.num
INNER JOIN Logs c 
ON a.id = c.id-2  and a.num = c.num;

/*lead/lag*/
SELECT distinct num as ConsecutiveNums
FROM
	(SELECT id, num,
	lag(num) over (order by id) as beforee,
	lead(num) over (order by id) as afterr
	FROM logs) next_prev
WHERE num=beforee and beforee =afterr