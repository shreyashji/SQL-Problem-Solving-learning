/*
use it;
Create Table Transactions_Amazon (
Id int,
UserId int,
Item Varchar(20),
CreatedAt Date,
Revenue int
);

Insert into Transactions_Amazon Values (1,109,'milk','2020-03-03',123);
Insert into Transactions_Amazon Values (2,103,'bread','2020-03-29',862);
Insert into Transactions_Amazon Values (3,128,'bread','2020-03-04',112);
Insert into Transactions_Amazon Values (4,128,'biscuit','2020-03-24',160);
Insert into Transactions_Amazon Values (5,100,'banana','2020-03-18',599);
Insert into Transactions_Amazon Values (6,103,'milk','2020-03-31',290);
Insert into Transactions_Amazon Values (7,102,'bread','2020-03-25',325);
Insert into Transactions_Amazon Values (8,109,'bread','2020-03-22',432);
Insert into Transactions_Amazon Values (9,101,'milk','2020-03-01',449);
Insert into Transactions_Amazon Values (10,100,'milk','2020-03-29',410);
Insert into Transactions_Amazon Values (11,129,'milk','2020-03-02',771);
Insert into Transactions_Amazon Values (12,104,'biscuit','2020-03-31',957);
Insert into Transactions_Amazon Values (13,110,'bread','2020-03-13',210);
Insert into Transactions_Amazon Values (14,128,'milk','2020-03-28',498);
Insert into Transactions_Amazon Values (15,109,'bread','2020-03-02',362);
Insert into Transactions_Amazon Values (16,110,'bread','2020-03-13',262);
Insert into Transactions_Amazon Values (17,105,'bread','2020-03-21',562);
Insert into Transactions_Amazon Values (18,101,'milk','2020-03-26',740);
Insert into Transactions_Amazon Values (19,100,'banana','2020-03-13',175);
Insert into Transactions_Amazon Values (20,105,'banana','2020-03-05',815);
Insert into Transactions_Amazon Values (21,129,'milk','2020-03-02',489);
Insert into Transactions_Amazon Values (22,105,'banana','2020-03-09',972);
Insert into Transactions_Amazon Values (23,107,'bread','2020-03-01',701);
Insert into Transactions_Amazon Values (24,100,'bread','2020-03-07',410);
Insert into Transactions_Amazon Values (25,110,'bread','2020-03-27',225);

Problem Statement : E commerce company is trying to identify returning active users.  
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
Write a SQL query to display the list of UserId of these returning active users.
*/

select distinct A.USERID,datediff(B.CreatedAt,A.CreatedAt) AS DIFF from Transactions_Amazon AS A
INNER JOIN Transactions_Amazon AS B
ON A.userid = B.userid
WHERE A.ID <> B.id AND datediff(B.CreatedAt,A.CreatedAt) BETWEEN 0 AND 7
order by A.userid;