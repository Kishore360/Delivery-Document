



SELECT CASE WHEN ColCount = 0 AND TotalCount >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
 CASE WHEN ColCount = 0 AND TotalCount >0 THEN ' #COLUMN_NAME is all NULL for <<tenant>>_workdb.<<tablename>>' ELSE 'SUCCESS' END AS Message
FROM (SELECT COUNT(DISTINCT #COLUMN_NAME) AS ColCount , COUNT(*) TotalCount
FROM <<tenant>>_workdb.<<tenant>>_workdb.<<tablename>>) A
