Create Table gendersort
(
Name varchar(10),
Age int,
Gender varchar(10)
);

Insert Into gendersort Values('A', 30, 'M'),('B', 20, 'M'),('C', 50, 'M'),('D', 40, 'M'),('E', 10, 'M'),('G', 20, 'F'),('H', 10, 'F'),('I', 30, 'F'),('J', 50, 'F'),('K', 20, 'F')

Select * From gendersort
Order By Case When Gender = 'M' Then Age End Asc,
Case When Gender = 'F' Then Age End Desc