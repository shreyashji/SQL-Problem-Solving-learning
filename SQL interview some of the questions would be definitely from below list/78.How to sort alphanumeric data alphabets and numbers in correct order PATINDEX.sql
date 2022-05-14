#create table pattindex (
id varchar(20)
)

#drop table pattindex

insert into pattindex values('alpha2');

select * from pattindex 
order by left(id,patindex('%[0-9]%',id)-1),
convert(Int,substring(id,patindex('%[0-9]%',id) , Len(ID)))