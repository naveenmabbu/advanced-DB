use DB_Programming
select * from Marks
create Table Marks
( 
   Marks_Science int,
   Marks_Math int,
   Marks_English int
)
/*First create trigger for insert*/

create trigger MarkTrigger on Marks
after insert                                     -------------use for or after any both are same---------
as
declare @Marks_science int
declare @Marks_Math int                             -------------Declaring the variable------
declare @Marks_English int

select @Marks_science=Marks_science from inserted           ----------use for insert into table-------
select @Marks_Math=Marks_Math from inserted
select @Marks_English=Marks_English from inserted

if @Marks_science < 60
begin
print 'Student Marks Must be Greater than 60 in Science'
rollback
end
if @Marks_Math < 60
begin
print 'Student Marks Must be Greater than 60 in Math'
rollback
end
if @Marks_English < 60
begin
print 'Student Marks Must be Greater than 60 in English'
rollback
end
else
begin
print 'Student Enrollment Successfull'
end

select * from Marks

insert into Marks(Marks_science,Marks_Math,Marks_English)
values(60,91,69)

------------------------------=======================================-------------------------------------
----------------=============trigger for delete row=====================-----------------------------------

create Table Mark
( 
   Marks_Science int,
   Marks_Math int,
   Marks_English int
)
 trigger DeleteTrigger on Marks
for delete
as
declare @Marks_science int
declare @Marks_Math int                             -------------Declaring the variable------
declare @Marks_English int

select @Marks_science=Marks_science from deleted           ----------use for insert into table-------
select @Marks_Math=Marks_Math from deleted
select @Marks_English=Marks_English from deleted

insert into mark(Marks_science,Marks_Math,Marks_English)       -------creating new table and inserted into table----  
values(@Marks_science,@Marks_Math,@Marks_English)
print 'Students Mark inserted Successfull'



select * from Marks
select * from mark

delete from Marks where Marks_science=70
