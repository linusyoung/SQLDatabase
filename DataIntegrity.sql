--DROP TABLE SalesLT.Courier;
--GO

CREATE TABLE SalesLT.Courier
(
CourierID int NOT NULL,
CourierCode char(3) NOT NULL,
CourierName nvarchar(50) NOT NULL,
StartDate smalldatetime null,
ReviewDate smalldatetime null
PRIMARY KEY (CourierID, CourierCode)
);
GO

ALTER TABLE SalesLT.Courier ADD CONSTRAINT [DF_Start_Date] DEFAULT (getdate()) FOR [StartDate];
GO

ALTER TABLE SalesLT.Courier WITH NOCHECK ADD CONSTRAINT [CK_Courier_ReviewDate] CHECK ([ReviewDate] > [StartDate]);
GO

ALTER TABLE SalesLT.Courier CHECK CONSTRAINT [CK_Courier_ReviewDate];
GO

-- foreign key actions
-- 1. NO ACTION, 2. CASCADE, 3. SET DEFAULT, 4. SET NULL
-- examples

CREATE TABLE dbo.Customer
(
	CustomerID int IDENTITY(1,1) PRIMARY KEY,
	CustomerName nvarchar(50) NOT NULL
);
GO

INSERT dbo.Customer
	VALUES ('Marchin A'), ('Test B');
GO

CREATE TABLE dbo.CustomerOrder
(
	CustomerOrderID int IDENTITY(100000,1) PRIMARY KEY,
	CustomerID int NOT NULL
		FOREIGN KEY REFERENCES dbo.Customer(CustomerID),
	OrderAmount decimal(18,2) NOT NULL
);
GO

ALTER TABLE dbo.CustomerOrder
	ADD CONSTRAINT FK_CustomerOrder_Customer
	FOREIGN KEY (CustomerID)
	REFERENCES dbo.Customer(CustomerID)
	ON DELETE CASCADE;
GO
