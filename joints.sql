
create database DB_Programming
use DB_Programming
-------------INNER JOIN------
CREATE SCHEMA SR;            ----created schema--
GO


CREATE TABLE SR.candidates(
    id INT PRIMARY KEY IDENTITY,                     -------------Creating Table------------
    FullName VARCHAR(100) NOT NULL
);

CREATE TABLE SR.employees(
    id INT PRIMARY KEY IDENTITY,                     -------------Creating Second------------
    FullName VARCHAR(100) NOT NULL
);


INSERT INTO                                    ----------------Inserting value into candidates table---------
    SR.candidates(FullName)
VALUES
    ('sam Karan'),            
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');
	                                       select * from  SR.candidates

INSERT INTO                               --------------Inserting value into candidates table------------
    SR.employees(FullName)
VALUES
    ('sam Karan'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
	                                           select * from  SR.employees

	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making InnerJoin------------
FROM 
    SR.candidates c
    INNER JOIN SR.employees e 
        ON e.FullName = c.FullName;


------------------Left Join----------------

	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making LeftJoin------------
FROM 
    SR.candidates c
    Left JOIN SR.employees e 
        ON e.FullName = c.FullName;

------------------Right Join----------------
	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making RightJoin------------
FROM 
    SR.candidates c
    Right JOIN SR.employees e 
        ON e.FullName = c.FullName;



------------------Full Join----------------
	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making FullJoin------------
FROM 
    SR.candidates c
    Full JOIN SR.employees e 
        ON e.FullName = c.FullName;