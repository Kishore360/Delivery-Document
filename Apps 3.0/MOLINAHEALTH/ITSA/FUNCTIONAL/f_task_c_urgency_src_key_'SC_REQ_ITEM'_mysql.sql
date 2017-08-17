SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdsdb.task_final  SRC 
JOIN molinahealth_mdwdb.f_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
JOIN molinahealth_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~SC_REQ_ITEM~~~' ,upper( SRC.urgency)),'UNSPECIFIED') = LKP.row_id and SRC.sys_class_name = 'SC_REQ_ITEM' 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 
