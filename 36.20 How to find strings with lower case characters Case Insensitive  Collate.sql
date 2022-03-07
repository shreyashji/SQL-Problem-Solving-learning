#How to find departments having only male / female employees
# How to find strings with lower case characters | Case Insensitive | Collate

select upper(FirstName) as uper_first,FirstName  from dbo.Emp 
where upper(FirstName) COLLATE Latin1_Genral_CS_AS != FirstName;

select SERVERPROPERTY('Collation')# CI MEANS CASE SENSITIVE

