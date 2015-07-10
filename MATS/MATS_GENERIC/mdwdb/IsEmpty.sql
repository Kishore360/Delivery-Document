




SELECT CASE WHEN COUNT(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) = 0 THEN '<<tenant>>_mdwdb.<<tablename>> has no records' ELSE '' END AS Message 
FROM <<tenant>>_mdwdb.<<tablename>>
