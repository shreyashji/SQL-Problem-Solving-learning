use dbo;
CREATE TABLE studentss(
 studentid int ,
 studentname varchar (255) NULL,
 subject varchar (255) NULL,
 marks int NULL,
 testid int NULL,
 testdate date  NULL
);
/*
insert into studentss values (2,'Max Ruin','Subject1',63,1,'2022-01-02');
insert into studentss values (3,'Arnold','Subject1',95,1,'2022-01-02');
insert into studentss values (4,'Krish Star','Subject1',61,1,'2022-01-02');
insert into studentss values (5,'John Mike','Subject1',91,1,'2022-01-02');
insert into studentss values (4,'Krish Star','Subject2',71,1,'2022-01-02');
insert into studentss values (3,'Arnold','Subject2',32,1,'2022-01-02');
insert into studentss values (5,'John Mike','Subject2',61,2,'2022-11-02');
insert into studentss values (1,'John Deo','Subject2',60,1,'2022-01-02');
insert into studentss values (2,'Max Ruin','Subject2',84,1,'2022-01-02');
insert into studentss values (2,'Max Ruin','Subject3',29,3,'2022-01-03');
insert into studentss values (5,'John Mike','Subject3',98,2,'2022-11-02');
*/
#1. get the list of studnets who scored above the average marks in each subject
with avg_cte as (
select subject,avg(marks) as avg_marks from studentss
 group by subject)
 select
 s.*,ac.*
 from studentss s 
 inner join avg_cte ac on s.subject = ac.subject
 where s.marks> ac.avg_marks;
 
 #2. write an sql querry to get % of students who score  more than 90 in any subject among total studentis
 
select
count(distinct  case when  marks > 90 then studentid else null end)*1.0/count(distinct studentid)* 100 as perc 
from studentss
order by studnetid,marks;

#write an sql querry to get the second highest 7 second lowest  marks for each subject
select * from studentss;
select (subject)
, sum(case when rnk_desc=2 then marks else null end) as second_highest_marks
,sum(case when rnk_asc=2 then marks else null end) as second_lowest_marks
from  
(
select (subject),marks
, rank() over(partition by (subject) order by marks asc) as rnk_asc
, rank() over(partition by (subject) order by marks desc) as rnk_desc
from studentss
) A
group by (subject);

#4. for each student and test ,identify if their marks increased or decreased from the previous test
select * from studentss
order by studentid,testdate,(subject);

select *
,case when  marks>PREV_MARKS then 'Increased'  
when marks<PREV_MARKS then 'Decreased'
else null end as status
from 
(
select *
,lag(marks,1)  over(partition BY studentID ORDER BY testdate,(subject))  AS PREV_MARKS
from studentss) A