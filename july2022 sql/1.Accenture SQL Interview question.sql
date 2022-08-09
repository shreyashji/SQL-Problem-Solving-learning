---- #Question--1 :How to replace multiple comma from below input by single comma

declare @input varchar(100)='abc,,,dddd,,,,,,dde,,2lmdl3emf,cewec,,,,,'

select @input,REPLACE(@input,',','.,'),replace(REPLACE(@input,',','.,'),',.',''),
  replace(replace(REPLACE(@input,',','.,'),',.',''),'.,',',')

------Question--2 : 
declare @source table(id int)
declare @dest table(id int)

insert @source values (1),(1)
select * from @source

Merge @dest as D
  Using @Source as S
  On  s.id=d.id
      When Matched Then 
     Update    Set   d.id=s.id
              When  Not Matched by Target then
  Insert   (id) Values (s.id);

select * from @dest

-------# Question--3 : write a query to get ocurrence of 'S' character in below string
declare  @NAME varchar(100) = 'SS UNITECH'
SELECT  @NAME
SELECT LEN('SS UNITECH')-LEN(REPLACE('SS UNITECH','S',''))
 
-------# Question--4 : write a query to get the attendecne count
DECLARE @ATT TABLE (EMP INT,DATEPRESENT VARCHAR(50))
INSERT @ATT VALUES (1,'1,2,3'),(2,'2,4,5,6'),(3,'1,2,5,4,7,9')

SELECT *,LEN(DATEPRESENT)-LEN(REPLACE(DATEPRESENT,',','') )+1
FROM @ATT  

-------# Question--5 : how to write update query to swap column values

DECLARE @TBL TABLE(ID VARCHAR(100),NAME VARCHAR(100))
INSERT @TBL VALUES(1,'AA'),(2,'BB'),(3,'CC')

SELECT * FROM @TBL 

UPDATE @TBL
SET ID=NAME,NAME=ID

SELECT * FROM @TBL


-------Question--6
DECLARE @I INT=100

;WITH CTE AS
(SELECT 1 AS ID
 UNION ALL
 SELECT ID+1
 FROM CTE
 WHERE ID<@I
)
SELECT * FROM CTE