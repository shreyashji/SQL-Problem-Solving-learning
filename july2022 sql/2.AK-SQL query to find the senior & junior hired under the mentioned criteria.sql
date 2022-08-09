/*A company wnats to hire new employees. the budget for the company for the salaries is $70,000 , the company criteria for hiring are :
keep hiring the senior with the smaller salary until you cannot hire anyomore seniors.
use the remaining budget to hire the junior with the smallest salary.
keep hiring the junior with the smallest salary until you cannot hire anymore juniors.
Write an SQL query to find the senior & junior hired under the mentioned criteria
#NEED TO FIND RUNNING SUM OF SENIOR & JUNIOR
#WHEN SALARY are duplicated there will be an issue, to resolve the issure we will use rows between

*/
USE JULY;
create table JULY.candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from JULY.candidates;
insert into JULY.candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);

SELECT * FROM JULY.candidates;

with recursive Total_sal as (
	SELECT *,
	SUM(SALARY) OVER(partition by experience ORDER BY salary ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_salary
	FROM JULY.candidates
),
seniors as (SELECT * FROM Total_sal where experience='Senior'  and Running_salary <= 70000)
SELECT * FROM Total_sal WHERE experience='Junior'  and Running_salary <= 70000-(SELECT SUM(SALARY) FROM seniors)
UNION ALL
SELECT * FROM seniors

