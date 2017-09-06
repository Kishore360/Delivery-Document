
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.open_to_close_duration' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.f_work_order_task TRGT ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN schneider_mdsdb.d_lov_map LKP 
 ON TRGT.state_src_key = LKP.src_key
WHERE   LKP.dimension_wh_code IN ('CLOSED') 
AND  TIMESTAMPDIFF(SECOND,convert_tz(convert_tz( SRC.create_date,'GMT','America/Los_Angeles'),
'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.closed_time,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))
<> TRGT.open_to_close_duration