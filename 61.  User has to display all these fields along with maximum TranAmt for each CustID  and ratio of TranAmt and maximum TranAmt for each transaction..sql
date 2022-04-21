#CREATE TABLE Transaction_Tbl_1  
(
 CustID int ,
 TranID int ,
 TranAmt float ,
 TranDate date 
) ;

#drop table Transaction_Tbl_1 ;

#INSERT into Transaction_Tbl_1 VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date));
#INSERT into Transaction_Tbl_1 VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date));

select * from Transaction_Tbl_1;
#Method 1: windows function 
select 
*,
TranAmt/maximum_TranAmt
from(
select 
*,
max(TranAmt) over(partition by CustID ) as maximum_TranAmt
from 
Transaction_Tbl_1
) t;

#Method 2: Subquery 
select t2.*,
t1.max_amt,
(t2.TranAmt/t1.max_amt) as ratio
from 
Transaction_Tbl_1 t2
inner join
(select CustID,Max(TranAmt) as max_amt
from
Transaction_Tbl_1
group by CustID ) t1
on t1.CustID=t2.CustID;

#method 3
with t1 as 
(
select * from Transaction_Tbl_1
),
t2 as 
(
Select CustID,max(TranAmt) As max_amt from Transaction_Tbl_1 group by CustID
)
select t1.*,
t2.max_amt,
(t1.TranAmt/t2.max_amt) as ratio
from t1 
join t2 
on t1.CustID=t2.CustID;


