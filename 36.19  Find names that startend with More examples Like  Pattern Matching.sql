select * from superstore_orders

#start with A
select Customer_Name from superstore_orders
where Customer_Name like 'A%';
#end with A
select Customer_Name from superstore_orders
where Customer_Name like '%A';

#length with 3 char end last two char end with an,_specify single char
select Customer_Name from superstore_orders
where Customer_Name like '_an';

#start with either a or c or d,SIGLE CHAR CONSTRAINT
select Customer_Name from superstore_orders
where Customer_Name like '[ACD]%';

#start with RANGE
select Product_Name from superstore_orders
where Product_Name like '[A-P]%';
#NOT BETWEEN A AND P
select Product_Name from superstore_orders
where Product_Name like '[^A-P]%';

select ORDER_ID from superstore_orders;
#3RD CHAR WOULD BE HIPHEN
select ORDER_ID from
 superstore_orders WHERE ORDER_ID LIKE '__-%';
 
 #
 SELECT PRODUCT_NAME from
 superstore_orders
 WHERE PRODUCT_NAME LIKE '%10[/]%'; 
 
 
