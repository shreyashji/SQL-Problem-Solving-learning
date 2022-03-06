create table dbo.dimEmp (
first_name varchar(15),
last_name varchar(15),
Birth_Date date
);
select * from dbo.dimEmp;
#insert into dbo.dimEmp values ('Gey','Gilbent','1981-11-12');
#insert into dbo.dimEmp values ('kevin','brown','1960-02-29');
#insert into dbo.dimEmp values ('Roberto','Tombunelo','1961-03-01');
#insert into dbo.dimEmp values ('Gey','Gilbent','1971-07-23');
#insert into dbo.dimEmp values ('Rob','Walters','1974-07-23');
#insert into dbo.dimEmp values ('Rob','Walters','1974-07-23');
#insert into dbo.dimEmp values ('therry','deheris','1961-02-26');
#insert into dbo.dimEmp values ('David','Bradley','1974-10-17');
#insert into dbo.dimEmp values ('David','Bradley','1974-10-17');
#insert into dbo.dimEmp values ('jolyn','dobley','1961-02-16');
#insert into dbo.dimEmp values ('ruth','book','1961-02-28');
#ssms only
select first_name, last_name, Birth_Date, DATEADD(Year,60,Birth_Date)
from dbo.dimEmp
WHERE DATEADD(Year,60,Birth_Date) <= EOMONTH(Getdate()) #for

#EOMONTH(Getdate()) calculate end date of current month

