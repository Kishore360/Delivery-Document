
 
 SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) CNT  from 
 gogo_mdsdb.wm_task_final SRC
 LEFT JOIN gogo_mdwdb.d_configuration_item LKP 
on (LKP.row_id = SRC.cmdb_ci AND SRC.sourceinstance= LKP.source_id ) 
  JOIN gogo_mdwdb.f_work_order_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,case when SRC.cmdb_ci is null then 0 else -1 end )<>(TRGT.configuration_item_key))temp;
 
 