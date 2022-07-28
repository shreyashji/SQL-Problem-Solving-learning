create table it.AlljoinsA (
	cola int
);

create table it.AlljoinsB (
	colb int
);

insert into it.AlljoinsA values (1);
insert into it.AlljoinsA values (1);
insert into it.AlljoinsA values (1);
insert into it.AlljoinsA values (2);
insert into it.AlljoinsA values (null);
insert into it.AlljoinsA values (3);
insert into it.AlljoinsA values (3);

insert into it.AlljoinsB values (1);
insert into it.AlljoinsB values (1);
insert into it.AlljoinsB values (NULL);
insert into it.AlljoinsB values (4);
insert into it.AlljoinsB values (4);

SELECT * FROM it.AlljoinsA;
SELECT * FROM it.AlljoinsB;

#inner join - 6 rows
SELECT * FROM it.AlljoinsA AS A
INNER JOIN it.AlljoinsB AS B ON 
A.cola = B.colb;

#Left join - 10
SELECT * FROM it.AlljoinsA AS A
LEFT JOIN it.AlljoinsB AS B ON 
A.cola = B.colb;

#Right join - 9
SELECT * FROM it.AlljoinsA AS A
RIGHT JOIN it.AlljoinsB AS B ON 
A.cola = B.colb;

#Outer join- 13
SELECT * FROM it.AlljoinsA AS A
LEFT JOIN it.AlljoinsB AS B ON 
A.cola = B.colb
UNION ALL
SELECT * FROM it.AlljoinsA AS A
RIGHT JOIN it.AlljoinsB AS B ON 
A.cola = B.colb
WHERE A.cola IS NULL

#Inner join - 6 records(3 1's from the left table * 2 1's from the right table)
#Left join - 10 records(3 1's from the left table * 2 1's from the right table,2,3,null)
#Right join - 9 records(2 1's from the right table * 3 1's from the left table,null,4,4)
#Full outer join - 13 records(3 1's from the left table * 2 1's from the right table,null,2,3,3,null,4,4)