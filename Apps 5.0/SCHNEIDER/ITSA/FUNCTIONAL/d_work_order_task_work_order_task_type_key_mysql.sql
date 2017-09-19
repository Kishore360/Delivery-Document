SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.work_order_task_type_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
left join schneider_mdwdb.d_lov lkp  on COALESCE(CONCAT('TASK_TYPE','~','WORK_ORDER_TASK','~','~','~',UPPER(tms_task.tasktype)),
'UNSPECIFIED')  = lkp.row_id
WHERE coalesce (lkp.row_key case when SRC.tasktype is null then 0 else -1 end)  <>  TRGT.work_order_task_type_key
