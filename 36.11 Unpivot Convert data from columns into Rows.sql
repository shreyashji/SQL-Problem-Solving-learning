#Convert data from columns into Rows | Unpivot
create table saless (
category varchar(15),
`2015` int,
`2016` int,
`2017` int,
`2018` int,
`2019` int,
`2020` int
);
#insert into saless values ('Hot Drinks',20000,15000,28000,12000,40000,10000);
#insert into saless values ('Cold Drinks',18000,36000,10000,12000,8000,2000);
select * from saless;
#ssms only
#hardcoded
Select Category, Year, Sales from 
( Select Category, [2015], [2016], [2017], [2018], [2019], [2020]
from Saless ) OrigSales
UNPIVOT
(Sales FOR YEAR IN ([2015], [2016], [2017], [2018], [2019], [2020]) #to appear as separate col
) as UNPIVT_SALES

#mysql
Select Category, Year, Sales from 
( Select Category, 2015, 2016, 2017, 2018, 2019, 2020
from Saless ) OrigSales
union all
(Sales FOR YEAR IN (2015, 2016, 2017, 2018, 2019, 2020)
) as UNPIVT_SALES