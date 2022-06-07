/*
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
It contains duration of calls between From_Id and To_Id. 
Write a SQL query to report the number of calls and the total call duration between each pair of
 distinct persons (Person1,Person2) 
where Person1 is less than Person2. Return the result as shown in Output Table.

*/
select * from Calls;

with tb_op as (
select 
CASE WHEN from_id < To_id THEN From_id ELSE To_id END AS Person_1
,CASE WHEN from_id > To_id THEN From_id ELSE To_id END AS Person_2
,Duration
from Calls) 
SELECT Person_1,Person_2,COUNT(Duration) AS 'Call_count',SUM(Duration) AS 'Total_duration'
FROM tb_op GROUP BY Person_1,Person_2

