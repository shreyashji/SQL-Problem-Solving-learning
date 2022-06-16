/*
The Spending table keeps the logs of the spendings history of users that make purchases from an online shopping 
website which has a desktop and a mobile application.
Write an SQL query to find the total number of users and the total amount spent using mobile only, 
desktop only and both mobile and desktop together for each date.

use it;
create table Spending 
(
User_id int,
Spend_date date,
Platform varchar(10),
Amount int
);

Insert into spending values(1,'2019-07-01','Mobile',100);
Insert into spending values(1,'2019-07-01','Desktop',100);
Insert into spending values(2,'2019-07-01','Mobile',100);
Insert into spending values(2,'2019-07-02','Mobile',100);
Insert into spending values(3,'2019-07-01','Desktop',100);
Insert into spending values(3,'2019-07-02','Desktop',100);
*/
SELECT * FROM spending;



WITH recursive CTE_DESKTOP_OR_ONLY_MOBILE AS (
#LOGIC FOR ONLY DESKTOP or only mobile 
	SELECT Spend_date,User_id,MIN(Platform) AS Platform,SUM(AMOUNT) AS AMOUNT FROM spending GROUP BY Spend_date,User_id HAVING 
    COUNT(distinct Platform) =1 
    #USER ID WHO HAVE PURCHASED BOTH
    UNION ALL
    SELECT Spend_date,User_id,'Both' AS Platform,SUM(AMOUNT) AS AMOUNT FROM spending GROUP BY Spend_date,User_id HAVING 
    COUNT(distinct Platform) =2
	UNION ALL
    SELECT DISTINCT Spend_date,Null as User_id,'Both' AS Spend_date,0 AS AMOUNT FROM spending 
)
SELECT Spend_date,Platform,SUM(AMOUNT) AS TOTAL_AMOUNT,COUNT(DISTINCT User_id) AS TOTAL_USER_ID
FROM CTE_DESKTOP_OR_ONLY_MOBILE
GROUP BY Spend_date,Platform 
ORDER BY  Spend_date,Platform DESC;