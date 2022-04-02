#declare @var char(50) = 'abc,,def,,,,,,,,ghi,jkl,,,,,mno';
#above is for ssms

SET @var = 'abc,,def,,,,,,,,ghi,jkl,,,,,mno';
#select replace(@var,  ',' , '*,') ;#every comma with * comma
#select replace(replace(@var,  ',' , '*,'), ',*','');
select replace(replace(replace(@var,  ',' , '*,'), ',*',''), '*,', ',') as ans; 