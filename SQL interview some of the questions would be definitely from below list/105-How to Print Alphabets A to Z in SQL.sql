
select char(90);
select ASCII('Z');

with recursive alphabet as 
(
select char(ASCII('A')) as letter
union all
select char(ASCII(letter)+1)
from alphabet 
where letter <> 'Z'
)
select * from alphabet;

