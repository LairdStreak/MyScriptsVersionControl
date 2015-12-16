with fs
as
(
select i.object_id,
        p.rows AS RowCounts,
        SUM(a.total_pages) * 8 AS TotalSpaceKb
from     sys.indexes i INNER JOIN 
        sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id INNER JOIN 
         sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    i.OBJECT_ID > 255 
GROUP BY 
    i.object_id,
    p.rows
)

SELECT 
    SchemaName = (Select name from sys.schemas Where schema_id = t.schema_id),
    t.NAME AS TableName,
    fs.RowCounts,
    fs.TotalSpaceKb,
	fs.TotalSpaceKb / 1024 as SpaceMB,
	(fs.TotalSpaceKb / 1024) / 1024 as SpaceGB,
    t.create_date,
    t.modify_date,
    ( select COUNT(1)
        from sys.columns c 
        where c.object_id = t.object_id ) TotalColumns    
FROM 
    sys.tables t INNER JOIN      
    fs  ON t.OBJECT_ID = fs.object_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
ORDER BY 
    fs.TotalSpaceKb DESC

	--Select * from sys.schemas