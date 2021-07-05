

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident_task.parent_incident_task_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM mcd_mdsdb.incident_task_final SRC 
  JOIN mcd_mdwdb.f_incident_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mcd_mdwdb.d_incident LKP 
 ON ( SRC.parent= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent IS NULL THEN 0 else -1 end)<> (TRGT.parent_incident_key))b;
