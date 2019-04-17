SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_time_worked_c.created_on_key

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.task_time_worked_final SRC 
LEFT JOIN qualcomm_mdwdb.f_task_time_worked_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_calendar_date lkp 
on date_format(CONVERT_TZ(sys_created_on,'GMT','GMT'),'%Y%m%d') =lkp.row_id 
 WHERE COALESCE(lkp.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN 0 else -1 end) <> (TRGT.created_on_key
);


