SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.reopened_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM  <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.soft_deleted_flag='N' and ( CASE WHEN SRC.reopen_count > 0 then 'Y' else 'N' END)<> (TRGT.reopened_flag ))b
