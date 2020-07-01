SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_server_c.created_by' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN truist_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma