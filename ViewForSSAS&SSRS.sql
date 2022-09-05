-- CREATE VIEW TO CONSUME IN SSRS
USE [AdventureWorksDW2019];

CREATE VIEW Report_InternetSales
AS
SELECT
 dbo.FactInternetSales.CurrencyKey,
 dbo.FactInternetSales.OrderQuantity,
 dbo.FactInternetSales.SalesAmount,
 dbo.FactInternetSales.TaxAmt,
 dbo.FactInternetSales.TotalProductCost,
 dbo.DimCustomer.FirstName,
 dbo.DimCustomer.MiddleName,
 dbo.DimCustomer.LastName,
 dbo.DimProduct.EnglishProductName,
 dbo.DimGeography.City,
 dbo.DimGeography.StateProvinceName,
 dbo.DimProduct.ProductKey,
 dbo.DimGeography.GeographyKey,
 dbo.DimCustomer.CustomerKey
FROM dbo.DimGeography
INNER JOIN dbo.DimCustomer
	ON dbo.DimCustomer.GeographyKey = dbo.DimGeography.GeographyKey
INNER JOIN dbo.FactInternetSales
	ON dbo.FactInternetSales.CustomerKey = dbo.DimCustomer.CustomerKey
INNER JOIN dbo.DimProduct
	ON dbo.DimProduct.ProductKey = dbo.FactInternetSales.ProductKey
WHERE dbo.FactInternetSales.CurrencyKey = 100;