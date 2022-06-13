/*
use it;
Create Table Emp_Table (
SerialNo int,
Name Varchar(30),
Month_ID int,
Amount Bigint );

Insert into Emp_Table Values  (1,'JOHN',1,1000);
Insert into Emp_Table Values  (1,'JOHN',2,3000);
Insert into Emp_Table Values  (8,'DAVID',3,4000);
Insert into Emp_Table Values  (8,'DAVID',5,2000);

Create Table Month_Table(
Month_ID int,
Month Varchar(30));

Insert into Month_Table Values (1, 'JAN');
Insert into Month_Table Values (2, 'FEB');
Insert into Month_Table Values (3, 'MAR');
Insert into Month_Table Values (4, 'APR');
Insert into Month_Table Values (5, 'MAY');
Insert into Month_Table Values (6, 'JUN');
Insert into Month_Table Values (7, 'JUL');
Insert into Month_Table Values (8, 'AUG');
Insert into Month_Table Values (9, 'SEP');
Insert into Month_Table Values (10, 'OCT');
Insert into Month_Table Values (11, 'NOV');
Insert into Month_Table Values (12, 'DEC');
*/
SELECT * FROM Emp_Table;
SELECT * FROM Month_Table;

WITH recursive cte_emp as (
	SELECT distinct E.SerialNo,E.name,M.Month_ID,M.Month FROM Emp_Table E
    CROSS JOIN Month_Table M
)
select C.SerialNo,C.NAME,C.month,E.Amount from cte_emp C
LEFT JOIN Emp_Table E
ON C.SerialNo= E.SerialNo 
AND C.Month_ID=E.Month_ID
order by c.SerialNo,c.Month_ID;