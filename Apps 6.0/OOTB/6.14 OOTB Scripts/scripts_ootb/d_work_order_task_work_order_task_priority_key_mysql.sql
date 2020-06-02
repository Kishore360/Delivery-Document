SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.work_order_task_priority_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_lov LKP ON ( concat( 'PRIORITY~WORK_ORDER_TASK~' ,upper( SRC.priority)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.work_order_task_priority_key) 
