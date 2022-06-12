/*
Create Table Employees
(
Employee_no BigInt,
Birth_date Date,
First_name Varchar(50),
Last_name Varchar(50),
Joining_date Date
);

INSERT INTO Employees Values(1001,CAST('1988-08-15' AS Date),'ADAM','WAUGH', CAST('2013-04-12' AS Date));
INSERT INTO Employees Values(1002,CAST('1990-05-10' AS Date),'Mark','Jennifer', CAST('2010-06-25' AS Date));
INSERT INTO Employees Values(1003,CAST('1992-02-07' AS Date),'JOHN','Waugh', CAST('2016-02-07' AS Date));
INSERT INTO Employees Values(1004,CAST('1985-06-12' AS Date),'SOPHIA TRUMP','', CAST('2016-02-15' AS Date));
INSERT INTO Employees Values(1005,CAST('1995-03-25' AS Date),'Maria','Gracia', CAST('2011-04-09' AS Date));
INSERT INTO Employees Values(1006,CAST('1994-06-23' AS Date),'ROBERT','PATRICA', CAST('2015-06-23' AS Date));
INSERT INTO Employees Values(1007,CAST('1993-04-05' AS Date),'MIKE JOHNSON','', CAST('2014-03-09' AS Date));
INSERT INTO Employees Values(1008,CAST('1989-04-05' AS Date),'JAMES','OLIVER', CAST('2017-01-15' AS Date));
*/
/*Problem Statement :- Employees Table has five columns namely Employee_no, Birth_date , first_name , last_name and Joining_date

(1.)As a convention the values in first_name and last_name should always be in uppercase. But due to data entry issues some records may not adhere to this convention. Write a query to find all such records where first_name is not in upper case.
(2.) For some records the first_name column has full name and last_name is blank.  Write a SQL query to update it correctly,
(3.) Calculate tenure of employees as of 30th Jun 2017. Prepare following above sample report :
(4.) List all the employees whose work anniversary is same as their birthday date.
(5.) Find the Youngest (minimum age) employee with tenure more than 5 years as of 30th June 2017.

*/
SHOW CHARACTER SET;
SELECT * FROM Employees WHERE UPPER(First_name)!= First_name collate latin1_general_cs = 'lucasL90';

SELECT First_name,
left(First_name,locate(' ',First_name) -1 ) AS FName,
RIGHT(First_name,LENGTH(First_name)-locate(' ',First_name) + 1) AS Last_name
FROM Employees WHERE Last_name is null or Last_name='';

update Employees
SET First_name=left(First_name,locate(' ',First_name) -1 ),Last_name=RIGHT(First_name,LENGTH(First_name)-locate(' ',First_name) + 1) ;

#3
WITH RECURSIVE CTE_TENURE AS (
	SELECT Employee_no,CAST(datediff(month,Joining_date,'2017-06-30')AS Float) /12 AS Tenure
    FROM Employees
),
cte_temp AS (
	SELECT Employee_no,
    CASE WHEN Tenure < 1 THEN '< 1 Year'
		WHEN Tenure >=1 AND Tenure < 3 THEN  '1-3 Year'
        WHEN Tenure >=3 AND Tenure < 5 THEN  '3-5 Year'
        WHEN Tenure >=5 THEN '5+ Year' END AS Temp_Tenure 
    FROM CTE_TENURE
)
SELECT Temp_Tenure AS 'Tenure_in_Years',COUNT(*) AS Employee_Counts FROM cte_temp
GROUP BY Temp_Tenure;
#4

select * from Employees
WHERE DATEPART(dd,Birth_date)= DATEPART(dd,Joining_date) AND DATEPART(MM,Birth_date)=DATEPART(MM,Joining_date);

#5
select datediff(year,Birth_date,'2017-06-30') AS Min_age from 
(
SELECT MAX(Birth_date) AS BIRTH_DATE FROM Employees WHERE 
CAST(datediff(month,Joining_date,'2017-06-30') AS FLOAT)/12 >5
) a;