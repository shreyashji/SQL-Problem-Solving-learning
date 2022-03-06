#Difference between Count(*), Count(1), Count(colname) 
#I have seen/heard select count(*) from tableA returns count of all rows in table regardless of whether a row has all null or some null values,
#on the other hard select count(columnA) from tableA returns the number of records that do not have null in columnA. 
#But what if we use a group by? I have seen no info on this. are they equivalent?
select COUNT(*) from dbo.Emp;
select COUNT(1) from dbo.Emp;
#above both are same,in backend same execution plan is genrated for both

#if null is there then it does not count,it will count not null values in that column
select COUNT(lastname) from dbo.Emp; 