
/*use it;

Create Table Stadium(
id int,
Visit_Date Date,
No_Of_People Bigint);

Insert into Stadium Values(1,'2018-01-01',10);
Insert into Stadium Values(2,'2018-01-02',110);
Insert into Stadium Values(3,'2018-01-03',150);
Insert into Stadium Values(4,'2018-01-04',98);
Insert into Stadium Values(5,'2018-01-05',140);
Insert into Stadium Values(6,'2018-01-06',1450);
Insert into Stadium Values(7,'2018-01-07',199);
Insert into Stadium Values(8,'2018-01-09',125);
Insert into Stadium Values(9,'2018-01-10',88);

Problem Statement :- Stadium Table has three columns namely Id, Visit_Date and No_Of_People. Write a SQL query to display the
records with three or more rows with consecutive id’s and the number of people is greater than or equal to 100. 
Return the result table ordered by Visit_Date as shown in the below table.

*/
select * from Stadium;

with recursive cte_stadium as (
	SELECT ID AS id1,
    LEAD(id,1) OVER(ORDER BY ID) AS id2,#offset 1 means select data from next row after 1st
    LEAD(id,2) OVER(ORDER BY ID) AS id3 #offset 2 means select data from third row
    FROM Stadium 
    WHERE No_Of_People >= 100
),
CTE_Temp as (
	SELECT * FROM cte_stadium AS A 
    LEFT JOIN Stadium AS B
    ON (B.id = A.id1 OR B.id = A.id2 OR B.id = A.id3)
    WHERE id1+1=id2 AND id2+1=id3
)
SELECT distinct id,Visit_Date,No_Of_People from CTE_Temp;

WITH recursive CTE_GRP_NUMBERS AS (
	SELECT *
	,row_number() OVER(ORDER BY Visit_Date) AS rn
	,ID-row_number() OVER(ORDER BY Visit_Date) AS grp #subtraction of consecutive no by a consucutive the diff will be same
	FROM Stadium
	WHERE No_Of_People >= 100
)
SELECT id,Visit_Date,No_Of_People FROM CTE_GRP_NUMBERS WHERE grp in 
(
SELECT grp FROM CTE_GRP_NUMBERS
GROUP BY grp
HAVING Count(1)>=3
)