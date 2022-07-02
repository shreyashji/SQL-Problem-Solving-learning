
use it ;
create table reverse_pairs(A int, B int);
insert into reverse_pairs values(1,2);
insert into reverse_pairs values(3,2);
insert into reverse_pairs values(2,4);
insert into reverse_pairs values(2,1);
insert into reverse_pairs values(5,6);
insert into reverse_pairs values(4,2);

select * from reverse_pairs;

#1-using join operation & where clause
SELECT T1.A,T1.B FROM reverse_pairs T1
LEFT JOIN reverse_pairs T2
ON T1.B = T2.A AND T1.A = T2.B
WHERE T2.A IS NULL OR T1.A IS NULL OR T1.A < T2.A ;

SELECT T1.A,T1.B FROM reverse_pairs T1
LEFT JOIN reverse_pairs T2
ON T1.B = T2.A AND T1.A = T2.B
WHERE T1.A < T2.A OR (T2.A IS NULL OR T2.B IS NULL) ;

#CO-related subquery & not exist
SELECT * FROM reverse_pairs T1 WHERE NOT EXISTS ( SELECT * FROM reverse_pairs AS T2 WHERE 
T1.B = T2.A AND T1.A = T2.B AND T1.A > T2.A )

#2 - USING Exists or not exists 
SELECT T1.A,T1.B FROM reverse_pairs T1 WHERE
NOT EXISTS ( SELECT * FROM reverse_pairs T2 WHERE T1.B = T2.A AND T1.A=T2.B AND T1.A > T2.A);
#1-2 & 2-1 COMPLETELY MATCH WITH T1.B = T2.A AND T1.A=T2.B ,T1.A > T2.A 
#RETURN FALSE NEGATION (TRUE) HAPPEN THIS RECORD WILL GET PICKED
# AT 2-1,2-1 & 1-2 COMPLETELY MATCH WITH T1.B = T2.A AND T1.A=T2.B,  T1.A > T2.A IS TRUE ,NEGATION HAPPEN AS FALSE 
#SO NOT PICKED

#USING LOGIC OF SORTING OR DERIVING A COMMON KEY
SELECT D.A, D.B
FROM (SELECT A, B, ROW_NUMBER() OVER(PARTITION BY (A+B)) row_num  FROM reverse_pairs) D
WHERE D.row_num = 1 OR D.A<D.B;

with recursive t1 as (select * from reverse_pairs n1 where (a,b) in (select b,a from reverse_pairs n2)), 
	 t2 as (select * from reverse_pairs n1 where (a,b) not in (select b,a from reverse_pairs n2)) 
select * from t1 where a<b
union
select * from t2;
