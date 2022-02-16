create table person(
person_id int,
name char(10),
email varchar(30),
score int
);
#alter  table person MODIFY column person_id int;
#drop table person;
select * from person;
#insert into person values(1,'Alice','alice2018@hotmail.com',88);
#insert into person values(2,'bob','bob2018@hotmail.com',11);
#insert into person values(3,'davis','davis2018@hotmail.com',27);
#insert into person values(4,'tara','tara2018@hotmail.com',45);
#insert into person values(5,'john','john2018@hotmail.com',63);

create table friend(
personid int,
friend_id int
);
#insert into friend values (1,2);
#insert into friend values (1,3);
#insert into friend values (2,1);
#insert into friend values (2,3);
#insert into friend values (3,5);
#insert into friend values (4,2);
#insert into friend values (4,3);
#insert into friend values (4,5);
select * from friend;
#delete from friend;
#drop table friend;
select * from person;
select * from friend;
#wite a query to  find personid , name, number of friends,sum of marks of person who have friends with total score  greater than 100
select f.personid,f.friend_id,p.score as friend_score from friend f
inner join person p on f.personid=p.person_id;
 
 with score_details as (
select f.personid,sum(score) as total_friend_score, COUNT(1) AS no_of_friends from friend f
inner join person p on f.personid=p.person_id
group by f.personid
having SUM(P.SCORE) >100) 
select s.*,p.name as person_name from person p inner join score_details s on p.person_id=s.personid;


