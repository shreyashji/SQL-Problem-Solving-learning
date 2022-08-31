use july;

create table july.airbnb_searches 
(
user_id int,
date_searched date,
filter_room_types varchar(200)
);
#delete from july.airbnb_searches;
insert into july.airbnb_searches values
(1,'2022-01-01','entire home,private room')
,(2,'2022-01-02','entire home,shared room')
,(3,'2022-01-02','private room,shared room')
,(4,'2022-01-03','private room');
/*
fIND OUT room types that are searched most no. of times,output the room type the alongside the number of searches for it.
if the filter for room types has more than one room type,consider each unique room type as a seprate row.
sort the resultbased on number of searches in descending order
In this problem we will learn how to convert comma separated values into row.
*/
SELECT * FROM july.airbnb_searches;
#string_split function ,split by comma and give different row
select value from string_split('entire home,private room',',');

SELECT * FROM july.airbnb_searches
cross join string_split(filter_room_types,',');

SELECT value as room_types,count(1) as no_of_searches FROM july.airbnb_searches
cross join string_split(filter_room_types,',')
group by value
order by no_of_searches desc;