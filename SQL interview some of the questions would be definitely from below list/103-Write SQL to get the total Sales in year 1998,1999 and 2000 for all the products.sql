/*
drop table salestbl;
create table salestbl (
id int AUTO_INCREMENT key, 
product varchar(20), 
salesyear int, 
QuantitySold int);

insert into salestbl (product, salesyear, QuantitySold)
values ('Laptop', 1998, 2500), ('Laptop', 1999, 3600),
('Laptop', 2000, 4200),
('Keyboard', 1998, 2300), ('Keyboard',1999, 3600), ('Keyboard', 2000, 5000),
('Mouse', 1998, 6000), ('Mouse', 1999, 3400), ('Mouse', 2000, 4600);
*/
#Write SQL to get the total Sales in year 1998,1999 and 2000 for all the products as shown below.
SELECT * FROM salestbl;



select 'TotalSales' as TotalSales, 
sum(case when SalesYear=1998 then QuantitySold else 0 end ) as "1998" ,
sum(case when SalesYear=1999 then QuantitySold else 0 end ) as "1999",
sum(case when SalesYear=2000 then QuantitySold else 0 end) as  "2000"
from salestbl;


