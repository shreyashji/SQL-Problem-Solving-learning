Create Table Item_Master
(
Id   Int ,
Did  Varchar(20)
);
Create Table Variant_Master
(
Id     Int,
Name   Varchar(10)
);
Insert Item_Master Values (1,'1,2'),(2,'3,4'),(3,'5,4'),(4,'3,4'),(5,'11,2');
Insert Variant_Master Values (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(11,'K');

SELECT * FROM Item_Master;
SELECT * FROM Variant_Master;

WITH CTE AS
(
Select *,
		LEFT(DID,1) AS LEFTJOIN,
		RIGHT(DID,+1) AS RIGHTJOIN
From    Item_Master  as I
)
SELECT CTE.ID,CONCAT(V1.Name,',',V2.Name) AS NASM
FROM   CTE AS CTE 
LEFT JOIN Variant_Master V1
ON CTE.LEFTJOIN = V1.Id
LEFT JOIN Variant_Master V2
ON CTE.RIGHTJOIN = V2.Id
