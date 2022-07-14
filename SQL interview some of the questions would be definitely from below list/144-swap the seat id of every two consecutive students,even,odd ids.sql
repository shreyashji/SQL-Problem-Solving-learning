use it;


/*create table seat (
id int,
student varchar(20)
);

insert into seat values (1,'Abbot');
insert into seat values (2,'Dorris');
insert into seat values (3,'Emmerson');
insert into seat values (4,'Green');
insert into seat values (5,'James');
*/

SELECT * FROM seat ;
#WRITE AN sql query to swap the seat id of every two consecutive students,if the numbers of studnets is odd,
#the id of last student is not swapped

SELECT * FROM
(SELECT id+1 AS id,student from Seat where id%2=1 and id not in (SELECT MAX(id) FROM Seat) #odd
UNION 
SELECT id-1 AS id,student from seat where id%2=0 #even
UNION
SELECT id,student from seat where id%2=1 AND id IN (SELECT MAX(id) FROM Seat) 
) AS s 
ORDER BY id;

SELECT (CASE WHEN ( id%2=1) AND id = (SELECT MAX(id) FROM seat) THEN id #odd, & last id
WHEN id%2=1 THEN  id+1  #odd
ELSE id-1 #even
end ) 
AS id,student from Seat order by id;
