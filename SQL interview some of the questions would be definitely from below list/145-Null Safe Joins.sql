use it;

create table nullsafeA (
colA int
);

insert into nullsafeA values(1);
insert into nullsafeA values(2);
insert into nullsafeA values(3);
insert into nullsafeA values(4);
insert into nullsafeA values(5);
insert into nullsafeA values(null);
insert into nullsafeA values(NULL);

create table nullsafeB (
colB int
);

insert into nullsafeB values(2);
insert into nullsafeB values(5);
insert into nullsafeB values(null);

SELECT * FROM nullsafeA;
SELECT * FROM nullsafeB;

#If we perform an inner join between these two tables then how many output rows do we expect? 3? 4? 5?
#Inner join provides common values between both the tables and discards the non common rows.
#So, query { select * from tableA inner join tableB on tableA.colA=tableB.colB } will give us 3 rows...

select * from nullsafeA t1 
inner join nullsafeB  T2 
on T1.colA = T2.colB;

#There is no match for NULL? Why?
#NULL looks similar. however, technically, NULL means nothing, it doesn't have any data type or any default value. 
#So, if we have 2 NULLs then one can be of different type and another one can be of different type.

#So, is there a way to handle the NULLs? Is there a way to include NULLs in INNER join? YES YES YES ! 
#there are 2 ways: NULL SAFE JOIN and NULL SAFE OPERATOR (<=>)

#NULL SAFE JOIN
select * from nullsafeA T1
inner join nullsafeB T2
on T1.colA = T2.colB or
(T1.colA is null and T2.colB is null);

#NULL SAFE OPERATOR in mysql
select * from nullsafeA T1
inner join nullsafeB T2 
on T1.colA <=> T2.colB