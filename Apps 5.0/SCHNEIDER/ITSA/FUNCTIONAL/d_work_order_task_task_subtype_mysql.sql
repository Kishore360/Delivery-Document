SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.task_subtype' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.tms_task_final  SRC JOIN <<tenant>>_mdwdb.d_work_order_task TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.tasksubtype <> (TRGT.task_subtype) 
