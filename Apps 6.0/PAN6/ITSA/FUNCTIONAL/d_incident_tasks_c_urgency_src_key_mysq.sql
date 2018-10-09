SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.u_incident_tasks_final SRC 
 LEFT JOIN pan6_mdwdb.d_incident_tasks_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN pan6_mdwdb.d_lov LKP on
CONCAT('URGENCY','~','TASK','~',UPPER(SRC.urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else '-1' end) <> TRGT.URGENCY_SRC_KEY;