SET group_concat_max_len = 18446744073709551615;
SELECT concat(
'SELECT DISTINCT CASE WHEN cnt> 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS RESULT, CASE WHEN cnt >0 THEN ''UNKNOWN HAVING -1 IN FEW TABLES'' ELSE ''SUCCESS'' END AS Message FROM (SELECT (tName) AS table1 , (UNKNOWN) AS cnt FROM (',group_concat('SELECT ''',cols.table_name,''' as tName,''', cols.column_name,''' as Cname ,','count(*) as totalrecs, COUNT(CASE WHEN ', cols.column_name,' = ''-1'' THEN 1 ELSE NULL END) as UNKNOWN, COUNT(CASE WHEN ', cols.column_name,' = ''0'' THEN 1 ELSE NULL END) as UNSPECIFIED FROM ',cols.table_schema,'.',cols.table_name separator ' UNION ALL '),')a WHERE UNKNOWN>0)b') INTO @sql
FROM information_schema.COLUMNS cols INNER JOIN information_schema.TABLES tbl ON  cols.table_name = tbl.TABLE_NAME
AND cols.TABLE_SCHEMA=tbl.table_schema where tbl.TABLE_ROWS>2 AND cols.table_name LIKE 'f\_%' AND cols.column_name LIKE '%\_key'
AND cols.column_name NOT LIKE 'row\_%key' AND tbl.TABLE_TYPE = 'BASE TABLE' AND cols.TABLE_SCHEMA = '<<tenant>>_mdwdb';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;