create table pemp(
Name varchar(10),
Value varchar(10),
ID int
);
select * from pemp;
#insert into pemp values ('Name','Adam',1);
#insert into pemp values ('Gender','Male',1);
#insert into pemp values ('Salary','50000',1);
#SSMS
select ID,[Name],[Gender],[Salary]    #5.select from pivot table
from
(select ID,NAME as e_name,Value from pemp) as Src_table  #1select data which we need for pivoting from base table
PIVOT   #2.define pivot function
(MAX(Value)    #3.aggregate value which you want to show
for 
e_name in ([Name],[Gender],[Salary]))  # 4.define column name which you want in output
as Pivot_table