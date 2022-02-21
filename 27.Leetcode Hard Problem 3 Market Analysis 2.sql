#create table usersp (user_id int ,join_date date,favorite_brand  varchar(50));
#create table ordersp (order_id int,order_date date ,item_id int ,buyer_id int,seller_id int);
#create table itemsp(item_id int, item_brand     varchar(50));
#insert into usersp values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');
#insert into itemsp values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');
#insert into ordersp values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2),(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);
with rnk_orders as
(select *,
rank() over(partition by seller_id order by order_date asc)  as rn
from ordersp)
select u.user_id as seller_id, ro.*,i.item_brand,u.favorite_brand 
,CASE when i.item_brand=u.favorite_brand then 'Yes' else 'No' end as second_item_fav_brand
from usersp u left join rnk_orders ro on ro.seller_id=u.user_id and rn=2
left join itemsp i on  i.item_id=ro.item_id;
#final querry 
with rnk_orders as
(select *,
rank() over(partition by seller_id order by order_date asc)  as rn
from ordersp)
select u.user_id as seller_id
,CASE when i.item_brand=u.favorite_brand then 'Yes' else 'No' end as second_item_fav_brand
from usersp u left join rnk_orders ro on ro.seller_id=u.user_id and rn=2
left join itemsp i on  i.item_id=ro.item_id;

select * from ordersp;
select * from usersp;
select * from itemsp;
#Market analysis : write an sql querry to find fro each seller ,wheather the brand  of the second item (by date)  they sold  is their favrouite brand or not.
# if seller sells less than two items, report the ans for that selleras no output
# seller_id 2nd_item_fav_brand
# 1			yes/no
# 2			yes/no
