#In this video we will discuss a scenario based SQL problem. I will be solving it using Analytical function. You will learn how to use Lead analytical function with partition by clause and how to deal with data ranges in SQL.
#create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
#delete from billings;
insert into billings values
('Sachin','1990-01-01',25)
,('Sehwag' ,'1989-01-01', 15)
,('Dhoni' ,'1989-1-01', 20)
,('Sachin' ,'1991-02-05', 30)
;

#create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '1990-07-01' ,3)
,('Sachin', '1990-08-01', 5)
,('Sehwag','1990-07-01', 2)
,('Sachin','1991-07-01', 4)

select * from HoursWorked;
select * from billings;

#TOTAL CHARGES AS PER BILLING RATE
SELECT *,
LEAD(BILL_DATE,1,'9999-12-31') OVER(PARTITION BY EMP_NAME ORDER BY BILL_DATE ASC) AS BILL_DATE_END
FROM BILLINGS;
#SSMS ONLY BELOW ONE
SELECT *,
LEAD(DATEADD(DAY,-1,BILL_DATE),1,'9999-12-31') OVER(PARTITION BY EMP_NAME ORDER BY BILL_DATE ASC) AS BILL_DATE_END
FROM BILLINGS;

#WITH CTE
WITH DATE_RANGE AS (
SELECT *,
LEAD(DATEADD(DAY,-1,BILL_DATE),1,'9999-12-31') OVER(PARTITION BY EMP_NAME ORDER BY BILL_DATE ASC) AS BILL_DATE_END
FROM BILLINGS
)
SELECT * FROM DATE_RANGE;
select * from HoursWorked;

#FINAL ANSWER QUERRY
WITH DATE_RANGE AS (
SELECT *,
LEAD(DATEADD(DAY,-1,BILL_DATE),1,'9999-12-31') OVER(PARTITION BY EMP_NAME ORDER BY BILL_DATE ASC) AS BILL_DATE_END
FROM BILLINGS
)
SELECT HW.EMP_NAME, SUM(DR.BILL_RATE * HW.BILL_HRS) FROM DATE_RANGE DR
INNER JOIN  HoursWorked HW ON DR.EMP_NAME=HW.EMP_NAME AND HW.WORK_DATE BETWEEN DR.BILL_DATE_END 
GROUP BY HW.EMP_NAME ;

SELECT 25*8+30*4;
