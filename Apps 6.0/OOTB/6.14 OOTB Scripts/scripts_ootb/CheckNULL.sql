
SELECT CASE WHEN COUNT(#COL_NAME) <> 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN  COUNT(#COL_NAME) <> 0 THEN '#COL_NAME has NULL values' ELSE 'SUCCESS' END AS Message 
FROM #TABLE_NAME 
WHERE #COL_NAME IS NULL

