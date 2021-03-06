SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdsdb.incident_final  SRC 
JOIN molinahealth_mdwdb.f_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
left JOIN molinahealth_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~TASK~~~' ,upper( SRC.urgency)),'UNSPECIFIED') = LKP.row_id  DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN LKP.effective_from AND LKP.effective_to
WHERE SRC.sys_class_name = 'INCIDENT'  and COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 
