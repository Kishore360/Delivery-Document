
 
 
 
   SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.time_worked' ELSE 'SUCCESS' END as Message
 FROM(select count(1) cnt from  gogo_mdsdb.wm_task_final SRC 
  JOIN gogo_mdwdb.f_work_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_actual_work_duration))<> (TRGT.actual_work_duration ))temp
 
 
 
 