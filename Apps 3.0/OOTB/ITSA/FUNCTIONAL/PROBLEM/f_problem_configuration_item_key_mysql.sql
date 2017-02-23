SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.problem_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key))temp;
