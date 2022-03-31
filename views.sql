use DB_Programming

--Select query
SELECT
    product_name,  
    price
FROM
	product p
INNER JOIN Customer c 
        ON c.Customer_Id = p.Product_id;

/*---- Create View for Select Query ----*/
CREATE VIEW product_info
AS
SELECT
    product_name,  
    price
FROM
	product p
INNER JOIN Customer c 
        ON c.Customer_Id = p.Product_id;

--Get Records using View
SELECT * FROM product_info;

/*---- Modify View for Select Query ----*/
CREATE or ALTER VIEW product_info
AS
SELECT
	Customer_Name,
    product_name,  
    price
FROM
	product p
INNER JOIN Customer c 
        ON c.Customer_Id = p.Product_id;

/*----- Rename A view -----*/
EXEC sp_rename 
    @objname = 'product_info',
    @newname = 'product_list';
SELECT * FROM product_list;


/*----- Drop A view Information -----*/
CREATE VIEW product_Detail
AS
SELECT
    product_name,  
    price
FROM
	product p
INNER JOIN Customer c 
        ON c.Customer_Id = p.Product_id;

--- Drop view
DROP VIEW IF EXISTS product_Detail;