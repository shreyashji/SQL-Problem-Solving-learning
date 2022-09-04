use july;
CREATE TABLE july.quiz(
quizDate date,
empId int,
empName varchar(100),
result varchar(10),
score int
);

INSERT INTO july.quiz VALUES('2022-04-01',45,'Ram Singh','Fail',20),
('2022-04-02',49,'Kiran Deol','Pass',87),
('2022-04-09',45,'Ram Singh','Pass',49),
('2022-04-18',23,'Shruti Badajena','Fail',33),
('2022-04-03',49,'Kiran Deol','Pass',98),
('2022-08-22',23,'Shruti Badajena','Fail',34),
('2022-05-06',44,'Mayank Nigam','Pass',39),
('2022-06-06',44,'Mayank Nigam','Fail',30),
('2022-08-23',23,'Shruti Badajena','Fail',30);

SELECT * FROM july.quiz;
/* MARKING RECORD INVALID after first 'Pass' entry 
PROBLEM STMT :
We have input table quiz having below columns:
quizDate,empId,empName,result,score
♦ We want to mark all the records as invalid after employee passes the quiz for the first time.
♦ Whether record is valid or not is to be indicated in newly added "comments" column.
*/

SELECT * FROM JULY.quiz;
/*
#STEP 0:𝘭𝘦DISPLAYING THE INPUT DATA𝘳𝘦𝘥 𝘵
SELECT * FROM JULY.quiz;

#STEP 1 : IDENTIFYING THE days when employee hascleared the quizfor the first time
WITH first_pass AS(
SELECT empId,MIN(quizDate) first_pass_date
FROM quiz
WHERE result='Pass'
GROUP BY empId
)
#step 2  : marking the record 'Invalid' if they are after the first pass date
SELECT q.*,
CASE WHEN f.first_pass_date IS NULL OR q.quizDate <= f.first_pass_date THEN 'Valid'
   ELSE 'Invalid'
END comments
FROM quiz q LEFT OUTER JOIN first_pass f
ON q.empId=f.empId
ORDER BY empId,quizDate;
*/

WITH recursive first_pass AS (
	SELECT empId,MIN(quizDate) first_pass_date
	FROM july.quiz
	WHERE result='Pass'
	GROUP BY empId
)
SELECT q.*,
CASE WHEN f.first_pass_date IS NULL OR q.quizDate <= f.first_pass_date THEN 'Valid'
   ELSE 'Invalid'
END comments
FROM quiz q LEFT OUTER JOIN first_pass f
ON q.empId=f.empId
ORDER BY empId,quizDate;
