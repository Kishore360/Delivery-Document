SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pan_mdsdb.u_incident_tasks_final SRC 
 LEFT JOIN pan_mdwdb.d_incident_tasks_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN pan_mdwdb.d_lov LKP on
CONCAT('PRIORITY','~','INCIDENT','_','TASKS','~','~','~',UPPER(SRC.priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE LKP.soft_deleted_flag='N' and TRGT.soft_deleted_flag='N' and COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else '-1' end)<> (TRGT.PRIORITY_SRC_KEY)