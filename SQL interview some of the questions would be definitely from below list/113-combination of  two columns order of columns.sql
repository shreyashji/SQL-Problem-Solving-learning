
USE IT;
Create Table Travel_Table(
Start_Location Varchar(30),
End_Location Varchar(30),
Distance int);

Insert into Travel_Table Values('Delhi','Pune',1400);
Insert into Travel_Table Values('Pune','Delhi',1400);
Insert into Travel_Table Values('Bangalore','Chennai',350);
Insert into Travel_Table Values('Mumbai','Ahmedabad',500);
Insert into Travel_Table Values('Chennai','Bangalore',350);
Insert into Travel_Table Values('Patna','Ranchi',300);

#Input :- Travel_Table has three columns namely Source, Destination and Distance. 

#Problem Statements :- Write SQL to get unique combination of  two columns Source and Destination irrespective
#of order of columns as shown below :-

select distinct
case when start_location > end_location  then end_location else start_location end as source,
case when start_location > end_location  then start_location else end_location end as dest,
distance
from IT.Travel_Table;

SElect * from Travel_Table  where Start_Location < End_Location
UNION 
Select * from Travel_Table where Start_Location Not in (Select End_location from Travel_Table);