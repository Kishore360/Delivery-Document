

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_incident LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id and LKP.soft_deleted_flag='N' )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_key))b
