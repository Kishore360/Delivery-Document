SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem.location_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN bbandt_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN bbandt_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma