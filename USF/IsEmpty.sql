
SELECT CASE WHEN COUNT(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) = 0 THEN '<<tablename>> has no records' ELSE '' END AS Message 
FROM <<tablename>>
