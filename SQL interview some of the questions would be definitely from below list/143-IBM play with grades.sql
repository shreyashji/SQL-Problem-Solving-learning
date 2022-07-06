use it;
create table grades (
	grade int,
    min_marks int,
    max_marks int
);

insert into grades values (1,0,9);
insert into grades values (2,10,19);
insert into grades values (3,20,29);
insert into grades values (4,30,39);
insert into grades values (5,40,49);
insert into grades values (6,50,59);
insert into grades values (7,60,69);
insert into grades values (8,70,79);
insert into grades values (9,80,89);
insert into grades values (10,90,100);

create table stdents (
	id int,
    namme varchar(30),
    marks int
);

insert into stdents values (1,'Julia',88);
insert into stdents values (2,'Samntha',68);
insert into stdents values (3,'Julia',99);
insert into stdents values (4,'Scarlet',78);
insert into stdents values (5,'Ashley',63);
insert into stdents values (6,'jane',81);

SELECT * FROM grades;
SELECT * FROM stdents;

#Katie gave eve a task to generate areport containing 3 columns name,grade,mark.katie doesnt want the names of
#those students whose grade lower than 8,the report must be in decesnding order by grade,if there is more than one student
#with the same grade (8-10) assigned to them,order those students by their name alphabetically

#1.finaly if grade lower than 8 ,use 'null' as their name and list them by their grades in descending order
#2. if there is more than one studnet in with the same grade (1-7) assign to them order those particular students by their marks
# in ascendig 

use it;
SELECT IF(grade<8,null, namme),grade,marks FROM stdents
join grades 
where marks between min_marks and max_marks
order by grade desc, namme asc, marks asc;
 
SELECT (CASE WHEN g.grade > 7 THEN s.namme WHEN g.grade < 7 THEN NULL END) AS 'Name', g.grade,s.MARKS
FROM stdents s
INNER JOIN grades g 
ON S.marks between g.min_marks and max_marks
order by  g.grade desc,s.namme asc;