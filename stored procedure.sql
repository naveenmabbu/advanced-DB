/---- Create Database ----/
create database Sales

/---- Use Database ----/
use Sales

/---- Create Table in Database ----/
Create table Customer
(
        Customer_Id int Identity(10,1) Primary key,
        Customer_Name varchar(255),
        Customer_Mobile bigint,
        Address varchar(255),
        City varchar(255),
        Postal_Code bigint,
        Country varchar(255),
        Gender char null Default 'M'
);

/---- Insert some dummy data in Table ----/
insert into Customer 
values ('Jack', 2323121, 'belgaum', 'belgaum', 9009009008,'India', 'M'),
('Rock', 1234569, 'Bangalore', 'Bangalore', 987654321,'India', 'M'),
('Hema', 2345679, 'Mumbai', 'Mumbai',8765432109,'India', 'F'),
('Khali', 3456789, 'Chennai', 'Chennai', 7654321098, 'India', 'M'),
('Rekha', 45678909, 'Delhi', 'Delhi', 6543210987, 'India', 'F');

/---- Querying data from Table using Select keyword and Where Clause----/
select * from Customer
select Customer_Name From Customer
select distinct Country from Customer;
select * from Customer where Country = 'India';

/---- Sorting data from Table using Select keyword and order by Clause----/
select * from Customer order by City Asc;


/---- Create a backup of Existing Table by Select Into ----/
select * into CustomerBackup from Customer;
/---- Check Backup table Records ----/
select * from CustomerBackup;
/---- Remove a table or Database using Drop ----/
drop table CustomerBackup

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                    
		                                                   ----------------stored procedure-------------

CREATE PROCEDURE SelectAllCity
AS                                                  -----Section 1------

SelectAllCity                   ---Any keyword Can use--
exec SelectAllCity            ----
------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
create table EmpDetails
(                                                 -----storedProcedure with parameters----
    EmployeeID int identity(1,1) primary key,
    FirstName  varchar(255),
    LastName varchar(255),
    Address varchar(255),
    City varchar(255),
    MobileNo varchar(13),
	Gender varchar(6),
	Salary money not null
 
);
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
------------------------------Create And Insert By StoresProcedure-------------------------------------


create procedure SPEmployee   
(   
    @FirstName varchar(255),
    @LastName varchar(255),
    @Address varchar(255),
    @City varchar(255),
	@MobileNo varchar(13),
	@Gender varchar(6),
	@Salary int
)   
as    
Begin    
    Insert into EmpDetails (FirstName,LastName,Address,City,MobileNo,Gender,salary)    
    Values 
			(@FirstName,@LastName,@Address,@City,@MobileNo,@Gender,@Salary) 
	 
End
SELECT * FROM EmpDetails
EXEC SPEmployee @FirstName = '@FirstName',@LastName = '@LasteName',@Address='@Address',@City ='@City',@MobileNo = '@MobileNo',@Gender = '@Gender',@Salary='@Salary'


-----------------------------------------------------------------------------------------------------------
create procedure GetAllEntries  
as   
Begin                       -----------------------it defines A Block where We execute SQL statement-----------
select
	
    FirstName,
    LastName,
    Address,
    City,
	MobileNo,
	Gender

 from  EmpDetails
End                  

exec GetAllEntries;
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------------------------------Update Table Using StoredProcedure ------------------------------------------------------

create procedure UpdateEmployee     
(     
     @salary money   
)     
as     
begin     
   Update EmpDetails      
   set                            -------------Assign Value we use SET------------
	   Salary=@salary  
	   where EmployeeID= 11
End

UpdateEmployee  @salary='39145'

SELECT * FROM EmpDetails


---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------Delete Rows Using StoredProcedure---------------------------------------

Create procedure DeleteEmployee
(     
  @EmployeeID int     
)     
as     
begin     
   Delete from EmpDetails where EmployeeID=@EmployeeID

End
DeleteEmployee @EmployeeID=10

SELECT * FROM EmpDetails

select City, COUNT (*) from EmpDetails WHERE Address='us' GROUP BY Gender ORDER BY Gender;

------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
Declare
 @FirstName varchar(100)                          ---------------Declare valriables---------
 
 set @FirstName = 'naveen'
 select 
  FirstName,
  LastName,
  City
From EmpDetails where @FirstName= FirstName--,@LastName = LastName
order by LastName


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
