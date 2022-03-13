#Here is the script to insert data :
create table transactionss(
order_id int,
cust_id int,
order_date date,
amount int
);
#delete from transactionss;
#insert into transactionss values 
(1,1,'2020-01-15',150)
,(2,1,'2020-02-10',150)
,(3,2,'2020-01-16',150)
,(4,2,'2020-02-25',150)
,(5,3,'2020-01-10',150)
,(6,3,'2020-02-20',150)
,(7,4,'2020-01-20',150)
,(8,5,'2020-02-20',150)
;

select * from transactionss;
#Customer retention refers to the ability of a company or product to retain its customers over some specified period. 
#High customer retention means customers of the product or business tend to return to, continue to buy or
# in some other way not defect to another product or business, or to non-use entirely. 
#Company programs to retain customers: Zomato Pro , Cashbacks, Reward Programs,MEMBERSHIP, etc.
#Once these programs in place we need to build metrics to check if programs are working or not. 
#That is where we will write SQL to drive customer retention count.  
#If you preparing for SQL interviews for product based companies check this playlist :

#how many customers they are retain called Customer retention -part 1
#how many customers they are losing called Customer Churn - part 2
#customer retention last month-this month,different for diff industry

select * from transactionss;
#for jan there will be no customer retention  
#Jan 0 -> 0 retained 
#Feb-1,2,3 -> 3 cutomer retained
#5 id will not couunted in customer retention
#total 2 rows

#with self join,join on customer _id,difference of order date should be one month->count as retain customer
select * from transactionss
select * from transactionss;

select month(this_month.order_date,last_month) as Monthh,count(distinct last_month.cust_id) as retained_customers from 
transactionss this_month 
left join transactionss last_month
on this_month.cust_id = last_month.cust_id
and datediff(month,last_month.order_date,this_month.order_date)=1
group by month(this_month.order_date,last_month) #this is for mothwise data
#if do inner join -jan data will not come cozno repet customer was there
#we want to see each month data,even if there is no customer

#try with analytical function