use july;

create table july.logs(
	id integer ,
    num varchar(50),
    PRIMARY KEY(id)
);
/*
insert into july.logs values(1,'1');
insert into july.logs values(2,'1');
insert into july.logs values(3,'1');
insert into july.logs values(4,'2');
insert into july.logs values(5,'1');
insert into july.logs values(6,'2');
insert into july.logs values(7,'2');
*/
#DROP TABLE july.logs;
SELECT * FROM july.logs;

/* Write your T-SQL query statement below */
SELECT distinct l1.num as ConsecutiveNums FROM july.logs l1
JOIN logs l2 on l1.id = l2.id+1 and l1.num = l2.num
JOIN logs l3 on l1.id = l3.id+2 and l1.num = l3.num;

WITH recursive NUM_CTE AS (
SELECT 
	id,num,LAG(NUM) OVER(ORDER BY ID) AS LAG_NUM,
	LEAD(NUM) OVER(ORDER BY ID) AS LEAD_NUM
FROM july.logs
)
SELECT num FROM NUM_CTE 
where num = LAG_NUM
AND num = LEAD_NUM;

#if n consecutive
WITH recursive NUMS_CTE AS (
	SELECT ID,NUM,
	#row_number() OVER(ORDER BY ID) AS RN_ID,
	#row_number() OVER(PARTITION BY NUM ORDER BY ID) AS RN_NUM,
	(row_number() OVER(ORDER BY ID)  - row_number() OVER(PARTITION BY NUM ORDER BY ID)) AS FINAL_GRP
	FROM july.logs
)
SELECT NUM,COUNT(*) as number_appears_n_times FROM NUMS_CTE GROUP BY FINAL_GRP,NUM;