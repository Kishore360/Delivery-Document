		SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_time_worked_c.task_key

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.task_time_worked_final SRC 
LEFT JOIN qualcomm_mdsdb.task_final task 
                ON SRC.sourceinstance = task.sourceinstance 
                AND SRC.task = task.sys_id  
LEFT JOIN qualcomm_mdwdb.f_task_time_worked_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   join qualcomm_mdwdb.d_task LKP 
	on                SRC.task=LKP.row_id and SRC.sourceinstance=LKP.source_id 
	AND task.sys_class_name='sc_task'

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 else -1 end) <> (TRGT.task_key
);
