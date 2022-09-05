CREATE VIEW [dbo].[Total_FactInternetSales]
AS
SELECT
	OrderDate,
	CustomerKey,
	CurrencyKey,
	SUM(DiscountAmount) Total_DiscountAmount,
	SUM(ProductStandardCost) Total_ProductStandardCost,
	SUM(TotalProductCost) Total_TotalProductCost, 
	SUM(SalesAmount) TotalSalesAmount
FROM dbo.FactInternetSales
GROUP BY OrderDate, CustomerKey, CurrencyKey;

-- IF WE WANT TO INCREASE PERFORMANCE, WE NEED TO ATTACH AN INDEX TO THE VIEW.
-- Every time we reference or select from the view, it goes to the tables, pulls the data performs al lthe necessary calculation and then display the data.
-- In the other hand, if we have an index, that forces the machine to create a secondary copy of the data, that's already been aggregated.

ALTER VIEW [dbo].[Total_FactInternetSales]
WITH SCHEMABINDING --This creates a relationship between our view and the underlining tables. 
AS
SELECT
	OrderDate,
	CustomerKey,
	CurrencyKey,
	SUM(DiscountAmount) Total_DiscountAmount,
	SUM(ProductStandardCost) Total_ProductStandardCost,
	SUM(TotalProductCost) Total_TotalProductCost, 
	SUM(SalesAmount) TotalSalesAmount,
	COUNT_BIG(*) RecordCount --requirement in order to add an index onto any view that has a group by clause. A count field has to be inplace
FROM dbo.FactInternetSales
GROUP BY OrderDate, CustomerKey, CurrencyKey;

--After the upwards code, we are ready to create an index
CREATE UNIQUE CLUSTERED INDEX [IX_Total_FactInternetSales]
ON [dbo].[Total_FactInternetSales] (OrderDate, CustomerKey, CurrencyKey) --These fields are choosen because it is more likely to search by or sort by

