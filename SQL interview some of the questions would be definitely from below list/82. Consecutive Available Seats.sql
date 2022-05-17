/*
Create table If Not Exists Cinema (seat_id int primary key auto_increment, free bool);
#Truncate table Cinema;
insert into Cinema values (1, 1);
insert into Cinema values (2, 0);
insert into Cinema values (3, 1);
insert into Cinema values (4, 1);
insert into Cinema values (5, 1);
*/
/*
Write an SQL query to report all the consecutive available seats in the cinema.
Return the result table ordered by seat_id in ascending order.
*/
select * from Cinema;
SELECT 
	c1.seat_id,c1.free,c2.seat_id,c2.free
FROM cinema AS c1
INNER JOIN cinema AS c2
ON (c1.seat_id  = c2.seat_id + 1 )  or (c1.seat_id  = c2.seat_id - 1)
WHERE c1.free = 1 and c2.free = c1.free;


SELECT distinct
	c1.seat_id
FROM cinema AS c1
INNER JOIN cinema AS c2
ON (c1.seat_id  = c2.seat_id + 1 )  or (c1.seat_id  = c2.seat_id - 1)
WHERE c1.free = 1 and c2.free = c1.free
ORDER BY c1.seat_id asc;

/*other way*/

SELECT distinct
	c1.seat_id
FROM cinema AS c1
INNER JOIN cinema AS c2
ON abs(c1.seat_id  - c2.seat_id) =1
WHERE c1.free = 1 and c2.free = c1.free
ORDER BY c1.seat_id asc;