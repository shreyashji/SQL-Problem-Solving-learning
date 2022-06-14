/*
use it;
Create Table Item(
ItemName Varchar(30),
TotalQuantity int
);
Insert into Item Values('Apple',2);
Insert into Item Values('Orange',3);

Problem Statement :-   ITEM Table  has two columns namely ItemName and TotalQuantity. Write a SQL query  to
 duplicate the rows based on total count in output table by adding two new columns ID and CatID
*/
select * from Item;

with recursive cte_a (Itemname,catid,totalquantity) AS (
	SELECT Itemname,1,totalquantity FROM Item
    UNION ALL
    SELECT Itemname,catid+1,totalquantity FROM cte_a
    where catid+1 <= totalquantity
)
select row_number() over(order by Itemname) as ID, Itemname,catid,totalquantity FROM cte_a order by Itemname