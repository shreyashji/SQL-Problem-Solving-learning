create table empt
(
emp_id int,
emp_name Varchar(20),
department_id Varchar(20),
salary int,
manager_id int
);
INSERT INTO empt values(1,'Ankit',100,10000,4);
INSERT INTO empt values(2,'Mohit',100,15000,5);
INSERT INTO empt values(3,'Vikas',100,10000,4);
INSERT INTO empt values(4,'Rohit',100,5000,2);
INSERT INTO empt values(5,'Mudit',200,12000,6);
INSERT INTO empt values(6,'Agam',200,12000,2);
INSERT INTO empt values(7,'Sanjay',200,9000,2);
INSERT INTO empt values(8,'Ashish',200,5000,2);
#INSERT INTO empt values(1,'saurabh',900,12000,2);
select * from empt;

#Q1-How to find duplicate in a given table ,IF COUNT>1 MEANS THERE ARE DUPLICATE,to put filter on agg cols we use having
select emp_id ,count(1) from empt group by emp_id having count(1)>1;

#Q2-HOW to delete duplicate 
with cte as (select * , row_number() over(partition by emp_id order by emp_id) as rn from empt)
delete from cte where rn>1;

#Q3- DIFFERENCE etween union and union all,union will remove all duplicates
select manager_id from empm
union 
select manager_id from empt;
#Q4-DIFFERENCE between rank,dense_rank,row_number,
#Q5-employees who are not present department table,sub queery not good for performance
select * from  empt where department_id not in (select dep_id from dept) ; # one way
select empt. *, dept.dep_id,dept.dep_name from empt 
left join dept on empt.department_id=dept.dep_id
where dept.dep_name is null;

create table dept
(
dep_id int,
dep_name Varchar(20)
);
INSERT INTO dept values(100,'Analytics');
INSERT INTO dept values(300,'IT');
select * from empt;
select * from dept;

#Q6- SECOND HIGHEST SALARY IN EACH DEPARTMENT,dec highest will rank 1
select * from (select empt.* ,dense_rank() over(partition by department_id order by salary desc) as rn from empt) as a
where rn=2;

#Q7-FIND ALL TRANSACTION DONE BY SHILPA
select * from orders where upper(customer_name)='SHILPA';

create table Orders
(
customer_name Varchar(20),
order_date date,
order_amount int,
customer_gender varchar(7)
);
#drop table Orders;

select * from orders;
#INSERT INTO orders values('Shilpa','2020-01-01',10000,'Male');
#INSERT INTO orders values('Rahul','2020-01-02',12000,'Female');
#INSERT INTO orders values('SHILPA','2020-01-01',12000,'Male');
#INSERT INTO orders values('Rohit','2020-01-03',15000,'Female');
#INSERT INTO orders values('Shilpa','2020-01-03',14000,'Male');

#Q-10 update querry to swap genders
SELECT * FROM ORDERS;

update orders set customer_gender= case when customer_gender='Male' then 'Female'
					   when customer_gender='Female' then 'Male' end;
