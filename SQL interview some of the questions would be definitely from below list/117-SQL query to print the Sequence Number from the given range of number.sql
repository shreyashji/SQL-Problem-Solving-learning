#Input :- SampleTable has columns namely Start_Range and End_Range
#Problem Statement :- Write a SQL query to print the Sequence Number from the given range of number.
/*
USE IT;
Create Table SampleTable
(
Start_Range Bigint,
End_Range Bigint
);
Insert into SampleTable Values (1,4);
Insert into SampleTable Values (6,6);
Insert into SampleTable Values (8,9);
Insert into SampleTable Values (11,13);
Insert into SampleTable Values (15,15);
*/

SELECT * FROM SampleTable;

use it;
WITH recursive CTE_A AS(
	SELECT MAX(END_RANGE) AS LAST_VALU FROM SampleTable
),
cte_b as (
	SELECT MIN(start_RANGE) AS id FROM SampleTable #base query
    UNION ALL
    SELECT id+1 FROM cte_b
    WHERE id < (SELECT LAST_VALU FROM CTE_A)
)
SELECT id from cte_b,SampleTable #cross join 
WHERE id >= start_RANGE and id <= END_RANGE #filter condition
order by id;