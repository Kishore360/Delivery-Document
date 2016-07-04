SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.closed_on_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.task_final SRC
LEFT JOIN <<tenant>>_mdwdb.f_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.closed_at,source_time_zone,target_time_zone),'%Y%m%d') and LKP.source_id=0)
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 ON (SRC.state=LM.dimension_code
 AND SRC.sourceinstance=LM.source_id AND LM.dimension_class = 'STATE~TASK' )
WHERE CASE WHEN LM.dimension_wh_code='CLOSED' THEN (COALESCE(LKP.row_key,CASE WHEN SRC.closed_at IS NULL THEN '' else '-1' end)) else '' END <> COALESCE(TRGT.closed_on_key,'') 
  





