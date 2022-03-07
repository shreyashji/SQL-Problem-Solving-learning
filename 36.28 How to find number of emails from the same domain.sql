#How to find number of emails from the same domain

select * from entries;
#extract domian from charindex ,get position of occurence of '@'
select CharIndex('@',email),email from entries;

#extract the string after @,total length of string - first 6 char
select right(email,len(email)- CharIndex('@',email)) from entries;

#How to find number of emails from the same domain
select count(*) , right(email,len(email)- CharIndex('@',email)) from entries
group by right(email,len(email)- CharIndex('@',email));
