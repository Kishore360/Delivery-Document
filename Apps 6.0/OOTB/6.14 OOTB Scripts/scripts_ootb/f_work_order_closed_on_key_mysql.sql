SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.closed_on_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_calendar_date LKP ON  date_format(convert_tz(SRC.completed_date,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)) = LKP.row_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.completed_date IS NULL THEN 0 else -1 end)<> (TRGT.closed_on_key) 
