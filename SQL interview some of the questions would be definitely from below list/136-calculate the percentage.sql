/*
use it;
create table SSC_Exam (
Id int,
English int,
Maths int,
Science int,
Geography int,
History int,
Sanskrit int);

Insert into SSC_Exam Values (1,85,99,92,86,86,99);
Insert into SSC_Exam Values (2,81,82,83,86,95,96);
Insert into SSC_Exam Values (3,76,55,76,76,56,76);
Insert into SSC_Exam Values (4,84,84,84,84,84,84);
Insert into SSC_Exam Values (5,83,99,45,88,75,90);

Problem Statement :- For the 2021 academic year, students have appeared in the SSC exam.
Write a SQL query to calculate the percentage of results using the best of the five rule i.e. You must take the top five grades for each student and calculate the percentage.


*/

SELECT * FROM SSC_Exam;

WITH recursive CTE_A AS (
	SELECT * FROM (
		SELECT id,English,Maths,Science ,Geography,History,Sanskrit FROM SSC_Exam
    ) AS T
    UNPIVOT
    (
    Marks for Subject IN ( English,Maths,Science ,Geography,History ,Sanskrit)
    ) unpvt
),
CTE_TOP_5_SUBJECT AS (
		SELECT id,Marks,Row_number() OVER(Partition by id order by Marks desc) AS rnk from CTE_A
),
CTE_DERIVE_PERCENTAGE AS (
	SELECT id,CAST(SUM(Marks) / 500.0 AS FLOAT) * 100 AS Percentage FROM CTE_TOP_5_SUBJECT WHERE rnk <= 5 GROUP BY id
)
SELECT S.id,English,Maths,Science ,Geography,Histor,Sanskrit, Percentage FROM CTE_DERIVE_PERCENTAGE AS C 
INNER JOIN SSC_Exam AS S 
ON C.ID=S.ID;
