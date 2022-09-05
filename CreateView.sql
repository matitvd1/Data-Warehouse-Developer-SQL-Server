SELECT [SalesTerritoryKey]
      ,[SalesTerritoryAlternateKey]
      ,[SalesTerritoryRegion]
      ,[SalesTerritoryCountry]
      ,[SalesTerritoryGroup]
      ,[SalesTerritoryImage]
FROM [AdventureWorksDW2019].[dbo].[DimSalesTerritory];

SELECT [GeographyKey]
      ,[City]
      ,[StateProvinceCode]
      ,[StateProvinceName]
      ,[CountryRegionCode]
      ,[EnglishCountryRegionName]
      ,[SpanishCountryRegionName]
      ,[FrenchCountryRegionName]
      ,[PostalCode]
      ,[SalesTerritoryKey]
      ,[IpAddressLocator]
FROM [AdventureWorksDW2019].[dbo].[DimGeography];


-- CREATE VIEW 
CREATE VIEW [dbo].[Total_DimTerritoryAndGeography]
AS
SELECT dg.City,
		dg.StateProvinceCode,
		dg.StateProvinceName,
		dg.CountryRegionCode,
		dg.EnglishCountryRegionName,
		dt.SalesTerritoryGroup,
		dt.SalesTerritoryRegion
FROM dbo.DimGeography dg
INNER JOIN dbo.DimSalesTerritory dt
	ON dt.SalesTerritoryKey = dg.SalesTerritoryKey;

 