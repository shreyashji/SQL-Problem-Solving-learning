#create table orderss (order_id int,customer_id int,product_id int);
#insert into orderss VALUES (1, 1, 1),(1, 1, 2),(1, 1, 3),(2, 2, 1),(2, 2, 2),(2, 2, 4),(3, 1, 5)
#create table products (id int,name varchar(10));
#insert into products VALUES (1, 'A'),(2, 'B'),(3, 'C'),(4, 'D'),(5, 'E');

#Product recommendation. Just the basic type (“customers who bought this also bought…”). 
#That, in its simplest form, is an outcome of basket analysis. In this video we will learn how to find products which are most 
#frequently bought together using simple SQL. Based on the history ecommerce website can recommend products to new user.

select o1.order_id,o1.product_id as p1,o2.product_id as p2 from orderss o1
inner join orderss o2 on o1.order_id=o2.order_id
where o1.order_id=1 and o1.product_id !=o2.product_id  and o1.product_id != o2.product_id ;

select o1.product_id as p1,o2.product_id as p2 ,count(1) as purchase_frequency from orderss o1
inner join orderss o2 on o1.order_id=o2.order_id
where o1.product_id < o2.product_id 
group by  o1.product_id ,o2.product_id ;
#join with product table
select pr1.name as p1,pr2.name as p2,count(1) as purchase_frequency from orderss o1
inner join orderss o2 on o1.order_id=o2.order_id
inner join products pr1 on pr1.id=o1.product_id
inner join products pr2 on pr2.id=o2.product_id
where o1.product_id < o2.product_id 
group by  pr1.name ,pr2.name;
#concatenate 
select pr1.name +' '+ pr2.name as pair,count(1) as purchase_frequency from orderss o1
inner join orderss o2 on o1.order_id=o2.order_id
inner join products pr1 on pr1.id=o1.product_id
inner join products pr2 on pr2.id=o2.product_id
where o1.product_id < o2.product_id 
group by pr1.name ,pr2.name;

select * from  products;