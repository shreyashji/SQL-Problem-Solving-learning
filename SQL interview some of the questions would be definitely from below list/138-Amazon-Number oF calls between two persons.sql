/*
USE IT;
Create Table Calls
(
From_Id int,
To_Id int,
Duration int   
);

INSERT INTO Calls Values(1,2,59);
INSERT INTO Calls Values(2,1,11);
INSERT INTO Calls Values(1,3,20);
INSERT INTO Calls Values(3,4,100);
INSERT INTO Calls Values(3,4,200);
INSERT INTO Calls Values(3,4,200);
INSERT INTO Calls Values(4,3,499);

Problem Statement : Calls Table has three columns namely From_Id, To_Id and Duration . 
It contains duration of calls between From_Id and To_Id. Write a SQL query to report the number of calls 
and the total call duration between each pair of distinct persons (Person1,Person2) where Person1 is less than 
Person2. Return the result as shown in Output Table.
*/

SELECT * FROM Calls;

WITH Cte_calls as (
	SELECT 
	CASE WHEN FROM_ID < TO_ID THEN FROM_ID ELSE TO_ID END AS Person1
	,CASE WHEN FROM_ID > TO_ID THEN FROM_ID ELSE TO_ID END AS Person2
	,Duration
	FROM Calls
)
SELECT Person1,Person2,COUNT(Duration) AS 'CALL_COUNT',SUM(Duration) AS 'TOTAL_DURATION' FROM Cte_calls 
GROUP BY Person1,Person2;