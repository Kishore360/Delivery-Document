SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.Changed_on' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.f_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.modified_date,'GMT','America/Los_Angeles')<> (TRGT.Changed_on) 
