SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.age_key' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.tms_task_final  SRC JOIN <<tenant>>_mdwdb.f_work_order_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
where  TIMESTAMPDIFF (SECOND,EffortTrackingStartTime, EffortTrackingEndTime ) <> total_duration


