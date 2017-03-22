
 
 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM gogo_mdsdb.wm_task_final SRC
LEFT JOIN gogo_mdwdb.d_internal_organization LKP 
on (LKP.row_id =  concat('GROUP~',SRC.dispatch_group))
 JOIN gogo_mdwdb.f_work_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE(LKP.row_key,case when SRC.dispatch_group is null then 0 else -1 end )<>(TRGT.dispatch_group_key)
 AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to)temp;
 
 
 