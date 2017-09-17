SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.work_order_task_child_type_key' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.tms_task_final  SRC JOIN <<tenant>>_mdwdb.d_work_order_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN <<tenant>>_mdwdb.d_lov LKP ON ( concat( 'CHILDTYPE~WORK_ORDER_TASK~~~' ,upper( SRC.child_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.child_type IS NULL THEN 0 else -1 end)<> (TRGT.work_order_task_child_type_key) 
