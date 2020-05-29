
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.age' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.state_src_key = LKP.src_key
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.state_src_key = LKP.src_key
AND LKP.dimension_wh_code IN ('RESOLVED','CLOSED') and LKP.dimension_class = 'STATE~WORK_ORDER_TASK'
WHERE TIMESTAMPDIFF(SECOND, convert_tz(convert_tz(SRC.reported_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), 
coalesce(convert_tz(convert_tz(SRC.last_resolved_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), 
convert_tz(convert_tz(SRC.closed_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))) <> TRGT.age) a; 