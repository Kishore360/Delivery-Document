




SELECT CASE WHEN  COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN COUNT(1) >0 THEN ' Values are not in (''Y'',''N'') for #COL_NAME' 
ELSE '#COL_NAME has correct values' END AS Message FROM <<tenant>>_mdwdb.<<tablename>> WHERE  coalesce(#COL_NAME,#COL_NAME,'NULL') NOT IN ('Y','N')
AND row_key not in (0,-1)
