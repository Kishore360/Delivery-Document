SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.sc_task_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join nbcu_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
where dimension_wh_code IN ('OPEN') and 
case WHEN dimension_wh_code IN ('OPEN') then -99 end
 <> coalesce(TRGT.open_to_close_duration,-99)