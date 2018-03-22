SELECT CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt  THEN 'MDS to DWH data validation failed for f_task_c.impact' ELSE 'SUCCESS' END as Message 
FROM (select count(1) cnt from
(select sys_id,sourceinstance,impact  from molinahealth_mdsdb.task_final where sys_class_name='sc_req_item' ) SRC 
JOIN molinahealth_mdwdb.f_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
left JOIN molinahealth_mdwdb.d_lov LKP 
ON  concat( 'IMPACT~SC_REQ_ITEM~~~' ,upper( SRC.impact))= LKP.row_id  
AND TRGT.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<>(TRGT.impact_src_key) 

) a