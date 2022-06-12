
/*
Create Table Sample_1
(
X Bigint,
Y Bigint,
Z Bigint);

Insert into Sample_1 Values (200,400,1);
Insert into Sample_1 Values (200,400,2);
Insert into Sample_1 Values (200,400,3);
Insert into Sample_1 Values (10000,60000,1);
Insert into Sample_1 Values (500,600,1);
Insert into Sample_1 Values (500,600,2);
Insert into Sample_1 Values (20000,80000,1);
*/
#Input :- SampleTable has three columns namely X, Y and Z
#Problem Statement :- Write a SQL query to get the output as shown in the table
#query to show duplicates column based on two columns x,y,dont show unique records
select * from Sample_1;

with recursive cte_A as (
	SELECT X,Y,Z,COUNT(*) OVER(PARTITION BY X,Y ORDER BY X) AS CNT FROM Sample_1
)
select x,y,z from cte_A where CNT>1
