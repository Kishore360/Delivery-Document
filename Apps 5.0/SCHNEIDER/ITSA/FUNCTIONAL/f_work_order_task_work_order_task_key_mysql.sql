SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.work_order_task_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.f_work_order_task TRGT ON (SRC.task_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join schneider_mdwdb.d_work_order_task a on a.row_id  = SRC.task_id and SRC.sourceinstance = a.source_id  
WHERE coalesce (a.row_key, case when SRC.task_id is null then 0 else  -1 end)  <> (TRGT.work_order_task_key) 
