SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_server_c.cpu_core_thread' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN bbandt_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.cpu_core_thread,'')<> COALESCE(TRGT.cpu_core_thread ,'')
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='Y')ma