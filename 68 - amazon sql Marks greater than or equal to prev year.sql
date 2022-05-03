CREATE TABLE Marks_Greter_or_equal_to_prev(
Student_Name  varchar(30),
Total_Marks  int ,
Year  int
);
/*
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Rahul',90,2010);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Sanjay',80,2010);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Mohan',70,2010);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Rahul',90,2011);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Sanjay',85,2011);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Mohan',65,2011);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Rahul',80,2012);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Sanjay',80,2012);
INSERT INTO Marks_Greter_or_equal_to_prev VALUES('Mohan',90,2012);
*/
select * from Marks_Greter_or_equal_to_prev;

#final querry
select student_name ,total_marks,Year
from
(
select student_name ,total_marks,Year,Prev_Year_marks,
case when total_marks >= Prev_Year_marks Then 1 Else 0 END as flag
FROM
(
select student_name,Year,total_marks,
LAG(TOTAL_MARKS) OVER(partition by STUDENT_NAME ORDER BY YEAR) AS Prev_Year_marks
from Marks_Greter_or_equal_to_prev 
) A
) B
WHERE Flag =1
