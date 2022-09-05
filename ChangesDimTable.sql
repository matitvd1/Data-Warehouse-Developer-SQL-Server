-- Look for changes in the dbo.DimAccount table
USE [AdventureWorksDW2019]

SELECT *
FROM CHANGETABLE(CHANGES [dbo].[DimAccount],0) AS t

-- The change tracking gives you a cluew what row was changed