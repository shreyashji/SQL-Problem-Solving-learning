use dbo
create table tableA(
id int
);

create table tableB(
id int
);
select * from tableA
INSERT INTO tableA values(null);
select * from tableB
INSERT INTO tableB values(null);
/*
Numbers of rows for 
1. Inner Join  = 11
2. Left Join   = 10
3. Full outer
*/
select * from tableA A left join tableB B
on A.id = B.id ; # 10 rows left

select * from tableA A right join tableB B
on A.id = B.id;  #11 right

select * from tableA A inner join tableB B
on A.id = B.id;  #8 inner join

select * from tableA as A  cross join tableB as B
on A.id = B.id;  #8  cross join 8

/*  814

You don't have full joins in MySQL, but you can sure emulate them. */
SELECT * FROM tableA a
LEFT JOIN tableB as b ON a.id = b.id
UNION
SELECT * FROM tableA a1
RIGHT JOIN tableB as a2 ON a1.id = a2.id