Create Table it.Sales_Table(
Sales_Date Date,
Sales_Amount Bigint,
Currency Varchar(10)
);

INSERT INTO it.Sales_Table Values ('2020-01-01',500,'INR');
INSERT INTO it.Sales_Table Values ('2020-01-01',100,'GBP');
INSERT INTO it.Sales_Table Values ('2020-01-02',1000,'INR');
INSERT INTO it.Sales_Table Values ('2020-01-02',500,'GBP');
INSERT INTO it.Sales_Table Values ('2020-01-03',500,'INR');
INSERT INTO it.Sales_Table Values ('2020-01-17',200,'GBP');

CREATE TABLE it.ExchangeRate_Table(
 Source_Currency varchar(10) ,
Target_Currency varchar(10),
 Exchange_Rate float ,
 Effective_Start_Date date
) ;

INSERT it.ExchangeRate_Table VALUES ('INR','USD', 0.014,'2019-12-31');
INSERT it.ExchangeRate_Table VALUES ('INR','USD', 0.015,'2020-01-02');
INSERT it.ExchangeRate_Table VALUES ('GBP','USD', 1.32, '2019-12-20');
INSERT it.ExchangeRate_Table VALUES ('GBP','USD', 1.3, '2020-01-01' );
INSERT it.ExchangeRate_Table VALUES ('GBP','USD', 1.35, '2020-01-16');

SELECT * FROM IT.Sales_Table;
SELECT * FROM IT.ExchangeRate_Table;

#Input :- There are two table. First table name is Sales_Table. Second Table name is ExchangeRate_Table. 
#As and when exchange rate changes, a new row is inserted in the ExchangeRate table with a
#new effective start date.
#Problem Statements :- Write SQL to get Total  sales amount in USD for each sales date as shown below

USE IT;
with recursive cte as 
(select s.*,e.*, round(e.exchange_rate* sales_amount,1) as total from Sales_Table 
s join ExchangeRate_Table e
on s.currency = e.source_Currency 
and s.sales_date >= Effective_Start_Date)
/* now just refine effective_start_date */
select sales_date,sum(total) AS 'Total sales amount in USD'
from cte 
where (sales_date,currency,effective_start_date) in 
(select sales_date,currency,max(effective_start_date) from cte group by sales_date,currency)
group by sales_date;