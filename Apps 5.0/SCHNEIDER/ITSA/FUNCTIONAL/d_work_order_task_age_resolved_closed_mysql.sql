
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.age' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.d_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.work_order_task_state_key = LKP.src_key
AND LKP.dimension_wh_code IN ('RESOLVED','CLOSED') and LKP.dimension_class = 'STATE~WORK_ORDER_TASK'
WHERE TIMESTAMPDIFF(DAY, convert_tz(TRGT.opened_on,'GMT','America/Los_Angeles'), 
convert_tz(TRGT.closed_on,'GMT','America/Los_Angeles')) <> TRGT.age; 