use it;
/*
create table SwappingTwoColumnsValueDemo (
	FirstColumnValue int,
	SecondColumnValue int
);

insert into SwappingTwoColumnsValueDemo values(10,20),(30,40),(50,60),(70,80),(90,100);
*/
select *from it.SwappingTwoColumnsValueDemo;

UPDATE SwappingTwoColumnsValueDemo
SET FirstColumnValue = FirstColumnValue+SecondColumnValue, # a = a+b
SecondColumnValue = FirstColumnValue-SecondColumnValue,    # b = a-b
FirstColumnValue = FirstColumnValue-SecondColumnValue;     # a = a-b

UPDATE SwappingTwoColumnsValueDemo
SET SecondColumnValue = SecondColumnValue + FirstColumnValue, # b = b+a
FirstColumnValue = SecondColumnValue - FirstColumnValue,      # a = b-a
SecondColumnValue = SecondColumnValue - FirstColumnValue;     # b = b-a

