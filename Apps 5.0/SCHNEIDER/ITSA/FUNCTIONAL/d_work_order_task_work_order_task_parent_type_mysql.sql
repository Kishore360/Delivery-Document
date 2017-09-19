SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.work_order_task_parent_type_code' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.parent_type <> (TRGT.work_order_task_parent_type_code) 
