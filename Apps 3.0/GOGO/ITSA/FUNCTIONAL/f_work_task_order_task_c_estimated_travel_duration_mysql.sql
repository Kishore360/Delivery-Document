
 
 
  SELECT 
  CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.time_worked' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM gogo_mdsdb.wm_task_final SRC 
 LEFT JOIN gogo_mdwdb.f_work_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.estimated_travel_duration),'')<> COALESCE(TRGT.estimated_travel_duration ,'')
)temp;

 
 
 
 