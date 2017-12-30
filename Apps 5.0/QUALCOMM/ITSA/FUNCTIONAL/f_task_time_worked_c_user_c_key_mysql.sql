SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_time_worked_c.user_c_key

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.task_time_worked_final SRC 
LEFT JOIN qualcomm_mdwdb.f_task_time_worked_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON CONCAT('INTERNAL_CONTACT~',SRC.user)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
BETWEEN LKP.effective_from AND LKP.effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.user IS NULL THEN 0 else -1 end) <> (TRGT.user_c_key
);


