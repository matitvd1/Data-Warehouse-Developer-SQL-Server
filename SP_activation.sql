-- ACTIVATE STORED PROCEDURES IN SSIS
sp_configure 'show advanced options', 1
GO
RECONFIGURE;
GO 
sp_configure 'Agent XPS', 1;
GO
RECONFIGURE
GO;

-- COMMAND TO SET DB OWNER. Execute this command in your db to set owner to sysadmin account
use [AdventureWorksDW2019] EXEC sp_changedbowner 'sa'