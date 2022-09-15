#Find All numbers Appearing Atleast 3 Times
use it;
/*
create table numbers (
	id int,
    num varchar(3)
);
SELECT * FROM numbers;
insert into numbers values (1,'1');
insert into numbers values (2,'2');
insert into numbers values (3,'1');
insert into numbers values (4,'1');
insert into numbers values (5,'1');
insert into numbers values (6,'2');
*/
SELECT * FROM numbers;

SELECT DISTINCT n1.num as Consecutivenum #will give 3 consecutive ones
FROM numbers n1,numbers n2,numbers n3
WHERE n1.id = n2.id-1 AND n2.id = n3.id-1 AND n1.num = n2.num AND n2.num = n3.num;

SELECT DISTINCT * #will give 3 consecutive ones
FROM numbers n1,numbers n2,numbers n3
WHERE n1.id = n2.id-1 AND n2.id = n3.id-1 AND n1.num = n2.num AND n2.num = n3.num;