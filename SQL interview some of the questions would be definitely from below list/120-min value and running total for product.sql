
USE IT;
Create Table Sales1
(
Id int,
Product Varchar(20),
Sales Bigint
);
DROP TABLE Sales1;
Insert into Sales1 values(1001,'Keyboard',20);
Insert into Sales1 values(1002,'Keyboard',25);
Insert into Sales1 values(1003,'Laptop',30);
Insert into Sales1 values(1004,'Laptop',35);
Insert into Sales1 values(1005,'Laptop',40);
Insert into Sales1 values(1006,'Monitor',45);
Insert into Sales1 values(1007,'WebCam',50);
Insert into Sales1 values(1008,'WebCam',55);

SELECT * FROM Sales1;

SELECT id,product,MIN(Sales) OVER(partition by Product ORDER BY Id) as Sales_1
FROM Sales1;

#running total
SELECT id,product,
sum(Sales) OVER(partition by Product ORDER BY Id) as Sales_1
FROM Sales1

