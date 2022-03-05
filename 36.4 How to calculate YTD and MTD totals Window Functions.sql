#How to calculate YTD and MTD totals | Window Functions
#Month-To-Date MTD &  YTD Year-To-Date
select order_id,order_date,sales as Total_due from superstore_orders;

select order_id,order_date,sales as Total_due
,sum(sales) over(partition by YEAR(order_date) order by order_ID) as YTD
#PARTITON BY CLAUSE IS NOT MANDATORY ,CAN SKIP IT,ORDER BY ALWAYS MANDATORY
#IF FOUND DUPLICATE ,IT JUST MADE CALCULATION ONCE
from superstore_orders
ORDER BY ORDER_ID;

#AGGREGATE SHOULD BE ON LAST RECORD IF DUPLICATE BY WINDOW FRAMING(RANGE),CAN OBSERVE FOR SAME ORDER ID YTD_FRAME HAS DIFFERENT VALUES
#might be as per requirement: FINAL SUM ON THE LAST RECORD AS PER Requirement
#help full in 1st/last order of the quater or year,
select order_id,order_date,sales as Total_due
,sum(sales) over(partition by YEAR(order_date) order by order_ID) as YTD
,sum(sales) over(partition by YEAR(order_date) order by order_ID
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as YTD_FRAME
from superstore_orders ;

#when we did not add these pharase ,instead of using the rows,sql server using range
#single agreegated records on same orderid or order date if similar
select order_id,order_date,sales as Total_due
,sum(sales) over(partition by YEAR(order_date) order by order_ID) as YTD
,sum(sales) over(partition by YEAR(order_date) order by order_ID
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as YTD_FRAME
,sum(sales) over(partition by YEAR(order_date) order by order_ID
RANGE BETWEEN UNBOUNDED PRECEDING AND current row)  as YTD_range
from superstore_orders ;
#what range does is it identify distinct records besed on what you have defined for the ordering (order by) key
#for every record which have same key,considered as part of same record,treated as single record,7 same value should be output or all the same record
#if want to treat every row distinct need to define rows explicitly this(ROWS BETWEEN UNBOUNDED PRECEDING AND current row)

#NOW FOR MONTH TO DATE CALCULATION
select order_id,order_date,sales as Total_due
,sum(sales) over(partition by YEAR(order_date) order by order_ID
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as YTD_FRAME
,sum(sales) over(partition by YEAR(order_date),month(order_date) order by order_ID
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as MTD_FRAME
from superstore_orders ;

#LETS SAY WE WANT CAL SUM FOR LAST 3 ROWS OR ORDERS,remove unbounded
#GO BACK BY 2 ROWS COZ want to calculate PREVIOUS 2 ROWS + CURRENT
select order_id,order_date,sales as Total_due
,sum(sales) over(partition by YEAR(order_date) order by order_ID
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as YTD_FRAME
,sum(sales) over(partition by YEAR(order_date) order by order_ID
ROWS BETWEEN 2 PRECEDING AND current row)  as MTD_3
from superstore_orders ;
#3rd row =457+45+289=792(1,2,3 row sum)
#4t row = 45+289+166(sum of 2,3,4 row sum)