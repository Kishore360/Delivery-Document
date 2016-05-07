
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_task_final SRC
 LEFT JOIN gogo_mdwdb.f_work_task_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN gogo_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.estimated_end,'GMT','America/Chicago'),'%Y%m%d') )
 WHERE COALESCE(LKP.row_key,case when SRC.estimated_end is null then 0 else -1 end )<>(TRGT.estimated_end_on_key)