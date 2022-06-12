
use it;
/*
create table OrderStatus
(
Quote_Id varchar(5),
Order_Id varchar(5),
Order_Status Varchar(20)
);

Insert into OrderStatus Values ('A','A1','Delivered') ;
Insert into OrderStatus Values ('A','A2','Delivered') ;
Insert into OrderStatus Values ('A','A3','Delivered') ;
Insert into OrderStatus Values ('B','B1','Submitted') ;
Insert into OrderStatus Values ('B','B2','Delivered') ;
Insert into OrderStatus Values ('B','B3','Created') ;
Insert into OrderStatus Values ('C','C1','Submitted') ;
Insert into OrderStatus Values ('C','C2','Created') ;
Insert into OrderStatus Values ('C','C3','Submitted') ;
Insert into OrderStatus Values ('D','D1','Created') ;
*/
/*
Problem Statement :- Order Status Table has three columns namely Quote_id, Order_id and Order_Status
When all Orders are in delivered status then Quote status should be ‘Complete’.                                             
When one or more Orders in delivered status then “ In Delivery”.                                                                      When One or  more in Submitted status then “Awaiting for Submission” Else “Awaiting for Entry” by default

Note :- Order Priority should be Delivered, Submitted and Created
 If one order is in delivered and other one is in Submitted then Quote_Status should be “In Delivery” 
Similarly if one order is in Submitted and others in Created then the Quote_Status should be “Awaiting for Submission “ 
*/
SELECT * FROM OrderStatus;

WITH recursive cte_Order as (
	SELECT distinct Quote_id,order_status FROM OrderStatus
),
CTE_List AS(
	SELECT Quote_id,group_concat(order_status) AS List_status FROM cte_Order #all distinct status in one string
    GROUP BY Quote_id
)
SELECT Quote_id,
CASE WHEN locate('Delivered',List_status)=1 AND locate(',',List_status)=0 THEN 'Complete'
	WHEN locate('Delivered',List_status)>1 AND locate(',',List_status)>0 THEN 'In Delivery'
	WHEN locate('Submitted',List_status)>1 AND locate(',',List_status)>0 AND locate('Delivered',List_status)=0 THEN 'Awaiting for Submission'
ELSE 'Awaiting for Entry' END  AS Quote_status
FROM CTE_List ;
