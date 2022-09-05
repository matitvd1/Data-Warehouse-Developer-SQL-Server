USE [AdventureWorksDW2019]
GO

sp_changedbowner 'sa'

EXEC sys.sp_cdc_enable_db
GO

--Change data capture have to enabled for each table individually if wanted
EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'DimAccount',  
@role_name     = N'MyRole',  
@filegroup_name = N'Primary',  
@supports_net_changes = 1  
GO  