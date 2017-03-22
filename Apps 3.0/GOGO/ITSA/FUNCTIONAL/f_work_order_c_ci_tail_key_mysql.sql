 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM gogo_mdsdb.wm_order_final SRC
 LEFT JOIN gogo_mdwdb.d_configuration_item LKP 
on (LKP.row_id = COALESCE(SRC.u_cmdb_ci_tail,'UNSPECIFIED') ) 
 JOIN gogo_mdwdb.f_work_order_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,case when SRC.u_cmdb_ci_tail is null then 0 else -1 end )<>(TRGT.ci_tail_key))a;
 
 