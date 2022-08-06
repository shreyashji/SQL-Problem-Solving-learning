#JPMorgan Chase SQL Interview Questions 

#1 what is magic table? how can we access magic table : TRIGGER CONCEPT


#2. How can we prevalidate the parameter of stored procedure
Alter Proc TestEnglishEducation (@EnglishEducation varchar(100) )
AS
BEGIN

SELECT * FROM DimCustomer WHERE EnglishEducation = @EnglishEducation

END
GO

EXEC TestEnglishEducation @EnglishEducation = 'Partial College'

SELECT * FROM DimCustomer

#3 .WE HAVE SOME TEXT INSERT IN COLUMN With underscore(_). write a sql query to split it into  two different column
#example : input : 'jpmorgan_chase'
# column1  column 2
# jpmorgan chase

DECLARE @A varchar(100)
SET @A = 'jpmorgan_chase'
SELECT SUBSTRING(@A,0,CHARINDEX('_',@A) )
SELECT SUBSTRING(@A,0,CHARINDEX('_',@A)+1,LEN(@A) )
