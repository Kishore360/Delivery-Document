SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_incident_tasks_final SRC 
 LEFT JOIN paloalto_mdwdb.d_incident_tasks_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN paloalto_mdwdb.d_lov LKsP on
CONCAT('PRIORITY','~','INCIDENT','_','TASKS','~',UPPER(SRC.priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else '-1' end)<> (TRGT.PRIORITY_SRC_KEY)
and SRC.CDCTYPE='X'