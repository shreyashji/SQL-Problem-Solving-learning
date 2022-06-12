/*
USE IT;
Create Table Phone_Log(
Source_Phone_Nbr Bigint,
Destination_Phone_Nbr Bigint,
Call_Start_DateTime Datetime) ;

Insert into Phone_Log Values (2345,6789,'2012-07-01 10:00');
Insert into Phone_Log Values (2345,1234,'2012-07-01 11:00');
Insert into Phone_Log Values (2345,4567,'2012-07-01 12:00');
Insert into Phone_Log Values (2345,4567,'2012-07-01 13:00');
Insert into Phone_Log Values (2345,6789,'2012-07-01 15:00');
Insert into Phone_Log Values (3311,7890,'2012-07-01 10:00');
Insert into Phone_Log Values (3311,6543,'2012-07-01 12:00');
Insert into Phone_Log Values (3311,1234,'2012-07-01 13:00');
*/

#Input :- Phone_Log Table has three columns namely Source_Phone_Nbr,  
#Destination_Phone_Nbr and Call_Start_DateTime. This table records all phone numbers that we dial in a given day.

#Problem Statement :-  Write a SQL to display the Source_Phone_Nbr and a flag where the flag needs to be set to 
#‘Y’ if first called number and last called number are the same and ‘N’ if first called number and last called number are different

SELECT * FROM Phone_Log;
#LEAST OR MIN time & max time for 1 call

SELECT Source_Phone_Nbr,
case when First_Call=LAST_Call THEN 'Y'
	when First_Call!=LAST_Call THEN 'N' END AS is_Match
FROM
(
SELECT Source_Phone_Nbr,
MAX(CASE WHEN rank_first=1 THEN Destination_Phone_Nbr END) AS First_Call,
MAX(CASE WHEN rank_last=1 THEN Destination_Phone_Nbr END) AS LAST_Call
FROM
(
SELECT Source_Phone_Nbr ,Destination_Phone_Nbr,Call_Start_DateTime
,ROW_NUMBER() OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime) as rank_first
,ROW_NUMBER() OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime desc) as rank_last
 FROM Phone_Log
 ) AS A
GROUP BY Source_Phone_Nbr
) AS B;

SELECT Source_Phone_Nbr,
case when First_Call=LAST_Call THEN 'Y'
	when First_Call!=LAST_Call THEN 'N' END AS is_Match
FROM
(
SELECT distinct Source_Phone_Nbr,
first_value(Destination_Phone_Nbr) OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime) AS First_Call,
last_value(Destination_Phone_Nbr) OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING) AS LAST_Call
FROM Phone_Log) AS A

 