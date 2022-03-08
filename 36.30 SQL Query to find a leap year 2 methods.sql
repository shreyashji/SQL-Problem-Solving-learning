#SQL Query to find a leap year | 2 methods
#leap year
#year divisible by 4 but not by 100
#year divissible by 400
#select cast(@year as char(4))+'0229'  this will give  20210229

declare @year int = 2021;
select cast(@year as char(4))+'0229' ;
#CHECK IF DATE IS VALID 0 NOT VALID
declare @year int = 2021;
select ISDATE(cast(@year as char(4) ) +'0229');

#FINAL
declare @year int = 2021;
select CASE WHEN  ISDATE(cast(@year as char(4) ) +'0229') = 1
THEN 'LEAP YEAR'
ELSE 'NOT A LEAP YEAR'
END

#ANOTHER WAY
declare @year int = 2020;
SELECT case when (@year % 4 = 0 and @year % 100<>0) or @year % 400 = 0 
THEN 'LEAP YEAR'
ELSE 'NOT A LEAP YEAR'
END