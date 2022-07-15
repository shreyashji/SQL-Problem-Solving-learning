
/*
use it;

Create Table Students_Tbl
(
Id int,
Student_Name Varchar(30)
);

Insert into Students_Tbl values(1,'Mark');
Insert into Students_Tbl values(2,'David');
Insert into Students_Tbl values(3,'John');
Insert into Students_Tbl values(4,'Albert');

Create Table Friends_Tbl(
Id int,
Friend_Id int
);

Insert into Friends_Tbl values(1,2);
Insert into Friends_Tbl values(2,3);
Insert into Friends_Tbl values(3,4);
Insert into Friends_Tbl values(4,1);

Create Table Package_Tbl
(Id int,
Salary Bigint );

Insert into Package_Tbl values(1,18);
Insert into Package_Tbl values(2,12);
Insert into Package_Tbl values(3,13);
Insert into Package_Tbl values(4,15);

Problem Statement : Write a SQL query to output the names of those students whose best friends got 
higher salary package than Student.             
*/

SELECT * FROM Students_Tbl;
SELECT * FROM Friends_Tbl;
SELECT * FROM Package_Tbl;

use it;

WITH recursive CTE_STUDENT AS (
	SELECT A.ID,A.STUDENT_NAME,F.FRIEND_ID,P.SALARY FROM Students_Tbl AS A INNER JOIN Friends_Tbl AS F ON A.ID = F.ID
	INNER JOIN Package_Tbl AS P ON A.ID = P.ID
),
CTE_FRIEND AS (
	SELECT ST.STUDENT_NAME AS 'STUDENT_NAME', ST.SALARY AS 'STUDENT_SALARY',BF.STUDENT_NAME AS 'BEST_FRIEND'
    ,BF.SALARY AS 'BEST_FRIEND_SALARY'
    FROM CTE_STUDENT AS ST
    INNER JOIN CTE_STUDENT AS BF ON ST.FRIEND_ID = BF.ID
)
SELECT STUDENT_NAME FROM CTE_FRIEND
WHERE BEST_FRIEND_SALARY > STUDENT_SALARY;

SELECT *, S.Student_Name FROM (Students_Tbl S JOIN Friends_Tbl f using (id)
join  Package_Tbl p1 on s.id=p1.id 
join Package_Tbl p2 on f.Friend_Id = p2.id )
where p2.salary > p1.salary
order by p2.salary;
