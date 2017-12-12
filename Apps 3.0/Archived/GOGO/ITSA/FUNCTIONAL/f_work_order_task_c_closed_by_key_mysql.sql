
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_task_final SRC
 LEFT JOIN gogo_mdwdb.f_work_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 LEFT JOIN gogo_mdwdb.d_internal_contact LKP 
on (LKP.row_id = concat('INTERNAL_CONTACT~',SRC.closed_by)) 
 WHERE COALESCE(LKP.row_key,case when SRC.closed_by is null then 0 else -1 end )<>(TRGT.closed_by_key)
 
 