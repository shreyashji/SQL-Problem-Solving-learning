/*
use it;
Create Table SeatArrangement (
ID int,
StudentName Varchar(30)
);

Insert into SeatArrangement Values (1,'Emma');
Insert into SeatArrangement Values (2,'John');
Insert into SeatArrangement Values (3,'Sophia');
Insert into SeatArrangement Values (4,'Donald');
Insert into SeatArrangement Values (5,'Tom');

Problem Statement :- Ruby is a teacher in a school and she has created a table called SeatArrangement which stores
 Student’s name and corresponding seat ids. Column id is continuous increment. Now Ruby wants to change the seats 
 for adjacent seats. Write a SQL query to output the result for Ruby
*/
SELECT * FROM SeatArrangement;

SELECT 
CASE WHEN id%2 <> 0  and ID= (SELECT COUNT(*) FROM SeatArrangement) THEN id #odd value and last value simply assigning as is
	 WHEN  id%2 <> 0 THEN id+1 #odd then increment the value
     WHEN  id%2 = 0 THEN id-1 END AS id, #if even decreasing the value
     StudentName
FROM SeatArrangement
order by id;