/*
use it;
Create Table Customer(
Customer_id  int,
Cus_name  Varchar(30),
Age  int,
Gender  Varchar(10),
App  Varchar(30) );

Insert into Customer Values(1,'Amelia',23,'Female','gpay');
Insert into Customer Values(2,'William',16,'Male','phonepay');
Insert into Customer Values(3,'James',18,'Male','paytm');
Insert into Customer Values(4,'David',24,'Male','paytm');
Insert into Customer Values(5,'Ava',21,'Female','gpay');
Insert into Customer Values(6,'Sophia',31,'Female','paytm');
Insert into Customer Values(7,'Oliver',23,'Male','gpay');
Insert into Customer Values(8,'Harry',29,'Male',NULL);
Insert into Customer Values(9,'Issac',16,'Male','gpay');
Insert into Customer Values(10,'Jack',22,'Male','phonepay');

Create Table Transaction_Tbls (
Loc_name Varchar(30),
Loc_id int,
Cus_id int,
Amount_paid Bigint,
Trans_id int);

Insert into Transaction_Tbls Values ('Florida',100,1,78899,1000);
Insert into Transaction_Tbls Values ('Florida',100,2,55678,1001);
Insert into Transaction_Tbls Values ('Florida',100,3,27788,1002);
Insert into Transaction_Tbls Values ('Florida',100,4,65886,1003);
Insert into Transaction_Tbls Values ('Alaska',101,5,57757,1004);
Insert into Transaction_Tbls Values ('Alaska',101,6,34676,1005);
Insert into Transaction_Tbls Values ('Alaska',101,7,66837,1006);
Insert into Transaction_Tbls Values ('Alaska',101,8,77633,1007);
Insert into Transaction_Tbls Values ('Texas',102,9,98766,1008);
Insert into Transaction_Tbls Values ('Texas',102,10,45335,1009);

Problem Statement :-   ABC Bank is trying to find their customers transaction mode. Customers are using different apps such as Gpay, PhonePe, Paytm etc along with offline transactions. Bank wants to know which mode/app is used for highest amount of transactions in each location.
Write a SQL query to find the app/mode and the count for highest amount of transactions in each location

Consider below points while fetching the record :-
* Columns to be fetched – App, Count
* Count – Number of times the app is used for the highest amount of transaction for each location. 
* If the App column is NULL, it means the customer has paid the amount through Offline  mode        
* The first letter of the app name should be in uppercase letter and the rest followed by the lowercase
* The Count should be in descending order
*/
SELECT * FROM Customer;
SELECT * FROM Transaction_Tbls;

WITH recursive CTE_A AS (
	SELECT App,Loc_name,amount_paid
    ,DENSE_RANK() OVER(PARTITION BY Loc_name ORDER BY amount_paid DESC) AS RNK
    FROM Customer C 
    INNER JOIN Transaction_Tbls T 
    ON C.customer_id = T.Cus_id
),
CTE_B AS (
SELECT isnull(App,'offline') AS App_name,Count(*) as Cnt FROM CTE_A
WHERE RNK=1
GROUP BY App)
SELECT concat((SUBSTRING(App_name,1,1)),LOWER(SUBSTRING(App_name,2,LENGTH(App_name)))) AS APP,Cnt FROM CTE_B
order by Cnt desc;



