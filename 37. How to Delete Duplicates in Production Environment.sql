create table transaction (
order_id int,
order_date date,
product_name varchar(6),
order_amount int,
create_time datetime
); 
#drop table transaction;
select * from transaction;
insert into transaction values(1,'2022-03-03','P1',150,CURRENT_TIMESTAMP());
insert into transaction values(2,'2022-03-03','P2',200,CURRENT_TIMESTAMP());
insert into transaction values(3,'2022-03-03','P3',300,CURRENT_TIMESTAMP());
select * from transaction;

#step 1 - take backup of original table
##ssms
select * into transaction_table_backup from transaction;
#step 2 - delet duplicates,using delete
select order_id,
min(create_time) as no_of_records from transaction 
group by order_id having count(1)>1;

#below queery not work in ssms
delete from transaction where order_id,create_time in (select order_id,
min(create_time)  from transaction 
group by order_id having count(1)>1;

#so use this ,if more than 2 duplicate need to run 1 more time this querry
delete t from transaction t inner join
(select order_id,
min(create_time) as create_time from transaction 
group by order_id having count(1)>1) as a
on a.order_id=t.order_id and
a.create_time=t.create_time;

#second approcah by using row number,if pk is two coln,put 2 coln in partition by
select * ,
row_number() over(partition by order_id order by create_time desc) as rn
from transaction;

#insert into row number 1,take backup before and use back up table below,insert into original
insert into transaction
select order_id,order_date,product_name,order_time,create_time from 
(
select * ,
row_number() over(partition by order_id order by create_time desc) as rn
from transaction) a
where rn=1;

#delete pure duplicates,all same
#update transaction set create_time=CURRENT_TIMESTAMP();
#take back up first, then insert into originak table by distinct,above querry will not work ,but below querry work in all cases
select distinct * from transaction
#take backup
insert into transaction_backup
select * from transaction;

#insert
insert into transaction
select distinct * from transaction_backup;