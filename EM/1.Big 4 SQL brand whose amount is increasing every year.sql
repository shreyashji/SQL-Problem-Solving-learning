#Problem Statement:
#Write a query to fetch the record of brand whose amount is increasing every year.

use em;
# Dataset:
#drop table brands;
create table brands
(
    Year    int,
    Brand   varchar(20),
    Amount  int
);
insert into brands values (2018, 'Apple', 45000);
insert into brands values (2019, 'Apple', 35000);
insert into brands values (2020, 'Apple', 75000);
insert into brands values (2018, 'Samsung',	15000);
insert into brands values (2019, 'Samsung',	20000);
insert into brands values (2020, 'Samsung',	25000);
insert into brands values (2018, 'Nokia', 21000);
insert into brands values (2019, 'Nokia', 17000);
insert into brands values (2020, 'Nokia', 14000);

#Solution:

with recursive cte as
(
select *,
	(
    case when amount < lead(amount, 1, amount+1)
	over(partition by brand order by year)
    then 1 else 0 end
    ) as flag
    from brands
)
select * from brands
where brand not in (select brand from cte where flag = 0)
