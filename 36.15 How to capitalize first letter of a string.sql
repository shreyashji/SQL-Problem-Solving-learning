# How to capitalize first letter of a string
select firstName from dbo.emp;
#ssms 
Select  lower(LEFT(FirstName, 1))
from dbo.Emp;

# combine with above with remaining string #ssms  only

Select  FirstName, lower(LEFT(FirstName, 1)) + SUBSTRING(FirstName, 2, len(FirstName)) as Name 
from dbo.Emp;



