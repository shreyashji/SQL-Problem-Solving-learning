#nalytical Functions | Lead | Lag
create table sales_table(
year int,
quater_name varchar(5),
sales int
);

select * from sales_table;
#DROP TABLE sales_table;
#insert into sales_table values (2018,'Q1',5000);
#insert into sales_table values (2018,'Q2',5500);
#insert into sales_table values (2018,'Q3',2500);
#insert into sales_table values (2018,'Q4',10000);
#insert into sales_table values (2019,'Q1',10000);
#insert into sales_table values (2019,'Q2',5500);
#insert into sales_table values (2019,'Q3',3000);
#insert into sales_table values (2019,'Q4',6000);

#lag function ,previous quaters
select year as years,
quater_name as quaters,
sales as current_sales,
LAG(sales) OVER(partition by year order by quater_name) as previous_quater_sales
from sales_table;

#2 quaters prior to current quaters
select year as years,
quater_name as quaters,
sales as current_sales,
LAG(sales,2) OVER(partition by year order by quater_name) as previous_quater_sales
from sales_table;

#lead function opposite of lag
select year as years,
quater_name as quaters,
sales as current_sales,
Lead(sales) OVER(partition by year order by quater_name desc) as previous_quater_sales
from sales_table;
