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