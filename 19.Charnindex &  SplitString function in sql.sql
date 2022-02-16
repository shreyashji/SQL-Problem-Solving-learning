#Split Concatenated String into Columns | CharIndex
create table empy2(
emp_id int,
name varchar(20)
);

select * from empy2;
#drop table empy2;
#insert into empy2 values (1,'Owens, Adams');
#insert into empy2 values (2,'Hopkins, David');
#insert into empy2 values (1,'Jonas, Mary');
#insert into empy2 values (1,'Rhodes, Susssan');

select name, CHARINDEX(',',name) as position_of_comma from empy2;

select name, left(name,CHARINDEX(',',name)) as last_name from empy2;
#dont want comma,exclude comma
select name, left(name,CHARINDEX(',',name) - 1 ) as last_name,
Right(name,len(name) -CHARINDEX(',',name)) as first_name
from empy2;

# SplitString function
select value from empy2 string_split('Owens, Adams',',');

select emp_id, value
,row_number() OVER(PARTITION BY emp_id ORDER BY emp_id ) AS ROOW_NUM
from empy2
CROSS APPLY
STRING_SPLIT(name,',');

WITH NAME_CTE AS 
(select emp_id, vALUEES
,row_number() OVER(PARTITION BY emp_id ORDER BY emp_id ) AS ROOW_NUM
from empy2
CROSS APPLY
STRING_SPLIT(name,',')
)
SELECT emp_id, [1] AS LAST_NAME,[2] AS FIRST_NAME FROM NAME_CTE
PIVOT
(MAX(vALUEES) 
FOR ROOW_NUM IN ([1],[2])) as pvt;
 
