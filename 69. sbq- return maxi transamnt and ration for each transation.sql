CREATE TABLE dbo.Transaction_Tbl(
 CustID int,
 TranID int ,
 TranAmt float ,
 TranDate date
) ;
/*
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl(CustID, TranID, TranAmt, TranDate) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date));
INSERT dbo.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date));
*/
#user has to display maximum transamt for each  Custid  and ratio of Transaction amount and maximum Transaction amount  fro each transaction
select * from dbo.Transaction_Tbl