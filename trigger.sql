use DB_Programming


-- create a Table
create Table Employees
(
	Employee_Id int identity(10,1) primary key,
	Employee_Name varchar(Max),
	Mobile bigint,
	Email varchar(200),
	Address varchar(Max),
	Gender char,
	Department varchar(Max)
);

-- create a Audit Table
create table EmployeeAudit
(
	Id int,
	Inserted_By varchar(Max),
	Audit_Data varchar(Max)
);

/*--- Create Trigger for Insert ---*/
Create Trigger Trg_Insert_Employees
on Employees
For Insert
As
Begin
	Declare @Id int
	select @Id = Employee_Id from inserted
	Insert into EmployeeAudit (Id,Inserted_By,Audit_Data)
	values(@Id, ORIGINAL_LOGIN(), 
	'New Employee with Employee Id ='+ CAST(@Id as nvarchar(5))+ ' is added at '+ CAST(GETDATE() as nvarchar(20)))
End;

Insert Into Employees values('john',78563342378,'john4115@gmail.com','bangalore,karnataka', 'M','Software Developer');
select * from EmployeeAudit;
select * from Employees;


/****** Drop a Trigger *********/
DROP TRIGGER IF EXISTS Trg_Insert_Employee;

/****** Trigger For Delete ******/
Create or Alter Trigger Trg_Delete_Employees
on Employees
For Delete
As
Begin
	Declare @Id int
	select @Id = Employee_Id from deleted
	Insert into EmployeeAudit (Id,Inserted_By,Audit_Data)
	values(@Id, ORIGINAL_LOGIN(), 
	'Employee with Employee Id ='+ CAST(@Id as nvarchar(5))+ ' is Deleted at '+ CAST(GETDATE() as nvarchar(20)))
End;

Delete from Employees where Employee_Id = 11;
select * from EmployeeAudit;
select * from Employees;

/****** Trigger No Delete Permission ******/
Create or Alter Trigger Trg_NoDelete_Employees
on Employees
For Delete
As
Begin
	rollback
	print '==================================';
	print 'You do not have permission to delete';
	print '==================================';
End;

/****** Trigger For Update ******/
-- Basic Update Trigger
Create or Alter Trigger Trg_Update_Employees
on Employees
For Update
As
Begin
	select * from deleted;
	select * from inserted;
End;

select * from EmployeeAudit;
select * from Employees
update Employees set Employee_Name = 'Naveen Mabbu' where Employee_Id = 11;