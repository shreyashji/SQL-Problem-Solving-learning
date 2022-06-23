USE IT;

create table business_city (
business_date date,
city_id int
);
delete from business_city;
insert into business_city
values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);

# TABLE HAS DATA FROM THE DAY WHEN UDAAN STARTED  OPERATOION
#SQL QUERIES TO FIND YEARWISE COUNT OF NEW CITIES where udaan started there operation

SELECT * FROM business_city;
with recursive cte_A as (
	SELECT DATEPART(YEAR,business_date) AS BUS_year,city_id
	FROM business_city
)
select c1.*,c2.*
from cte_A as c1
left join  cte_A as c2
on  c1.BUS_year > c2.BUS_year and c1.city_id = c2.city_id;
#if null those cities are new

with recursive cte_A as (
	SELECT YEAR(business_date) AS BUS_year,city_id
	FROM business_city
)
select c1.BUS_year,count(DISTINCT CASE WHEN c2.city_id IS NULL THEN c1.city_id END) AS NO_OF_NEW_CITIES
from cte_A as c1
left join  cte_A as c2
on  c1.BUS_year > c2.BUS_year and c1.city_id = c2.city_id
GROUP BY c1.BUS_year
