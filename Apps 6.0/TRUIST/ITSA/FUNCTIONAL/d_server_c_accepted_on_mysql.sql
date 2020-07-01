SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_server_c.accepted_on' ELSE 'SUCCESS' END as Message
 FROM truist_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN truist_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CONVERT_TZ (SRC.u_accepted,'GMT','America/Los_Angeles')<> TRGT.accepted_on