#write a querry to provide the date for nth occurence of sunday in future from the given date
#datepart
#sunday-1
#monday-2
#friday-6
#saturday-7
#ssms
declare @today_date date;
declare @n int;
set @today_date = '2022-01-01'; #saturday
set @n = 3;

#8-7=1 add in today_date

select dateadd(week,@n-1,dateadd(day,8-datepart(weekday,@today_date),@today_date));

#mysql
SET @today_date= date;
SET @n= 1;
set @today_date = '2022-01-01'; #saturday
set @n = 3;
select dateadd(week,@n-1,dateadd(day,8-datepart(weekday,@today_date),@today_date));

