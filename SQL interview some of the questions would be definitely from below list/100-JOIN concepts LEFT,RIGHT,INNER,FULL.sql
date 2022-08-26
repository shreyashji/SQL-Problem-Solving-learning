
use it;
create table one(x int);
create table two(y int);

insert into one values(9),(8),(null);
insert into two values(9),(9),(null);

SELECT * FROM one; 
SELECT * FROM two;

#INNER JOIN ,2 combination of inner join 9 avialbale ,8 is not present ,no comparison between nulls(ignored)
SELECT x,y FROM one A
INNER JOIN two B
on A.x = B.y;

#left join MATCHING RECORD FROM BOTH table ,also have non matching record from left table
SELECT x,y FROM one A
LEFT JOIN two B
on A.x = B.y;

#Right join MATCHING RECORD FROM BOTH table ,also have non matching record from right table
SELECT x,y FROM one A
RIGHT JOIN two B
on A.x = B.y;

#full join matching record from both table +non matching record from left & right table
SELECT x,y FROM one A
left JOIN two B
on A.x = B.y
UNION 
SELECT x,y FROM one A
RIGHT JOIN two B
on A.x = B.y;

#cross join : cartesian product n*m
SELECT x,y FROM one A
cross JOIN two B
on A.x = B.y;