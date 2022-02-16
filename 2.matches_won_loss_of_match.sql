###Derive points table of cricket 
#In this video we are going to discuss about a very interesting SQL scenario where we will be deriving points table for a typical tournament . 
select team_name, count(1) as no_of_matches_played,sum(win_flag) as no_of_matches_won,count(1) - sum(win_flag) as no_of_losses
from (select team_1 as team_name,case when team_1=winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select team_2 as team_name,case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup) A
group by team_name
order by no_of_matches_won desc ;

select * from emp;
#create table emp
#(
#emp_id int,
#emp_name Varchar(20),
#department_id Varchar(20),
#salary int
#);
#INSERT INTO emp values(1,'Ankit',100,10000);
#INSERT INTO emp values(2,'Mohit',100,15000);
#INSERT INTO emp values(3,'Vikas',100,10000);
#INSERT INTO emp values(4,'Rohit',100,5000);
#INSERT INTO emp values(5,'Mudit',200,12000);
#INSERT INTO emp values(6,'Agam',200,12000);
#INSERT INTO emp values(7,'Sanjay',200,9000);
#INSERT INTO emp values(8,'Ashish',200,5000);



