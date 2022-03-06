#instead of hardcoding we are doing dynamic this time
create table Dpemp(
Name varchar(10),
Value varchar(10),
ID int
);
select * from Dpemp;
#insert into Dpemp values ('Name','Adam',1);
#insert into dpemp values ('Gender','Male',1);
#insert into dpemp values ('Salary','50000',1);
#insert into dpemp values ('Name','Mila',2);
#insert into dpemp values ('Gender','FeMale',2);
#insert into dpemp values ('Salary','50000',2);
#NOW WE WILL DO DYNAMICALLY
select STRING_AGG([Name],',') from
SELECT distinct [Name] from dpemp dp; #store the o/p of this querry

# start from here real full run below
declare @col nvarchar(MAX);
declare @sqql nvarchar(MAX);
set @col = (select STRING_AGG([Name],',') from
SELECT distinct [Name] from dpemp dp)
set  @sqql=
'select ID, ' + @col + '
from
(select ID,NAME as e_name,Value from Dpemp) as Src_table 
PIVOT   
(MAX(Value)    
for e_name in (' + @col + ')  
as Pivot_table ' ; #genrate text by this ,to execute @sqql use execute 
execute (@sqql)