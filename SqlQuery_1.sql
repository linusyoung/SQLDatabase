/*
	Section 2 codes - tables
*/

CREATE TABLE SalesLT.Courier
(
CourierID int NOT NULL,
CourierCode char(3) NOT NULL,
CourierName nvarchar(50) NOT NULL,
PRIMARY KEY (CourierID, CourierCode)
)

ALTER TABLE SalesLT.Courier
ADD Telephone varchar(15) NULL, Email varchar(25) NULL;

DROP TABLE SalesLT.Courier;