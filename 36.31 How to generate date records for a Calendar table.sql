#How to generate date records for a Calendar table

declare @startdate date = '2020-01-01';
declare @enddate date = '2020-12-31';

with cte_calender as (
select @startdate as [date]
union all
select DATEADD(DD,1,[date])
FROM cte_calender
where DATEADD(DD,1,[date]) <= @enddate )
select [date] from  cte_calender
OPTION (MAXRECURSION 400);