create table july.patients( name varchar(50), status varchar(50), timestamp varchar(50));
#drop table patients;
/*
insert into july.patients values('A','IN','2022-08-23 10:00:00');
insert into july.patients values('A','OUT','2022-08-23 14:00:00');
insert into july.patients values('A','IN','2022-08-23 16:00:00');
insert into july.patients values('B','IN','2022-08-23 12:00:00');
insert into july.patients values('C','IN','2022-08-23 18:00:00');
insert into july.patients values('D','IN','2022-08-23 20:00:00');
insert into july.patients values('D','OUT','2022-08-24 12:00:00');
insert into july.patients values('E','IN','2022-08-24 12:00:00');
insert into july.patients values('F','IN','2022-08-24 12:00:00');
insert into july.patients values('E','OUT','2022-08-24 16:00:00');
*/
/* Q.) WAQ to find names of patient who are in the hospital at end of the day. */
with recursive cte as (
	select name, status,
	substr(timestamp,0,11) as date,
	row_number() over(partition by substr(timestamp,0,11),name order by timestamp desc) as rnk
	from july.patients
)
select date,group_concat(name) as Patients_in from cte
where rnk=1 and status='IN'
group by date;

/*Q.) WAQ to print names of employees as a pair who live in same city. */
/* (The ask here is to map employees 1:1) */
create table july.emp( eid int, name varchar(20), phone varchar(20), city varchar(20), zipcode int);

insert into july.emp values(1,'A',123,'Pune',411);
insert into july.emp values(2,'B',456,'Mumbai',410);
insert into july.emp values(3,'C',789,'Pune',411);
insert into july.emp values(4,'D',120,'Pune',411);
insert into july.emp values(5,'E',121,'Indore',412);
insert into july.emp values(6,'F',100,'Mumbai',410);
insert into july.emp values(7,'G',101,'Pune',411);
insert into july.emp values(8,'H',102,'Indore',412);

select e1.city, e1.name, e2.name from july.emp e1
INNER JOIN july.emp e2 
ON e1.eid<e2.eid and e1.city=e2.city;

/* Q.) Why bucketing is beneficial in Hive ?  */
/* Q.) Why partitioning is beneficial in Hive ?  */
/* Q.) What type of queries does bucketing & partitioning help in optimization ?  */
/* Q.) Differences between Pandas DF and Spark DF.  */
/* Q.) Explain step wise execution of a spark job which reads data from Hive table and writes back to another hive table/HDFS location.  */
/* Q.) ORC vs Parquet (How data is stored, & which is suitable for Hive & Spark?)  */
/* Q.) What are steps you follow while performing EDA ?  */