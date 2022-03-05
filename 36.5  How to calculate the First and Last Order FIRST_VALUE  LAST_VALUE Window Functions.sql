# How to calculate the First and Last Order | FIRST_VALUE | LAST_VALUE | Window Functions
SELECT * from superstore_orders;

select order_id,order_date,sales as Total_due
,first_value(ORDER_ID) over(partition by YEAR(order_date) order by order_id,order_date) AS first_order
,first_value(ORDER_ID) over(partition by YEAR(order_date) order by order_id,order_date
ROWS BETWEEN UNBOUNDED PRECEDING AND current row)  as first_order_frm
,last_value(ORDER_ID) over(partition by YEAR(order_date) order by order_id,order_date) AS last_order
,last_value(ORDER_ID) over(partition by YEAR(order_date) order by order_id,order_date
ROWS BETWEEN current row and UNBOUNDED following)  as last_order_frm
from superstore_orders ;