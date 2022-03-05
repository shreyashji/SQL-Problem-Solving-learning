#contains only alphanumeric values,% 0 or more char,range in brackets,1 plahabet & 1 numeric value
select distinct column_name from table_name
where  column_name is not null and column_name like '%[a-z0-9]'
#^other than specified in range 
select distinct column_name from table_name
where  column_name is not null and column_name like '%[^a-z0-9]' 

#contains only alphnumeric values
select distinct column_name from table_name
where  column_name is not null and column_name not like '%[^a-z0-9]' 

#which have spaces
select distinct column_name from table_name
where  column_name is not null and column_name like '%[^a-z0-9 ]' 

#which have hiphen
select distinct column_name from table_name
where  column_name is not null and column_name like '%[^a-z0-9()-]' 

#which have hiphen & forward slash
select distinct column_name from table_name
where  column_name is not null and column_name like '%[^a-z0-9()/-]' 