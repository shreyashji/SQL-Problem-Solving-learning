
#Find the Quiet Students in All Exams

create schema july;
use july;
create table july.students
(
student_id int,
student_name varchar(20)
);

insert into july.students values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table july.exams
(
exam_id int,
student_id int,
score int);

insert into july.exams values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);

#a quiet student is one who took atleast one exam and didnt score neither the high score or low score in any of the exam
#dont return the student who has never taken any exam,return the result table ordered by studnet_id

SELECT * FROM july.students;
SELECT * FROM july.exams;

with recursive all_scores as (
		SELECT exam_id,min(score) as min_score, max(score) as max_score
		FROM july.exams
        GROUP BY exam_id
)
SELECT  exams.student_id,max(CASE WHEN score=min_score or score=max_score THEN 1 ELSE 0 END) red_flag
FROM 
july.exams
INNER JOIN all_scores ON exams.exam_id = all_scores.exam_id
GROUP BY student_id
HAVING max(CASE WHEN score=min_score or score=max_score THEN 1 ELSE 0 END)=0
