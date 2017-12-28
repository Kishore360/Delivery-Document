

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_start_on_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN qualcomm_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.work_start,'GMT','GMT'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.work_start IS NULL THEN '' else '-1' end)  <> COALESCE(TRGT.actual_start_on_key,'') 
