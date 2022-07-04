use it;
create table fact_sales(
   year int,
   month varchar(20) NULL,
   salary int
);

insert into fact_sales values (2021,'Jan',3000),
(2021,null,null),
(2021,'Mar',1500),(2021,null,null)
,(2021,null,null),
(2021,null,null),(2021,null,null),(2021,'Aug','7000'),(2021,null,null),
(2021,null,null),
(2021,null,null), (2021,null,null),
(2022,'Jan',2000),
(2022,null,null),(2022,'Mar',4500);

#ssms
with recursive cte_a as (
	select year,month,salary ,
	datename(month,concat(year,'-', row_number() over(partition by year order by year),'-01')) as Month_name
	from fact_sales
)
SELECT year,CASE WHEN month is null THEN Month_name ELSE month END AS month
,CASE WHEN salary=0 THEN 1000 ELSE salary END AS salary
FROM cte_a



