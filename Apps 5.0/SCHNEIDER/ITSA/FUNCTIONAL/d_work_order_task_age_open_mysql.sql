SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.age' ELSE 'SUCCESS' END as Message  FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.work_order_task_state_key = LKP.src_key
AND LKP.dimension_wh_code IN ('OPEN') and LKP.dimension_class = 'STATE~WORK_ORDER_TASK'
JOIN (select max(lastupdated) as lastupdated,source_id from schneider_workdb.d_o_data_freshness group by source_id) df ON TRGT.source_id = df.source_id
WHERE TIMESTAMPDIFF(DAY,CONVERT_TZ(TRGT.opened_on,'America/Los_Angeles','GMT'), CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT')) <> TRGT.age;



