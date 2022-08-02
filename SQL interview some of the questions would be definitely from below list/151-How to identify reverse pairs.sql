#How to identify reverse pairs
DROP TABLE july.reverse_pairs ;
use july;
create table july.reverse_pairs(
	X int,
	Y int
);
insert into july.reverse_pairs values(1,2);
insert into july.reverse_pairs values(1,4);
insert into july.reverse_pairs values(4,2);
insert into july.reverse_pairs values(2,4);
insert into july.reverse_pairs values(3,3);
insert into july.reverse_pairs values(3,0);

SELECT * FROM july.reverse_pairs;

select A.X, A.Y
from july.reverse_pairs as A
INNER join july.reverse_pairs  as B on A.X = B.Y AND B.X = A.Y AND A.X < A.Y