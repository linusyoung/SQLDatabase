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

-- query sys views
SELECT * FROM sys.views

-- query sys tables
SELECT * FROM sys.tables

SELECT * FROM sys.objects

SELECT * FROM INFORMATION_SCHEMA.TABLES

--dynamic management view
SELECT * FROM sys.dm_exec_connections

SELECT * FROM sys.dm_exec_sessions

SELECT * FROM sys.dm_exec_query_stats
ORDER BY max_logical_reads

SELECT TOP (20) qs.max_logical_reads,
				st.text FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY qs.max_logical_reads DESC;
GO