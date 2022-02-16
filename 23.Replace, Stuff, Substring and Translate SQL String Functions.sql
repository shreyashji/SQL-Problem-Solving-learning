select * from dept;
#Replace, Stuff, Substring and Translate | SQL String Functions 
#insert into dept values (400,'Text Analytics');
#stuff(col,1st char,length,insert char)
#ssms
select * 
,replace(dep_name,'Analytics','Mining') as replace_string
,stuff(dep_name,1,3,'demo') as stuff_string
from dept;

#substring function
select * 
,replace(dep_name,'Analytics','Mining') as replace_string
,insert(dep_name,1,3,'demo') as stuff_string
,substring(dep_name,2,3) as substring_string
from dept;

#(SSMS)translate function ,ONE TO ONE MAPPING
select * 
,replace(dep_name,'Analytics','Mining') as replace_string
,insert(dep_name,1,3,'demo') as stuff_string
,substring(dep_name,2,3) as substring_string
,translate(dep_name,'AR','ST') as Translate_string
from dept;

