use it;

create table date_time_sort(
cola nvarchar(50)
);
truncate date_time_sort;
select * from date_time_sort order by cola;

insert into date_time_sort values ('2022-07-24 22:00:00');
insert into date_time_sort values ('2022-07-24 10:00:00');
insert into date_time_sort values ('2022-07-24 09:00:00');
insert into date_time_sort values ('2022-07-24 01:00:00');

select now()
