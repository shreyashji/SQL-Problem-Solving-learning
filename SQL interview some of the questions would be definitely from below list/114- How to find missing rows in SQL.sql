Create Table Sample_Table(
ID int);
Insert into Sample_Table Values (1),(4),(7),(9),(12),(14),(16),(17),(20);
# Sample Table has ID column which is not continuous value starting from 1 to 20
#Problem Statement :-  Write a SQL to find the missing ID  From sample Table

select * from Sample_Table;

WITH recursive cte_a as (
	SELECT MAX(id) AS maximum FROM Sample_Table
 ),
 cte_B AS (
	SELECT Min(id) AS ID FROM IT.Sample_Table #BASE QUERY OR ANCHOR 
    union all
    SELECT B.id+1 FROM cte_a A inner join  cte_B B # recursive query
    on B.id < A.maximum
)
#SELECT B.id FROM cte_B as B where ID NOT IN (SELECT id FROM Sample_Table );
SELECT B.id FROM cte_B as B left join IT.Sample_Table as C
on B.id = C.id
WHERE C.ID IS NULL;
 
 
with recursive cte as (
select 1 as newid 
union all 
select newid +1 from cte 
where newid !=20 )
select newid from cte 
where newid not in (select *  from Sample_Table );


