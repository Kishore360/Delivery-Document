SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_server_c.created_on' ELSE 'SUCCESS' END as Message
 FROM (select * from truist_mdsdb.cmdb_ci_server_final where cdctype <>'D') SRC 
 LEFT JOIN truist_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CONVERT_TZ (SRC.sys_created_on,'GMT','America/New_York')<> TRGT.created_on