SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.project_scope_color_c_key' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.pm_project_final SRC
 LEFT JOIN weillcornell_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN weillcornell_mdwdb.d_calendar_date LKP 
on LKP.row_id  = CONCAT(date_format(convert_tz(SRC.work_start,'GMT','America/New_York'),'%Y%m%d'),'~2')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.work_start IS NULL THEN 0 else '-1' end)  <> TRGT.actual_start_on_fiscal_c_key
