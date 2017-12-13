SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_server_c.name' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN bbandt_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.name,'')<> COALESCE(TRGT.name ,'')