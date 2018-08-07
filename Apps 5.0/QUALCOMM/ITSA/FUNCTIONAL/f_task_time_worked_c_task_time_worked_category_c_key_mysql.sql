SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_time_worked_c.task_time_worked_category_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT Count(1) AS CNT 
FROM qualcomm_mdsdb.task_time_worked_final SRC 
LEFT JOIN qualcomm_mdwdb.f_task_time_worked_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON COALESCE( CONCAT('U_TASK_CATEGORY','~','TASK_TIME_WORKED','~','~','~',(SRC.u_task_category)),'UNSPECIFIED')= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
BETWEEN LKP.effective_from AND LKP.effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_task_category IS NULL THEN 0 else -1 end) <> (TRGT.task_time_worked_category_c_key
)
) temp;


