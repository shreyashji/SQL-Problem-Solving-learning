/*
USE IT;
Create Table Account_Table(
TranDate DateTime,
TranID Varchar(20),
TranType Varchar(10),
Amount Float
);

INSERT Account_Table VALUES ('2020-05-12T05:29:44.120', 'A10001','Credit', 50000);
INSERT Account_Table  VALUES ('2020-05-13T10:30:20.100', 'B10001','Debit', 10000);
INSERT Account_Table  VALUES ('2020-05-13T11:27:50.130', 'B10002','Credit', 20000);
INSERT Account_Table  VALUES ('2020-05-14T08:35:30.123', 'C10001','Debit', 5000);
INSERT Account_Table  VALUES ('2020-05-14T09:43:51.100', 'C10002','Debit', 5000);
INSERT Account_Table VALUES ('2020-05-15T05:51:11.117', 'D10001','Credit', 30000);
*/

SELECT *, SUM(Amount * CASE WHEN Trantype = 'Credit' THEN 1 WHEN Trantype = 'Debit' THEN -1 ELSE 0 END) 
OVER(ORDER BY TranDate) AS Net_Balance FROM Account_Table;

select trandate,tranid,trantype,amount,
sum(case when trantype='Debit' then Amount*-1 else Amount end) 
over (order by trandate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
as "Net_Balance"
from account_table ;