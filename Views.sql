CREATE VIEW SalesLT.vHighValueSales
WITH ENCRYPTION, SCHEMABINDING,
VIEW_METADATA
AS
SELECT SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader
WHERE SubTotal > 100
GO

DROP VIEW SalesLT.vHighValueSales;
GO

ALTER VIEW SalesLT.vHighValuesSales
WITH ENCRYPTION, SCHEMABINDING,
VIEW_METADATA
AS
SELECT SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader
WHERE SubTotal > 100
WITH CHECK OPTION
GO

--check view defination
SELECT OBJECT_DEFINITION(OBJECT_ID('SalesLT.vProductAndDescription'));
GO