#How to generate match schedule for list of countries | Match one row with all other rows
#create table countries (
#countryname varchar(20)
#);
#dont match o the same values
#insert into countries values('NewZealand'); #,'Australia','England','NewZealand')
select * from countries a 
inner join Countries b
on a.countryname<b.countryname #it will eliminate one of the duplicate alpbabeticall les than b.countryname

