use it;
create table brands 
(
category varchar(20),
brand_name varchar(20)
);
insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');

#WRITE A SQL QUERY TO POPULATE categroy value to the last null value
SELECT * FROM brands;

WITH recursive CTE1 AS (
	SELECT *,
	ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn
	FROM brands
),
CTE2 AS (
	SELECT *,
	LEAD(rn,1) OVER(ORDER BY rn) AS next_rn
	FROM CTE1 WHERE category IS NOT NULL
)
SELECT CTE2.category,CTE1.brand_name FROM CTE1 INNER JOIN CTE2
 ON CTE1.rn >= CTE2.RN AND  (CTE2.rn <= CTE2.next_rn-1 OR CTE2.next_rn IS NULL);
