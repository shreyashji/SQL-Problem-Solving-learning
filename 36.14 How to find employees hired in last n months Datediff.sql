CREATE TABLE dbo.Emp(
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	HireDate date NULL 
);
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Alice',	'Ciccu','2021-01-07');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Paula',	'Barreto de Mattos','2021-01-06');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Alejandro',	'McGuel','2020-12-06');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Kendall',	'Keil',	'2020-11-05');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Ivo',	'Salmre','2020-10-04');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Paul',	'Komosinski','2020-08-04');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Ashvini',	'Sharma','2020-07-04');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Zheng',	'Mu','2020-04-03');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Stuart',	'Munson','2019-11-02');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('Greg',	'Alderson','2019-10-02');
#INSERT INTO dbo.Emp (FirstName,LastName,HireDate) VALUES ('David',	'Johnson','2019-01-02');

select * from dbo.emp;
#hired in last 3 moths
select * from dbo.emp
where datediff(MONTH,HireDate,GetDate()) < 3
