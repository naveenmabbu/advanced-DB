
create database DB_Programming
use DB_Programming

/*---- Create Table in Database ----*/
Create table Customer
(
	Customer_Id int Identity(10,1) Primary key,
	Customer_Name varchar(255),
	Customer_Mobile bigint,
	Address varchar(255),
	City varchar(255),
	Postal_Code bigint,
	Country varchar(255),
	Gender Char null Default 'M'
	
);

/*---- Insert some dummy data in Table ----*/
insert into Customer 
values ('john', 2323121, 'newyork', 'newyork', 742374,'India', 'M'),
('joe', 56778899, 'california', 'california', 56466,'USA', 'M'),
('rashmi', 242344, 'London', 'London',677756,'UK', 'F'),
('marshall', 23234345, 'kathmandu', 'kathmandu', 688866, 'Nepal', 'M'),
('bella', 5676577, 'bangalore', 'bangalore', 456577, 'India', 'F');

/*---- Alter existing Table add new Column ----*/

select * from Customer
select Customer_Name From Customer
select distinct Country from Customer;
select * from Customer where Country = 'India';

create table product
(
 Product_id int identity(10,1) primary key,
 Product_name varchar(255) not null,
 Price decimal not null,
 Discount decimal not null,
 NetPay decimal not null,
 Customer_Id int FOREIGN KEY REFERENCES Customer(Customer_Id) on delete no action
);

drop table product;
Insert into product
values('samsung s10', 35000.00, 5000, 30000.00, 12),
('dell s10', 45000.00, 2000, 43000.00, 13),
('Redmi k20', 20000.00, 1000, 19000.00, 14),
('Iphone 13', 85000.00, 3000, 82000.00, 11);

select * from product;

select Customer_Name, Product_Name, NetPay
from Customer c
Inner Join product p
on c.Customer_Id = p.Product_id
order by Customer_Name Asc;

select Customer_Name, Product_Name
from Customer c
Inner Join product p
on c.Customer_Id = p.Product_id
order by Customer_Name Desc;

select Customer_Name, Product_Name
from Customer c
Join product p
on c.Customer_Id = p.Product_id
order by Customer_Name Asc;

select *
from Customer c
Join product p
on c.Customer_Id = p.Product_id
order by Customer_Name Asc;

select *
from Customer c
Join product p
on c.Customer_Id > p.Product_id
order by Customer_Name Asc;


/*----- Implement Left Join ------*/
select *
from Customer c
Left Join product p
on c.Customer_Id = p.Product_id

select Customer_Name, Product_Name
from Customer c
Left Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Desc;

select Customer_Name, Product_Name
from Customer c
Left Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Asc;

/*----- Implement Right Join ------*/
select Customer_Name, Product_Name
from Customer c
Right Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Asc;

select Customer_Name, Product_Name
from Customer c
Right Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Desc;

select *
from Customer c
Right Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Desc;

/*----- Implement Full outer Join ------*/
select *
from Customer c
Full outer Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Desc;

select Customer_Name, Product_Name
from Customer c
Full Join Product p
on c.Customer_Id = p.Product_Id
order by Customer_Name Asc;

select *
from Customer c
Full Join Product p
on c.Customer_Id = p.Product_Id;


/*----- Implement Cross Join ------*/
select *
from Customer c
Cross Join Product p;

select Customer_Name, Customer_Mobile, Product_name, Price ,Discount, NetPay
from Customer c
Cross join product p
order by Customer_Name Asc;