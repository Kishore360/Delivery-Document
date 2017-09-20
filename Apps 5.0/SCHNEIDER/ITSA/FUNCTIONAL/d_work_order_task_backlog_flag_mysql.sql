SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.backlog_flag' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join schneider_mdwdb.f_work_order_task f 
on TRGT.row_key=f.work_order_task_key 
join schneider_mdwdb.d_lov_map lkp 
on TRGT.work_order_task_state_key=lkp.src_key  and lkp.dimension_class='STATE~WORK_ORDER_TASK'
WHERE CASE WHEN lkp.dimension_wh_code in ('OPEN') then 'Y' else 'N' end <> TRGT.backlog_flag
