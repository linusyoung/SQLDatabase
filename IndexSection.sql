-- information for index

-- SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'DETAILED') as phys
SELECT obj.name, phys.* FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMIITED') as phys
JOIN sys.objects as obj on obj.object_id = phys.object_id
ORDER BY avg_fragmentation_in_percent DESC;

-- Viewing index statistics
DBCC SHOW_STATISTICS("SalesLT.SalesOrderDetail", PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID);

-- Add clustered index as constraint
ADD CONSTRAINT AK_Password UNIQUE (PasswordHash, PasswordSalt);  

CREATE CLUSTERED INDEX AK_Password
    ON dbo.TestTable (TestCol1);   