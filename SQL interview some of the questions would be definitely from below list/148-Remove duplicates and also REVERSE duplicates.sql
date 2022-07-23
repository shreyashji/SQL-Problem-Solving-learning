
#Remove duplicates and also REVERSE duplicates.
use it;
create table Remove_reverse(
	colA varchar(20),
	colB varchar(20)
);
insert into Remove_reverse values('Bob', 'Bob');
insert into Remove_reverse values('Bob', 'Joe');
insert into Remove_reverse values('Joe', 'Bob');
insert into Remove_reverse values('Joe', 'Joe');

SELECT * FROM Remove_reverse;

select R.colA, f.colB
from Remove_reverse as R
join Remove_reverse  as f on R.colA = f.colA and R.colB < f.colB

