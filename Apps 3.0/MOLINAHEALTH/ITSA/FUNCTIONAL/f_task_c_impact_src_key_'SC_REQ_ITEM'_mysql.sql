SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.impact' ELSE 'SUCCESS' END as Message 
FROM (
SELECT SRC.sys_id,TRGT.row_id,SRC.impact,SRC.sys_class_name,SRC.sys_created_on,SRC.opened_at,TRGT.pivot_date,
COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end) , (TRGT.impact_src_key) 
FROM molinahealth_mdsdb.task_final  SRC 
JOIN molinahealth_mdwdb.f_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
JOIN molinahealth_mdwdb.d_lov LKP 
ON COALESCE( concat( 'IMPACT~SC_REQ_ITEM~~~' ,upper( SRC.impact)),'UNSPECIFIED') = LKP.row_id and SRC.sys_class_name = 'SC_REQ_ITEM' 
AND TRGT.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<>(TRGT.impact_src_key) 

) a