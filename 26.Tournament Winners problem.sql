select * from players;
select * from matches;
#write the sql querry to find winner in each group
# the winner in each group is the palyer who  scored  the maximum total points within the group,in the case of tie,the lowest palyer id wins
with player_score as (
select first_player as player_id,first_score as score from matches
union  all
select second_player as player_id,second_score as score from matches)
,final_scores as (
select p.group_id,ps.player_id,sum(score) as score 
from player_score ps 
inner join players p on p.player_id=ps.player_id
group by p.group_id,ps.player_id)
,final_ranking as(
select *
,rank() over(partition by group_id order by score desc, player_id asc) as rn
from final_scores)
select * from final_ranking where rn=1;




create table players
(player_id int,
group_id int);

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

select * from players;
select * from matches;

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int);

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);

select * from matches;