#ssms

declare @strings as varchar(50) = 'yes,no,yes,yes,no,yes';
set @rep as varchar(50) = 'yes';

SELECT (len(@strings)-len(replace(@strings,@var,''))) /len(@rep);

select case when @var < 100 then 1
when @var > 90 then 2 
END AS VAL1
