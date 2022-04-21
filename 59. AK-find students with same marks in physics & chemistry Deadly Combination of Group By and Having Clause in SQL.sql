create table exams (student_id int, subject varchar(20), marks int);
#delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);

#find students with same marks in physics & chemistry
SELECT * FROM exams
where subject in("Physics","Chemistry")
group by student_id
Having count(distinct subject)=2 and count(distinct marks)=1; #if marks are same distinct count will be 1 