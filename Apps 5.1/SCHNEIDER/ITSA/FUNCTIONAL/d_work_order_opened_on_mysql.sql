SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.opened_on' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT ON (SRC.work_order_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.submit_date,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> (TRGT.opened_on) 
