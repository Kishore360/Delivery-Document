

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident_task.parent_incident_task_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM mcdonalds_mdsdb.incident_task_final SRC 
  JOIN mcdonalds_mdwdb.f_incident_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mcdonalds_mdwdb.d_incident_task LKP 
 ON ( SRC.parent_incident_task= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent_incident_task IS NULL THEN 0 else -1 end)<> (TRGT.parent_incident_task_key))b
