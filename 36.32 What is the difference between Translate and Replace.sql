#What is the difference between Translate and Replace

#TRANSLATE(INPUT,CHARACTER,TRANSLATIONS) -works by replacing char,repalce char,need to specify equal no. of characters
#replace (string_expression,string_pattern,string_replacement) -replaces entire string,replace string,can also replace a string of varying length
select TRANSLATE('xxx1234567891zzz','123456789','abcdefghi');
#1-a,2-b,3-c,4-d,e-5,f-6,g-7,h-8,i-9,1-a
select replace('1234567891','123456789','abcdefghi');

select replace('1234567891','123456789','a');