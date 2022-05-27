create table player_location(
name varchar(25),
city varchar(25)
);

Insert into player_location values ('Sachin','Mumbai'),
('Virat','Delhi'),('Rahul','Banglore'),('Rohit','Mumbai'),('Mayank','Banglore');

#each city need seprate column ,different level of pivoting

select max(CASE WHEN city='Banglore' then name end) as Banglore
,max(CASE WHEN city='Mumbai' then name end) as Mumbai
,min(CASE WHEN city='Delhi' then name end) as Delhi
from
(select *
,row_number() OVER(partition by city order by name asc) as player_groups
from player_location) a
group by player_groups
order by player_groups
;

