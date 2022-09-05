-- CREATE DB
CREATE DATABASE MatiasDB;

USE MatiasDB;

-- CREATE NEW TABLE
CREATE TABLE dbo.Products(
	ProductID int IDENTITY(1,1) PRIMARY KEY NOT NULL ,
	ProductName varchar(25) NOT NULL,
	PriceMoney money,
	ProductDescription varchar(max)
)
GO -- the keyword "GO" separates statements when more than one statement is submitted in a single batch.

-- INSERT VALUES INTO TABLE
INSERT INTO dbo.Products (ProductName, PriceMoney, ProductDescription)
VALUES 
	('Clamp', 12.48, 'Workbench clamp'),
	('Screwdriver', 12.48, 'Flat Head'),
	('Tire Bar', 12.48, 'Tool for changing tires')
GO


-- UPDATE VALUES IN A TABLE
UPDATE dbo.Products
SET PriceMoney = 7.99
WHERE ProductID = 2
GO

UPDATE dbo.Products
SET PriceMoney = 10.99
WHERE ProductID = 3
GO

-- READ DATA FORM TABLE
SELECT * FROM dbo.Products
GO 

SELECT ProductName, ProductDescription
FROM dbo.Products
WHERE PriceMoney > 10
GO

--CREATE VIEW (Virtual table based on the result-set of a SQL statement, they are stored SELECT statements)
CREATE VIEW View_Name_Prod
AS
SELECT ProductName, PriceMoney
FROM dbo.Products
GO

-- CREATING STORED PROCEDURES
CREATE PROCEDURE pr_names @VarPrice money
	AS
	BEGIN
		-- The print statement returns text to the user
		PRINT 'Products less than ' + CAST(@VarPrice AS VARCHAR);
		-- A second statement starts here
		SELECT ProductName, PriceMoney
		FROM dbo.View_Name_Prod
		WHERE PriceMoney < @VarPrice;
	END
GO

EXECUTE pr_names 10.00
GO

--BACKUP A DATABASE
--FULL BACKUP (including transaction logs) TRY TO BACKUP TO A DIFFERENT DRIVE THAN THE ACTUAL DATABASE. THEN IF YOU GET A DISK CRAHS, YOU WILL NOT LOSE YOUR BACKUP FILE
BACKUP DATABASE MatiasDB
TO DISK = 'C:\backups\MatiasDB.bak'
GO

--DELETE RECORDS FROM TABLE
DELETE FROM dbo.Products
WHERE ProductID = 2
GO

-- DROP TABLE
DROP TABLE dbo.Products
GO

--TRUNCATE TABLE
TRUNCATE TABLE dbo.Products
GO

--DROP DATABASE
DROP DATABASE MatiasDB;

--RESTORE A DATABASE FROM A BACKUP COPY
RESTORE DATABASE MatiasDB
FROM DISK = 'C:\backups\MatiasDB.bak'
GO