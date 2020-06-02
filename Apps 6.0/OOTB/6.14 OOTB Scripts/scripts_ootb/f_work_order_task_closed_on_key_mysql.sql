SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for 
f_work_order_task.closed_on_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.f_work_order_task TRGT ON 
(SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_calendar_date LKP ON  
date_format(convert_tz(SRC.closed_time,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)) = LKP.row_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_time 
IS NULL THEN '' else '' end)<> (TRGT.closed_on_key) 
