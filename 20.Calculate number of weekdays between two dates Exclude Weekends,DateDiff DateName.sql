SELECT * FROM world.superstore_orders;

select DATENAME(dw,order_date), order_date FROM world.superstore_orders;
#DAYNAME() function MySQL DAYNAME() returns the name of the week day of a date specified in the
select DAYNAME(order_date), order_date FROM world.superstore_orders;
#The WEEKDAY() function returns the weekday number for a given date. Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday,
SELECT weekday(order_date), order_date FROM world.superstore_orders;
#There is no DATEPART function in MySQL. Use MONTH(date_column)
#SELECT month(order_date), order_date FROM world.superstore_orders;

#ssms
SELECT order_date,SHIP_DATE, DATEDIFF(dd,order_date,ship_date) FROM world.superstore_orders;

SELECT order_date,SHIP_DATE, DATEDIFF(dd,order_date,ship_date) + 1 FROM world.superstore_orders;

SELECT order_date,SHIP_DATE, DATEDIFF(order_date,ship_date) FROM world.superstore_orders;

#Calculate number of weekdays between two dates | Exclude Weekends | DateDiff | DateName

SELECT order_date,SHIP_DATE, 
(DATEDIFF(order_date,ship_date)+1)
-DATEDIFF(order_date,ship_date)*2
- (CASE WHEN DATENAME(DW,ORDER_DATE)='Sunday' ,then 1 else 0  end)
- (CASE WHEN DATENAME(DW,ship_DATE)='Saturday' ,then 1 else 0  end)
 FROM world.superstore_orders;


