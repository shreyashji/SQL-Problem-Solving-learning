#Problem Statement : Write a SQL query to find the top 3 products that are most frequently bought together (purchased in the same transaction).
#Output the name of product #1, name of product #2 and number of combinations in descending order. 
USE JULY;


Create Table JULY.Transactions_Walmart (
transaction_id int,
product_id int,
users_id int,
transaction_date datetime
);

Insert into JULY.Transactions_Walmart values ('231574', 111, 234, '2022-03-06 12:00:00');
Insert into JULY.Transactions_Walmart values ('231574', 444, 234, '2022-03-06 12:00:00');
Insert into JULY.Transactions_Walmart values ('231574', 222, 234, '2022-03-07 12:00:00');
Insert into JULY.Transactions_Walmart values ('137124', 444, 125, '2022-03-07 12:00:00');
Insert into JULY.Transactions_Walmart values ('256234', 222, 311, '2022-03-01 12:00:00');
Insert into JULY.Transactions_Walmart values ('523152', 222, 746, '2022-03-01 12:00:00');
Insert into JULY.Transactions_Walmart values ('141415', 333, 235, '2022-03-01 12:00:00');
Insert into JULY.Transactions_Walmart values ('523152', 444, 746, '2022-03-02 12:00:00');
Insert into JULY.Transactions_Walmart values ('137124', 111, 125, '2022-03-05 12:00:00');
Insert into JULY.Transactions_Walmart values ('256234', 333, 311, '2022-03-05 12:00:00');

delete from JULY.Transactions_Walmart;

Create Table JULY.Products_Walmart(
product_id int,
product_name varchar(50)
);

Insert into JULY.Products_Walmart values (111,'apple');
Insert into JULY.Products_Walmart values (222,'soya milk');
Insert into JULY.Products_Walmart values (333,'instant oatmeal');
Insert into JULY.Products_Walmart values (444,'banana');
Insert into JULY.Products_Walmart values (555,'chia seed');

SELECT * FROM JULY.Products_Walmart;
SELECT * FROM JULY.Transactions_Walmart;

WITH recursive Cte_product as (
	SELECT tw.transaction_id, pm.product_id, tw.users_id,pm.product_name FROM JULY.Transactions_Walmart AS tw INNER JOIN JULY.Products_Walmart pm
    ON tw.product_id = pm.product_id
),
cte_product_combo as (
	SELECT A.product_name AS Product1,B.product_name Product2,count(1) AS Combo_sum FROM Cte_product as A inner join  Cte_product as B ON
    A.transaction_id = B.transaction_id AND A.product_name < B.product_name
    GROUP BY A.product_name, B.product_name
)
select Product1,Product2,Combo_sum from cte_product_combo order by Combo_sum desc limit 3